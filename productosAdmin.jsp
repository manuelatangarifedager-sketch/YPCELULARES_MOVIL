<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.loginrolesapp.modelo.Usuario" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
Usuario usuario = (Usuario) session.getAttribute("usuario");
if (usuario == null || !"admin".equals(usuario.getRol())) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Administrador de Productos</title>

    <!-- 🔑 RESPONSIVE -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
        }

        header {
            background: #222;
            color: #FFD700;
            padding: 20px;
            text-align: center;
            font-size: 22px;
            font-weight: bold;
        }

        .container {
            width: 95%;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
        }

        h2 {
            border-bottom: 2px solid #FFD700;
            padding-bottom: 6px;
        }

        /* ===== TABLE DESKTOP ===== */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        th {
            background: #f0f0f0;
        }

        img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 6px;
        }

        .acciones a {
            display: inline-block;
            margin: 4px;
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        /* ===== LINKS SUPERIORES ===== */
        .top-links {
            text-align: right;
            margin-bottom: 15px;
        }

        .top-links a {
            margin-left: 10px;
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        /* ===== FORM ===== */
        .form-container {
            margin-top: 40px;
            padding: 20px;
            border-radius: 10px;
            background: #fafafa;
            border: 1px solid #ddd;
        }

        .form-container input,
        .form-container select {
            width: 100%;
            padding: 10px;
            margin: 6px 0 12px;
        }

        .btn {
            width: 100%;
            background: #28a745;
            color: white;
            border: none;
            padding: 12px;
            cursor: pointer;
            border-radius: 6px;
            font-weight: bold;
        }

        /* ===== MOBILE ===== */
        @media (max-width: 768px) {

            .top-links {
                text-align: center;
            }

            table, thead, tbody, th, td, tr {
                display: block;
                width: 100%;
            }

            thead {
                display: none;
            }

            tr {
                background: #fff;
                margin: 1rem 0;
                border-radius: 10px;
                padding: 1rem;
                box-shadow: 0 2px 10px rgba(0,0,0,.1);
            }

            td {
                border: none;
                padding: 6px 0;
                text-align: left;
            }

            td::before {
                font-weight: bold;
                display: block;
                color: #555;
            }

            td:nth-of-type(1)::before { content: "ID"; }
            td:nth-of-type(2)::before { content: "Imagen"; }
            td:nth-of-type(3)::before { content: "Nombre"; }
            td:nth-of-type(4)::before { content: "Precio"; }
            td:nth-of-type(5)::before { content: "Stock"; }
            td:nth-of-type(6)::before { content: "Categoría"; }
            td:nth-of-type(7)::before { content: "Acciones"; }

            .acciones a {
                display: block;
                margin: 6px 0;
                text-align: center;
            }
        }
    </style>
</head>

<body>

<header>
    🛠️ Panel Administrador - Productos
</header>

<div class="container">

    <div class="top-links">
        <a href="${pageContext.request.contextPath}/CategoriaServlet">📂 Categorías</a>
        <a href="${pageContext.request.contextPath}/admin/panelAdmin.jsp">🏠 Inicio</a>
        <a href="${pageContext.request.contextPath}/LogoutServlet">🚪 Salir</a>
    </div>

    <h2>Listado de Productos</h2>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Imagen</th>
            <th>Nombre</th>
            <th>Precio</th>
            <th>Stock</th>
            <th>Categoría</th>
            <th>Acciones</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="p" items="${productos}">
            <tr>
                <td>${p.id}</td>
                <td><img src="${empty p.imagen_url ? 'img/no-image.png' : p.imagen_url}"></td>
                <td>${p.nombre}</td>
                <td>$${p.precio}</td>
                <td>${p.stock}</td>
                <td>${p.categoriaNombre}</td>
                <td class="acciones">
                    <a href="${pageContext.request.contextPath}/ProductoAdminServlet?accion=editar&id=${p.id}">✏️ Editar</a>
                    <a href="${pageContext.request.contextPath}/ProductoAdminServlet?accion=eliminar&id=${p.id}"
                       onclick="return confirm('¿Eliminar este producto?')">🗑️ Eliminar</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- FORM -->
    <div class="form-container">
        <h2>Agregar nuevo producto</h2>

        <form action="${pageContext.request.contextPath}/ProductoAdminServlet" method="post">
            <input type="hidden" name="accion" value="agregar">

            <input type="text" name="nombre" placeholder="Nombre" required>
            <input type="text" name="descripcion" placeholder="Descripción">
            <input type="number" step="0.01" name="precio" placeholder="Precio" required>
            <input type="number" name="stock" placeholder="Stock" required>
            <input type="text" name="imagen_url" placeholder="URL Imagen">

            <select name="categoriaId" required>
                <option value="">Seleccione categoría</option>
                <c:forEach var="c" items="${categorias}">
                    <option value="${c.id}">${c.nombre}</option>
                </c:forEach>
            </select>

            <button class="btn" type="submit">➕ Agregar producto</button>
        </form>
    </div>

</div>

</body>
</html>
