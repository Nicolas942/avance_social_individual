<?php

require(__DIR__."/../config/conexion.php");

session_start();

function validar_usuario($correo, $contrasena, $tipo_usuario)

{
    $conexion = conectar();

    $tablasPermitidas = [

        "Estudiante"    => "Estudiante",
        "Supervisor"    => "Supervisor",
        "Padre_familia" => "Padre_familia",
        "Coordinador"   => "Coordinador"

    ];

    if(!array_key_exists($tipo_usuario, $tablasPermitidas))
    {
        die("Tipo de usuario no válido");
    }

    $tabla = $tablasPermitidas[$tipo_usuario];

    $sql = "SELECT * 
            FROM $tabla
            WHERE correo='$correo'
            AND contraseña='$contrasena'";

    $consulta = mysqli_query($conexion, $sql);

    if(!$consulta)
    {
        die("Error SQL: ".mysqli_error($conexion));
    }

    $resultado = mysqli_fetch_assoc($consulta);

    if($resultado)
    {
        $_SESSION['usuario'] = $resultado['nombre'];
        $_SESSION['correo'] = $resultado['correo'];
        $_SESSION['tipo_usuario'] = $tipo_usuario;

        echo '<script type "text/javascript">
                    window.location.href = "../pagina_usuario.php"
                </script>';
    }
    else
    {
        echo "<h2>Usuario o contraseña incorrectos</h2>";
    }
}

/*
|--------------------------------------------------------------------------
| OBTENER TIPO DE USUARIO
|--------------------------------------------------------------------------
*/

if(!isset($_GET['tipo_usuario']) && !isset($_POST['tipo_usuario']))
{
    die("No se recibió el tipo de usuario");
}

if(isset($_GET['tipo_usuario']))
{
    $tipo_usuario = $_GET['tipo_usuario'];
}
else
{
    $tipo_usuario = $_POST['tipo_usuario'];
}

/*
|--------------------------------------------------------------------------
| PROCESAR LOGIN
|--------------------------------------------------------------------------
*/

if($_SERVER["REQUEST_METHOD"] == "POST")
{
    $correo = $_POST['correo'];
    $contrasena = $_POST['contrasena'];

    validar_usuario(
        $correo,
        $contrasena,
        $tipo_usuario
    );
}

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Inicio de sesión</title>
</head>
<body>

<h1>Inicio de sesión</h1>

<h3>
    Usuario seleccionado:
    <?php echo $tipo_usuario; ?>
</h3>

<form method="POST">

    <input
        type="hidden"
        name="tipo_usuario"
        value="<?php echo $tipo_usuario; ?>"
    >

    <label>Correo:</label>
    <input
        type="email"
        name="correo"
        required
    >

    <br><br>

    <label>Contraseña:</label>
    <input
        type="password"
        name="contrasena"
        required
    >

    <br><br>

    <button type="submit">
        Iniciar sesión
    </button>

</form>

</body>
</html>