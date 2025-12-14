<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.loginrolesapp.modelo.Producto" %>
<%
List<Producto> carrito = (List<Producto>) request.getAttribute("carrito");
Double total = (Double) request.getAttribute("total");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>🛒 Mi Carrito</title>

    <!-- 🔑 Responsive -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin: 20px 0;
        }

        /* ===== TABLE DESKTOP ===== */
        table {
            border-collapse: collapse;
            width: 90%;
            margin: auto;
            background: #fff;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        /* ===== BUTTONS ===== */
        .btn {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 8px 14px;
            cursor: pointer;
            border-radius: 6px;
            font-weight: bold;
        }

        .btn-vaciar {
            background-color: #6c757d;
        }

        .btn-confirmar {
            background-color: #28a745;
        }

        /* ===== TOTAL ===== */
        .total {
            text-align: right;
            margin: 15px 5%;
            font-size: 18px;
            font-weight: bold;
        }

        /* ===== LINKS ===== */
        .links {
            text-align: center;
            margin: 20px 0;
        }

        .links a {
            margin: 0 10px;
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        /* ===== MOBILE ===== */
        @media (max-width: 768px) {

            table, thead, tbody, th, td, tr {
                display: block;
                width: 100%;
            }

            thead {
                display: none;
            }

            tr {
                background: #fff;
                margin: 15px;
                border-radius: 12px;
                padding: 15px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }

            td {
                border: none;
                text-align: left;
                padding: 6px 0;
            }

            td::before {
                font-weight: bold;
                display: block;
                color: #555;
            }

            td:nth-of-type(1)::before { content: "Producto"; }
            td:nth-of-type(2)::before { content: "Precio"; }
            td:nth-of-type(3)::before { content: "Cantidad"; }
            td:nth-of-type(4)::before { content: "Subtotal"; }
            td:nth-of-type(5)::before { content: "Acción"; }

            .btn {
                width: 100%;
                margin-top: 6px;
            }

            .total {
                text-align: center;
                margin: 10px;
            }
        }
    </style>
</head>

<body>

<h2>🛒 Carrito de Compras</h2>

<% if (carrito == null || carrito.isEmpty()) { %>

    <p style="text-align:center;">Tu carrito está vacío.</p>

<% } else { %>

    <table>
        <thead>
        <tr>
            <th>Producto</th>
            <th>Precio</th>
            <th>Cantidad</th>
            <th>Subtotal</th>
            <th>Acción</th>
        </tr>
        </thead>

        <tbody>
        <% for (Producto p : carrito) {
            double subtotal = p.getPrecio() * p.getCantidad();
        %>
        <tr>
            <td><%= p.getNombre() %></td>
            <td>$<%= String.format("%.2f", p.getPrecio()) %></td>
            <td><%= p.getCantidad() %></td>
            <td>$<%= String.format("%.2f", subtotal) %></td>
            <td>
                <form action="CarritoClienteServlet" method="post" style="margin:0;">
                    <input type="hidden" name="accion" value="eliminar">
                    <input type="hidden" name="id" value="<%= p.getId() %>">
                    <input class="btn" type="submit" value="❌ Eliminar">
                </form>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <div class="total">
        Total: $<%= String.format("%.2f", total) %>
    </div>

    <div class="links">
        <form action="CarritoClienteServlet" method="post" style="display:inline;">
            <input type="hidden" name="accion" value="vaciar">
            <input class="btn btn-vaciar" type="submit" value="🗑 Vaciar carrito">
        </form>
    </div>

<% } %>

<div class="links">
    <a href="ProductoServlet">⬅️ Seguir comprando</a>
    <a href="PrincipalClienteServlet">🏠 Volver al inicio</a>
</div>

<div class="links">
    <form action="FacturacionServlet" method="get">
        <input class="btn btn-confirmar" type="submit" value="✅ Continuar con la compra">
    </form>
</div>

</body>
</html>
