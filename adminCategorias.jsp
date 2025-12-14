<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.loginrolesapp.modelo.Categoria" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Administrar Categorías</title>

    <!-- ✅ CLAVE -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
            padding: 1rem;
        }

        h2 {
            text-align: center;
        }

        .container {
            max-width: 800px;
            margin: auto;
            background: #fff;
            padding: 1.2rem;
            border-radius: 10px;
        }

        /* ===== FORM AGREGAR ===== */
        .top form {
            display: flex;
            flex-direction: column;
            gap: 0.6rem;
        }

        input[type=text] {
            padding: 0.7rem;
            font-size: 1rem;
            width: 100%;
        }

        button {
            padding: 0.7rem;
            border: none;
            border-radius: 6px;
            font-size: 0.95rem;
            cursor: pointer;
        }

        .btn-add { background: #28a745; color: #fff; }
        .btn-edit { background: #007bff; color: #fff; }
        .btn-del { background: #dc3545; color: #fff; }

        /* ===== TABLA (DESKTOP) ===== */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 0.6rem;
            text-align: center;
        }

        th {
            background: #FFD700;
        }

        /* ===== TARJETAS (MÓVIL) ===== */
        .card {
            display: none;
            background: #fff;
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 1rem;
            margin-top: 1rem;
        }

        .card form {
            margin-bottom: 0.6rem;
        }

        .card strong {
            display: block;
            margin-bottom: 0.4rem;
        }

        a {
            text-decoration: none;
            color: #007bff;
        }

        /* ===== MOBILE ===== */
        @media (max-width: 768px) {
            table {
                display: none;
            }

            .card {
                display: block;
            }
        }

        /* ===== DESKTOP ===== */
        @media (min-width: 769px) {
            .top form {
                flex-direction: row;
                justify-content: center;
            }

            .top input {
                width: 70%;
            }
        }
    </style>
</head>

<body>

<div class="container">

    <h2>📂 Administrar Categorías</h2>

    <!-- FORM AGREGAR -->
    <div class="top">
        <form action="CategoriaServlet" method="post">
            <input type="hidden" name="accion" value="agregar">
            <input type="text" name="nombre" placeholder="Nueva categoría" required>
            <button class="btn-add" type="submit">Agregar</button>
        </form>
    </div>

    <!-- ===== TABLA DESKTOP ===== -->
    <table>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Acciones</th>
        </tr>

        <c:forEach var="c" items="${categorias}">
            <tr>
                <td>${c.id}</td>
                <td>
                    <form action="CategoriaServlet" method="post">
                        <input type="hidden" name="accion" value="editar">
                        <input type="hidden" name="id" value="${c.id}">
                        <input type="text" name="nombre" value="${c.nombre}">
                        <button class="btn-edit" type="submit">Guardar</button>
                    </form>
                </td>
                <td>
                    <form action="CategoriaServlet" method="post"
                          onsubmit="return confirm('¿Eliminar categoría?');">
                        <input type="hidden" name="accion" value="eliminar">
                        <input type="hidden" name="id" value="${c.id}">
                        <button class="btn-del" type="submit">Eliminar</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

    <!-- ===== TARJETAS MOBILE ===== -->
    <c:forEach var="c" items="${categorias}">
        <div class="card">
            <strong>ID:</strong> ${c.id}

            <form action="CategoriaServlet" method="post">
                <input type="hidden" name="accion" value="editar">
                <input type="hidden" name="id" value="${c.id}">
                <input type="text" name="nombre" value="${c.nombre}">
                <button class="btn-edit" type="submit">Guardar</button>
            </form>

            <form action="CategoriaServlet" method="post"
                  onsubmit="return confirm('¿Eliminar categoría?');">
                <input type="hidden" name="accion" value="eliminar">
                <input type="hidden" name="id" value="${c.id}">
                <button class="btn-del" type="submit">Eliminar</button>
            </form>
        </div>
    </c:forEach>

    <br>
    <div style="text-align:center;">
        <a href="ProductoAdminServlet">⬅ Volver al listado de productos</a>
    </div>

</div>

</body>
</html>
