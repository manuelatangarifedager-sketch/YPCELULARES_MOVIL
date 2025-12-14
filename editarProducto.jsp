<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.loginrolesapp.modelo.Producto" %>
<%@ page import="com.loginrolesapp.modelo.Categoria" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
Producto p = (Producto) request.getAttribute("producto");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Editar Producto</title>

    <!-- CLAVE RESPONSIVE -->
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

        label {
            display: block;
            font-weight: 600;
            margin-top: 0.8rem;
        }

        input[type=text],
        input[type=number],
        select {
            width: 100%;
            padding: 0.7rem;
            margin-top: 0.3rem;
            font-size: 1rem;
        }

        .checkbox {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-top: 1rem;
        }

        button {
            width: 100%;
            margin-top: 1.5rem;
            padding: 0.8rem;
            font-size: 1rem;
            font-weight: bold;
            background: #FFD700;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        button:hover {
            background: #e6c200;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>✏️ Editar Producto</h2>

    <form action="ProductoAdminServlet" method="post">

        <input type="hidden" name="accion" value="actualizar">
        <input type="hidden" name="id" value="<%= p.getId() %>">

        <label>Nombre</label>
        <input type="text" name="nombre" value="<%= p.getNombre() %>" required>

        <label>Descripción</label>
        <input type="text" name="descripcion" value="<%= p.getDescripcion() %>" required>

        <label>Precio</label>
        <input type="number" step="0.01" name="precio" value="<%= p.getPrecio() %>" required>

        <label>Stock</label>
        <input type="number" name="stock" value="<%= p.getStock() %>" required>

        <label>Imagen URL</label>
        <input type="text" name="imagen_url" value="<%= p.getImagen_url() %>">

        <label>Categoría</label>
        <select name="categoriaId" required>
            <c:forEach var="c" items="${categorias}">
                <option value="${c.id}"
                    <c:if test="${c.id == p.categoriaId}">selected</c:if>>
                    ${c.nombre}
                </option>
            </c:forEach>
        </select>

        <div class="checkbox">
            <input type="checkbox" name="activo" <%= p.isActivo() ? "checked" : "" %>>
            <span>Activo</span>
        </div>

        <button type="submit">Actualizar</button>
    </form>

</div>

</body>
</html>
