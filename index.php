<?php
$conect = mysql_connect("localhost","root","root");

if(!$conect){
    echo "<br>No conectado :(";
}

mysql_select_db("pw_equipo", $conect);

if($_POST['nuevo_curso']){
$insertaDatos = "insert into detalle_curso(id_curso, id_nivel, id_salon, dia, hora_inicio, hora_fin) values(".$_POST['id_curso'].", ".$_POST['id_nivel'].", ".$_POST['id_salon'].", '".$_POST['dia']."', '".$_POST['hora_inicio']."', '".$_POST['hora_fin']."')";
mysql_query($insertaDatos, $conect);
}

if($_POST['eliminar_curso']){
    $eliminaDatos = "delete from detalle_curso where id_detalle =".$_POST['id_detalle'];
    mysql_query($eliminaDatos, $conect);
}

$cad = "SELECT * FROM detalle_curso as det join cat_cursos as curso join cat_nivel as nivel join cat_salon as salon where det.id_curso=curso.id_curso and det.id_nivel=nivel.id_nivel and salon.id_salon = det.id_salon";
$cad_curso = "select * from cat_cursos";
$cad_nivel = "select * from cat_nivel";
$cad_salon = "select * from cat_salon";

$resultado = mysql_query($cad, $conect);
$resultado_curso = mysql_query($cad_curso, $conect);
$resultado_nivel = mysql_query($cad_nivel, $conect);
$resultado_salon = mysql_query($cad_salon, $conect);


?>
<html>
    <head>
        <title>Practica captura Cursos</title>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
        <h1>Formulario de Captura de Cursos</h1>

        <form action="index.php" method="post" name="frm_cursos" id="frm_cursos">
            <label for="id_curso">Selecciona el curso:</label>
            <select name="id_curso" id="id_curso">
                <?php
                    while($row = mysql_fetch_array($resultado_curso)){
                        ?>
                        <option value="<?php echo $row['id_curso']; ?>"><?php echo $row['nombre']; ?></option>
                        <?php
                    }
                ?>
            </select>
            <label for="nivel">Selecciona el nivel:</label>
            <select name="id_nivel" id="id_nivel">
                <?php
                while($row = mysql_fetch_array($resultado_nivel)){
                    ?>
                    <option value="<?php echo $row['id_nivel']; ?>"><?php echo $row['nivel']; ?></option>
                <?php
                }
                ?>
            </select>
            <label for="salon">Selecciona el salon:</label>
            <select name="id_salon" id="id_salon">
                <?php
                while($row = mysql_fetch_array($resultado_salon)){
                    ?>
                    <option value="<?php echo $row['id_salon']; ?>"><?php echo $row['salon']; ?></option>
                <?php
                }
                ?>
            </select>
            <label for="dia">Seleccion el dia:</label>
            <input type="text" name="dia" id="dia">
            <label for="hora_inicio">Seleccion la hora de inicio:</label>
            <input type="text" name="hora_inicio" id="hora_inicio">
            <label for="hora_fin">Selecciona la hora de finalizacion:</label>
            <input type="text" name="hora_fin" id="hora_fin">
            <p>
                <input type="submit" name="nuevo_curso" value="Guardar Curso">
            </p>
        </form>
    <h1>Listado de cursos disponibles</h1>
    <table>
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Nivel</th>
                <th>Salon</th>
                <th>dia</th>
                <th>Hora Inicio</th>
                <th>Hora Fin</th>
                <th>Accion</th>
            </tr>
        </thead>
        <tbody>
        <?php
        while($row = mysql_fetch_array($resultado)){
        ?>
            <tr>
                <td><?php echo $row['nombre']; ?></td>
                <td><?php echo $row['nivel']; ?></td>
                <td><?php echo $row['salon']; ?></td>
                <td><?php echo $row['dia']; ?></td>
                <td><?php echo $row['hora_inicio']; ?></td>
                <td><?php echo $row['hora_fin']; ?></td>
                <td><form method="post" name="borra_curso" id="borra_curso" action="index.php"><input type="hidden" name="id_detalle" value="<?php echo $row['id_detalle']; ?>"> <input type="submit" name="eliminar_curso" value="Eliminar"></form></td>
            </tr>
        <?php
        }
        ?>
        </tbody>
    </table>
    </body>
</html>