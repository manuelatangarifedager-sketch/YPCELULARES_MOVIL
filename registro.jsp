<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Registro de Usuario</title>

    <!--  Responsive -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            background: #fff;
            padding: 30px;
            width: 380px;
            max-width: 90%;
            border-radius: 14px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
        }

        input, textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 15px;
        }

        textarea {
            resize: none;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background: #0056b3;
        }

        .link {
            display: block;
            margin-top: 15px;
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        @media (max-width: 480px) {
            .card {
                padding: 22px;
            }

            h2 {
                font-size: 22px;
            }
        }
    </style>
</head>

<body>

<div class="container">
    <div class="card">

        <h2>📝 Registro de Usuario</h2>

        <form action="RegistroServlet" method="post">

            <input type="text" name="nombre" placeholder="Nombre completo" required>

            <input type="email" name="correo" placeholder="Correo electrónico" required>

            <input type="password" name="password" placeholder="Contraseña" required>

            <input type="text" name="telefono" placeholder="Teléfono">

            <textarea name="direccion" placeholder="Dirección" rows="3"></textarea>

            <button type="submit">Registrarse</button>
        </form>

        <a class="link" href="login.jsp">⬅ Volver al login</a>

    </div>
</div>

</body>
</html>
