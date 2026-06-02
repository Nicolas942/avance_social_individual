<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Seleccionar usuario</title>
</head>
<body>

    <h1>Seleccione el tipo de usuario</h1>

    <form action="vista/login_vista.php" method="GET">

        <button type="submit" name="tipo_usuario" value="Estudiante">
            Estudiante
        </button>

        <button type="submit" name="tipo_usuario" value="Supervisor">
            Supervisor/Docente
        </button>

        <button type="submit" name="tipo_usuario" value="Padre de familia">
            Padre de familia
        </button>

        <button type="submit" name="tipo_usuario" value="Coordinador">
            Coordinador
        </button>

    </form>

</body>
</html>