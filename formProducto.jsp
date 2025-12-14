<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.loginrolesapp.modelo.Categoria" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Agregar Producto</title>

    <!-- ✅ CLAVE RESPONSIVE -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
            padding: 1rem;
        }

        .container {
            max-width: 600px;
            margin: auto;
            background: #fff;
            padding: 1.5rem;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 1rem;
        }

        input, textarea, select {
            width: 100%;
            padding: 0.7rem;
            margin-top: 0.7rem;
            font-size: 1rem;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        label {
            font-weight: 600;
            margin-top: 1rem;
            display: block;
        }

        button {
            width: 100%;
            margin-top: 1.5rem;
            padding: 0.8rem;
            font-size: 1rem;
            font-weight: bold;
            background: #28a745;
            color: #fff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        button:hover {
            background: #218838;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>➕ Agregar Producto</h2>

    <form action="ProductoAdminServlet" method="post">

        <input type="hidden" name="accion" value="agregar">

        <input type="text" name="nombre" placeholder="Nombre del Producto" required>

        <textarea name="descripcion" placeholder="Descripción del Producto" required></textarea>

        <input type="number" name="precio" step="0.01" placeholder="Precio" required>

        <input type="number" name="stock" placeholder="Stock" required>

        <input type="text" name="imagen_url" placeholder="URL de la imagen">

        <label>Categoría</label>
        <select name="categoriaId" required>
            <option value="">Seleccione una categoría</option>
            <c:forEach var="c" items="${categorias}">
                <option value="${c.id}">${c.nombre}</option>
            </c:forEach>
        </select>

        <button type="submit">Agregar Producto</button>
    </form>

</div>

</body>
</html>
