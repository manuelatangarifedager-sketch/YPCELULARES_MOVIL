<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.loginrolesapp.modelo.Usuario" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
Usuario usuario = (Usuario) session.getAttribute("usuario");
if (usuario == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Principal - YP CELULARES</title>

    <!--  CLAVE RESPONSIVE -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            background: #fff;
            color: #222;
        }

        header {
            background: #FFD700;
            text-align: center;
            padding: 1rem;
            font-size: 1.6rem;
            font-weight: bold;
            box-shadow: 0 2px 10px rgba(0,0,0,.2);
        }

        /* ===== MENU ===== */
        .menu {
            background: #222;
            padding: 0.8rem 1rem;
        }

        .menu ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .dropdown span {
            color: #fff;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
        }

        .dropdown-content {
            display: none;
            background: #fff;
            width: 100%;
            margin-top: 0.8rem;
            border-radius: 10px;
            padding: 1rem;
            box-shadow: 0 8px 16px rgba(0,0,0,.2);
        }

        .dropdown-content strong {
            display: block;
            margin-top: 0.8rem;
            border-bottom: 2px solid #FFD700;
            padding-bottom: 4px;
        }

        .dropdown-content li {
            font-size: 0.9rem;
            padding: 4px 0;
        }

        /* ===== CONTENIDO ===== */
        .panel-container {
            width: 100%;
            max-width: 900px;
            margin: 2rem auto;
            padding: 1.5rem;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,.1);
            border-top: 6px solid #FFD700;
        }

        h2, p {
            text-align: center;
        }

        h3 {
            border-bottom: 2px solid #FFD700;
            padding-bottom: 6px;
        }

        ul.opciones {
            list-style: none;
            padding: 0;
        }

        ul.opciones li {
            background: #f8f8f8;
            margin: 0.8rem 0;
            border-radius: 10px;
        }

        ul.opciones li a {
            display: block;
            padding: 1rem;
            font-size: 1rem;
            font-weight: 500;
            text-decoration: none;
            color: #000;
        }

        ul.opciones li:hover {
            background: #FFD700;
        }

        hr {
            height: 2px;
            border: none;
            background: #FFD700;
            margin: 1.5rem 0;
        }

        /* ===== DESKTOP ===== */
        @media (min-width: 768px) {
            header {
                font-size: 2rem;
            }

            .panel-container {
                padding: 2.5rem;
            }
        }
    </style>
</head>

<body>

<header>YP CELULARES</header>

<nav class="menu">
    <ul>
        <li class="dropdown">
            <span onclick="toggleCategorias()">☰ Categorías</span>

            <ul class="dropdown-content" id="menuCategorias">

                <li>
                    <strong>Celulares</strong>
                    <ul>
                        <c:forEach var="p" items="${celulares}">
                            <li>${p.nombre}</li>
                        </c:forEach>
                    </ul>
                </li>

                <li>
                    <strong>Tablets</strong>
                    <ul>
                        <c:forEach var="p" items="${tablets}">
                            <li>${p.nombre}</li>
                        </c:forEach>
                    </ul>
                </li>

                <li>
                    <strong>Accesorios</strong>
                    <ul>
                        <c:forEach var="p" items="${accesorios}">
                            <li>${p.nombre}</li>
                        </c:forEach>
                    </ul>
                </li>

            </ul>
        </li>
    </ul>
</nav>

<div class="panel-container">
    <h2>Bienvenido, <%= usuario.getNombre() %>!</h2>
    <p>Rol: <%= usuario.getRol() %></p>

    <hr>

    <h3>Opciones disponibles:</h3>
    <ul class="opciones">
        <li><a href="ProductoServlet">🛍️ Ver productos</a></li>
        <li><a href="CarritoClienteServlet">🛒 Ver carrito</a></li>
        <li><a href="LogoutServlet">🚪 Cerrar sesión</a></li>
    </ul>
</div>

<script>
function toggleCategorias() {
    const menu = document.getElementById("menuCategorias");
    menu.style.display = menu.style.display === "block" ? "none" : "block";
}
</script>

</body>
</html>
