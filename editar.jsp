<%@ page import="com.loginrolesapp.modelo.Usuario" %>
<%
    Usuario u = (Usuario) request.getAttribute("usuario");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Editar Usuario</title>

    <!-- Responsive -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .card {
            background: #fff;
            padding: 30px 25px;
            border-radius: 16px;
            width: 90%;
            max-width: 420px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 12px;
            margin-bottom: 5px;
        }

        input, select {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 15px;
        }

        .btn {
            margin-top: 20px;
            width: 100%;
            background: #007bff;
            color: #fff;
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
        }

        .btn:hover {
            background: #0056b3;
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 15px;
            text-decoration: none;
            font-weight: bold;
            color: #555;
        }
    </style>
</head>

<body>

<div class="card">

    <h2>?? Editar Usuario</h2>

    <form action="UsuarioServlet" method="post">
        <input type="hidden" name="action" value="actualizar">
        <input type="hidden" name="id_usuario" value="${usuario.id_usuario}">

        <label>Nombre</label>
        <input type="text" name="nombre" value="<%= u.getNombre() %>" required>

        <label>Correo</label>
        <input type="email" name="correo" value="<%= u.getCorreo() %>" required>

        <label>Contraseña</label>
        <input type="password" name="password" value="<%= u.getPassword() %>" required>

        <label>Rol</label>
        <select name="rol">
            <option value="cliente" <%= "cliente".equals(u.getRol()) ? "selected" : "" %>>
                Cliente
            </option>
            <option value="admin" <%= "admin".equals(u.getRol()) ? "selected" : "" %>>
                Administrador
            </option>
        </select>

        <input class="btn" type="submit" value="Actualizar">
    </form>

    <a class="back" href="UsuarioServlet?action=listar">? Volver</a>

</div>

</body>
</html>
