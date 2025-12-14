<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.loginrolesapp.modelo.Producto" %>

<%
List<Producto> carrito = (List<Producto>) request.getAttribute("carrito");
Double total = (Double) request.getAttribute("total");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Datos de Facturación</title>

    <!-- 🔑 Responsive -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 30px auto;
            background: #fff;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        h3 {
            margin-top: 25px;
            margin-bottom: 10px;
        }

        textarea, select {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 15px;
        }

        ul {
            padding-left: 20px;
        }

        li {
            margin-bottom: 6px;
        }

        .total {
            font-size: 20px;
            font-weight: bold;
            text-align: right;
            margin-top: 15px;
        }

        .actions {
            margin-top: 25px;
            text-align: center;
        }

        button {
            width: 100%;
            background: #28a745;
            color: white;
            border: none;
            padding: 14px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .back {
            display: block;
            margin-top: 15px;
            text-decoration: none;
            font-weight: bold;
            color: #555;
        }

        /* Desktop */
        @media (min-width: 600px) {
            .actions {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            button {
                width: auto;
                padding: 12px 20px;
            }

            .back {
                margin-top: 0;
            }
        }
    </style>
</head>

<body>

<div class="container">

    <h2>🧾 Datos de Facturación</h2>

    <form action="PedidoServlet" method="post">

        <input type="hidden" name="accion" value="confirmar">

        <h3>📍 Dirección de entrega</h3>
        <textarea name="direccion" required></textarea>

        <h3>💳 Método de pago</h3>
        <select name="metodo_pago" required>
            <option value="Tarjeta">Tarjeta</option>
            <option value="Transferencia">Transferencia</option>
            <option value="Efectivo">Efectivo</option>
        </select>

        <h3>🛒 Resumen</h3>
        <ul>
            <% for (Producto p : carrito) { %>
                <li>
                    <%= p.getNombre() %>
                    x <%= p.getCantidad() %>
                    = $<%= p.getPrecio() * p.getCantidad() %>
                </li>
            <% } %>
        </ul>

        <div class="total">
            Total: $<%= total %>
        </div>

        <div class="actions">
            <button type="submit">✅ Confirmar y pagar</button>
            <a class="back" href="CarritoClienteServlet">⬅ Volver al carrito</a>
        </div>

    </form>

</div>

</body>
</html>
