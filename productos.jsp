<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.loginrolesapp.modelo.Producto" %>
<%
List<Producto> productos = (List<Producto>) request.getAttribute("productos");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Catálogo de Productos</title>

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

        /* ===== IMAGE ===== */
        .img-prod {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 8px;
        }

        /* ===== BUTTON ===== */
        .btn {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 8px 14px;
            cursor: pointer;
            border-radius: 6px;
            font-weight: bold;
        }

        .btn:hover {
            background-color: #218838;
        }

        /* ===== LINKS ===== */
        .links {
            text-align: center;
            margin: 25px 0;
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
                border-radius: 14px;
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

            td:nth-of-type(1)::before { content: "Imagen"; }
            td:nth-of-type(2)::before { content: "Nombre"; }
            td:nth-of-type(3)::before { content: "Descripción"; }
            td:nth-of-type(4)::before { content: "Precio"; }
            td:nth-of-type(5)::before { content: "Stock"; }
            td:nth-of-type(6)::before { content: "Acción"; }

            .img-prod {
                width: 100%;
                height: 160px;
            }

            input[type="number"] {
                width: 100%;
                margin-bottom: 6px;
            }

            .btn {
                width: 100%;
            }
        }
    </style>
</head>

<body>

<h2>🛍️ Catálogo de Productos</h2>

<table>
    <thead>
        <tr>
            <th>Imagen</th>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Precio</th>
            <th>Stock</th>
            <th>Acción</th>
        </tr>
    </thead>

    <tbody>
    <%
    if (productos != null && !productos.isEmpty()) {
        for (Producto p : productos) {
            String img = (p.getImagen_url() == null || p.getImagen_url().trim().isEmpty())
                    ? "img/no-image.png"
                    : p.getImagen_url();
    %>
        <tr>
            <td>
                <img class="img-prod" src="<%= img %>" alt="Producto">
            </td>
            <td><%= p.getNombre() %></td>
            <td><%= p.getDescripcion() %></td>
            <td>$<%= String.format("%.2f", p.getPrecio()) %></td>
            <td><%= p.getStock() %></td>
            <td>
                <form action="CarritoClienteServlet" method="post" style="margin:0;">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="productoId" value="<%= p.getId() %>">
                    <input type="number" name="cantidad" value="1" min="1">
                    <input class="btn" type="submit" value="🛒 Agregar">
                </form>
            </td>
        </tr>
    <%
        }
    } else {
    %>
        <tr>
            <td colspan="6" style="text-align:center;">
                No hay productos disponibles.
            </td>
        </tr>
    <%
    }
    %>
    </tbody>
</table>

<div class="links">
    <a href="CarritoClienteServlet">🛒 Ver carrito</a>
    <a href="PrincipalClienteServlet">🏠 Volver al inicio</a>
</div>

</body>
</html>
