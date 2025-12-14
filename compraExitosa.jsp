<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Compra exitosa</title>

    <!-- 🔑 Responsive -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            background: #ffffff;
            padding: 35px 30px;
            border-radius: 16px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
            max-width: 420px;
            width: 90%;
        }

        h2 {
            color: #28a745;
            margin-bottom: 10px;
        }

        p {
            color: #333;
            font-size: 16px;
            margin-bottom: 25px;
        }

        .actions a {
            display: block;
            margin: 10px 0;
            padding: 12px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            background: #FFD700;
            color: #000;
            transition: background 0.3s;
        }

        .actions a:hover {
            background: #e6c200;
        }

        /* Desktop */
        @media (min-width: 600px) {
            .actions a {
                display: inline-block;
                width: auto;
                padding: 12px 20px;
                margin: 0 10px;
            }
        }
    </style>
</head>

<body>

    <div class="card">
        <h2>🎉 ¡Compra realizada con éxito!</h2>
        <p>Tu pedido ha sido registrado correctamente.</p>

        <div class="actions">
            <a href="<%= request.getContextPath() %>/ProductoServlet">
                🛍 Seguir comprando
            </a>
            <a href="<%= request.getContextPath() %>/PrincipalClienteServlet">
                🏠 Volver al inicio
            </a>
        </div>
    </div>

</body>
</html>
