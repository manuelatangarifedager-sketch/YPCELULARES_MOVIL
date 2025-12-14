<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,com.loginrolesapp.modelo.Usuario" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null || !"admin".equalsIgnoreCase(usuario.getRol())) {
        response.sendRedirect("/error.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Usuarios Registrados - YP CELULARES</title>

    <!-- 🔑 Responsive -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #ffffff;
            margin: 0;
            color: #222;
        }

        header {
            background-color: #FFD700;
            text-align: center;
            padding: 18px;
            font-size: 26px;
            font-weight: bold;
            box-shadow: 0 2px 10px rgba(0,0,0,0.15);
        }

        main {
            max-width: 1000px;
            margin: 30px auto;
            padding: 25px;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .actions {
            text-align: center;
            margin-bottom: 25px;
        }

        .btn {
            display: inline-block;
            background: #FFD700;
            color: #000;
            padding: 12px 18px;
            margin: 6px;
            border-radius: 8px;
            font-weight: 600;
            text-decoration: none;
        }

        .btn:hover {
            background: #e6c200;
        }

        /* ===== TABLA DESKTOP ===== */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: #FFD700;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-weight: 500;
        }

        .delete-link {
            color: #d11a2a;
        }

        /* ===== RESPONSIVE MOBILE ===== */
        @media (max-width: 700px) {

            table, thead, tbody, th, td, tr {
                display: block;
                width: 100%;
            }

            thead {
                display: none;
            }

            tr {
                background: #fff;
                margin-bottom: 15px;
                border-radius: 12px;
                padding: 15px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }

            td {
                text-align: left;
                padding: 6px 0;
                border: none;
            }

            td::before {
                content: attr(data-label);
                font-weight: bold;
                display: block;
                color: #555;
                margin-bottom: 2px;
            }

            .acciones a {
                display: inline-block;
                margin-right: 10px;
            }
        }
    </style>
</head>

<body>

<header>YP CELULARES</header>

<main>
    <h2>👥 Usuarios Registrados</h2>

    <div class="actions">
        <a href="admin/panelAdmin.jsp" class="btn">⬅ Volver</a>
        <a href="UsuarioServlet?action=nuevo" class="btn">➕ Agregar</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Rol</th>
                <th>Acciones</th>
            </tr>
        </thead>

        <tbody>
        <%
            List<Usuario> lista = (List<Usuario>) request.getAttribute("usuarios");
            if (lista != null) {
                for (Usuario u : lista) {
        %>
            <tr>
                <td data-label="ID"><%= u.getId() %></td>
                <td data-label="Nombre"><%= u.getNombre() %></td>
                <td data-label="Correo"><%= u.getCorreo() %></td>
                <td data-label="Rol"><%= u.getRol() %></td>
                <td data-label="Acciones" class="acciones">
                    <a href="UsuarioServlet?action=editar&id=<%=u.getId()%>">✏️ Editar</a>
                    |
                    <a href="UsuarioServlet?action=eliminar&id=<%=u.getId()%>"
                       class="delete-link"
                       onclick="return confirm('¿Eliminar este usuario?')">
                       🗑 Eliminar
                    </a>
                </td>
            </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</main>

</body>
</html>
