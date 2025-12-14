<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.loginrolesapp.modelo.Pedido" %>

<%
List<Pedido> pedidos = (List<Pedido>) request.getAttribute("pedidos");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Administrar Pedidos</title>

    <!-- 🔑 RESPONSIVE -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background: #f9f9f9;
        }

        h2 {
            text-align: center;
            margin: 1rem 0;
        }

        /* ===== DESKTOP TABLE ===== */
        table {
            width: 95%;
            margin: auto;
            border-collapse: collapse;
            background: #fff;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background: #f2f2f2;
        }

        /* ===== BOTONES ===== */
        .btn {
            display: inline-block;
            padding: 8px 12px;
            border-radius: 5px;
            color: #fff;
            text-decoration: none;
            font-size: 14px;
        }

        .ver { background: #007bff; }
        .eliminar { background: #dc3545; }

        /* ===== MOBILE CARDS ===== */
        @media (max-width: 768px) {

            table, thead, tbody, th, td, tr {
                display: block;
                width: 100%;
            }

            thead {
                display: none;
            }

            table {
                background: transparent;
            }

            tr {
                background: #fff;
                margin: 1rem;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0,0,0,.1);
                padding: 1rem;
            }

            td {
                border: none;
                padding: 6px 0;
                text-align: left;
            }

            td::before {
                font-weight: bold;
                display: block;
                margin-bottom: 2px;
                color: #555;
            }

            td:nth-of-type(1)::before { content: "ID"; }
            td:nth-of-type(2)::before { content: "Usuario"; }
            td:nth-of-type(3)::before { content: "Total"; }
            td:nth-of-type(4)::before { content: "Dirección"; }
            td:nth-of-type(5)::before { content: "Pago"; }
            td:nth-of-type(6)::before { content: "Seguimiento"; }
            td:nth-of-type(7)::before { content: "Fecha"; }
            td:nth-of-type(8)::before { content: "Acciones"; }

            .btn {
                display: block;
                margin: 6px 0;
                text-align: center;
            }
        }
    </style>
</head>

<body>

<h2>📦 Administración de Pedidos</h2>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Usuario</th>
            <th>Total</th>
            <th>Dirección</th>
            <th>Pago</th>
            <th>Seguimiento</th>
            <th>Fecha</th>
            <th>Acciones</th>
        </tr>
    </thead>

    <tbody>
    <% if (pedidos != null && !pedidos.isEmpty()) {
        for (Pedido p : pedidos) { %>

        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getUsuario_id() %></td>
            <td>$<%= p.getTotal() %></td>
            <td><%= p.getDireccion_entrega() %></td>
            <td><%= p.getMetodo_pago() %></td>
            <td><%= p.getNumero_seguimiento() %></td>
            <td><%= p.getFecha_creacion() %></td>

            <td>
                <a href="PedidoAdminServlet?accion=ver&id=<%= p.getId() %>" class="btn ver">Ver</a>
                <a onclick="return confirm('¿Eliminar pedido?');"
                   href="PedidoAdminServlet?accion=eliminar&id=<%= p.getId() %>"
                   class="btn eliminar">Eliminar</a>
            </td>
        </tr>

    <% }} else { %>
        <tr><td colspan="8">No hay pedidos registrados.</td></tr>
    <% } %>
    </tbody>
</table>

</body>
</html>
