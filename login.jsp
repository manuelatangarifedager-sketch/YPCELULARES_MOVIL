<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Login - YP CELULARES</title>

    <!-- ✅ CLAVE PARA MÓVIL -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #ffffff;
            color: #222;
            margin: 0;
        }

        header {
            background-color: #FFD700;
            color: #000;
            text-align: center;
            padding: 16px 0;
            font-size: 1.6rem;
            font-weight: bold;
            letter-spacing: 2px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }

        .login-body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 70px); /* mejor que height */
            padding: 1rem;
            background-image: linear-gradient(135deg, #fff 70%, #FFD700 30%);
        }

        .login-container {
            background: #fff;
            padding: 2rem 1.5rem;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
            width: 100%;
            max-width: 360px;
            text-align: center;
            border-top: 6px solid #FFD700;
        }

        .login-title {
            margin-bottom: 1.5rem;
            font-size: 1.5rem;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 0.8rem;
            margin-bottom: 1rem;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1rem;
        }

        input:focus {
            border-color: #FFD700;
            outline: none;
        }

        .btn-login {
            width: 100%;
            background-color: #FFD700;
            border: none;
            padding: 0.9rem;
            font-size: 1rem;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
        }

        .btn-login:hover {
            background-color: #e6c200;
        }

        hr {
            margin: 1.5rem 0;
            width: 100%;
        }

        a {
            color: #000;
            font-weight: 600;
        }

        .error-msg {
            color: #d11a2a;
            margin-top: 0.8rem;
        }

        /* TABLET / DESKTOP */
        @media (min-width: 768px) {
            header {
                font-size: 2rem;
            }
        }
    </style>
</head>

<body>
<header>YP CELULARES</header>

<div class="login-body">
    <div class="login-container">
        <h2 class="login-title">Iniciar Sesión</h2>

        <form action="LoginServlet" method="post">
            <input type="text" name="correo" placeholder="Correo" required>
            <input type="password" name="password" placeholder="Contraseña" required>
            <button type="submit" class="btn-login">Ingresar</button>
        </form>

        <hr>

        <p>
            ¿No tienes cuenta?
            <a href="registro.jsp">Regístrate aquí</a>
        </p>

        <p class="error-msg">${error}</p>
    </div>
</div>
</body>
</html>

