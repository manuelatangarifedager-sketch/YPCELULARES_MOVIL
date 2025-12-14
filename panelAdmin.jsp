<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.loginrolesapp.modelo.Usuario" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null || !"Admin".equalsIgnoreCase(usuario.getRol())) {
        response.sendRedirect("/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Panel de Administración - YP CELULARES</title>

    <!-- ✅ CLAVE RESPONSIVE -->
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

        .admin-body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 70px);
            padding: 1rem;
            background-image: linear-gradient(135deg, #fff 70%, #FFD700 30%);
        }

        .panel {
            width: 100%;
            max-width: 420px;
            background: #fff;
            padding: 2rem 1.5rem;
            border-radius: 16px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,.1);
            border-top: 6px solid #FFD700;
        }

        h2 {
            margin-bottom: 0.5rem;
            font-size: 1.4rem;
        }

        p {
            margin-bottom: 1.5rem;
        }

        .btn {
            display: block;
            padding: 0.9rem;
            margin-bottom: 0.8rem;
            background: #FFD700;
            color: #000;
            font-weight: 600;
            text-decoration: none;
            border-radius: 8px;
        }

        .btn:hover {
            background: #e6c200;
        }

        .logout {
            display: block;
            margin-top: 1.2rem;
            color: #d11a2a;
            font-weight: 600;
            text-decoration: none;
        }

        @media (min-width: 768px) {
            header {
                font-size: 2rem;
            }

            .panel {
                padding: 2.5rem;
            }
        }
    </style>
</head>

<body>

<header>YP CELULARES</header>

<div class="admin-body">
    <div class="panel">
        <h2>👨‍💼 Bienvenido, <%= usuario.getNombre() %></h2>
        <p>Selecciona una opción de administración:</p>

        <a class="btn" href="../UsuarioServlet">👥 Administrar Usuarios</a>
        <a class="btn" href="../ProductoAdminServlet">🛍️ Administrar Productos</a>
        <a class="logout" href="../LogoutServlet">🚪 Cerrar sesión</a>
    </div>
</div>

</body>
</html>
