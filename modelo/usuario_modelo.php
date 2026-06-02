<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio sesión</title>
</head>
<body>

<form action="" method="POST">

    <label>Tipo de usuario:</label>

    <select name="tipo_usuario">

        <option value="Estudiante">Estudiante</option>
        <option value="Supervisor">Supervisor</option>
        <option value="Padre_familia">Padre de familia</option>
        <option value="Coordinador">Coordinador</option>

    </select>

    <br><br>

    <label>Correo:</label>
    <input type="email" name="correo" required>

    <br><br>

    <label>Contraseña:</label>
    <input type="password" name="contrasena" required>

    <br><br>

    <button type="submit">Ingresar</button>

</form>


<?php

require(__DIR__."/../config/conexion.php");


function validar_usuario($correo,$contrasena,$tipo_usuario){

    $conexion = conectar();

    echo "<br>Función ejecutándose...";

    // Definir tablas permitidas
    $tablasPermitidas=[

        "Estudiante"=>"Estudiante",
        "Supervisor"=>"Supervisor",
        "Padre_familia"=>"Padre_familia",
        "Coordinador"=>"Coordinador"

    ];

    // Verificar si existe
    if(!array_key_exists($tipo_usuario,$tablasPermitidas)){

        die("Tipo usuario no válido");

    }

    // Obtener nombre tabla
    $tabla=$tablasPermitidas[$tipo_usuario];


    $sql="SELECT * FROM $tabla WHERE correo ='$correo' AND contraseña ='$contrasena'";


    $consulta=mysqli_query($conexion,$sql);

    if(!$consulta){

        die("Error: ".mysqli_error($conexion));

    }


    $resultado=mysqli_fetch_assoc($consulta);


    if($resultado){

        echo "<br><br>Usuario encontrado";
        echo "<br>Usuario: ".$resultado['nombre'];
        echo "<br>Apellido paterno: ".$resultado['apellido_paterno'];
        echo "<br>Apellido materno: ".$resultado['apellido_materno'];
        echo "<br>correo: ".$resultado['correo'];


    }else{

        echo "<br><br>Usuario o contraseña incorrectos";

    }

}



if($_SERVER["REQUEST_METHOD"]=="POST"){

    extract($_POST);

    validar_usuario(

        $correo,
        $contrasena,
        $tipo_usuario

    );

}

?>

</body>
</html>