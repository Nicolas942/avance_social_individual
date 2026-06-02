<?php
    require 'config/conexion.php';

    session_start();

    if(isset($_SESSION['username']))
    {
        $nombre_usuario = $_SESSION['username'];
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página del usuario</title>
</head>
<body>
    <h1>Página del usuario</h1>
    <hr>
    <?php
        echo 'Usuario: '.$nombre_usuario;
    ?>
    <hr>
    <h2>Registros</h2>
    <a href="registrar_empleado.php">Registrar empleado</a>
    <hr>
    <h2>Consultas</h2>
    <a href="modelo/consulta_empleados.php">Empleados</a>
    <br>
    <a href="modelo/consulta_departamentos.php">Departamentos</a>
    <hr>
    <h2>Actualizar datos</h2>
    <a href="actualizar_empleado.php">Actualizar datos del empleado</a>
    <hr>
    <h2>Eliminar empleado</h2>
    <a href="eliminar_empleado.php">Eliminar un empleado</a>
    <hr>
    <h2>Salir</h2>
    <a href="modelo/cerrar_sesion.php">Cerrar sesión</a>
</body>
</html>