package com.loginrolesapp.controlador;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;
import com.loginrolesapp.modelo.*;

public class ProductoServlet extends HttpServlet {

    ProductoDAO dao = new ProductoDAO();
    CategoriaDAO cdao = new CategoriaDAO();

    // ==========================
    // GET → VER PRODUCTOS
    // ==========================
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Usuario usuario = (session != null)
                ? (Usuario) session.getAttribute("usuario")
                : null;

        if (usuario == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        //  LISTAR PRODUCTOS
        request.setAttribute("productos", dao.listar());

        //  ADMIN → cargar categorías y vista admin
        if ("admin".equals(usuario.getRol())) {
            request.setAttribute("categorias", cdao.listar());
            RequestDispatcher rd = request.getRequestDispatcher("adminProductos.jsp");
            rd.forward(request, response);
        } 
        // 🔹 CLIENTE → catálogo
        else {
            RequestDispatcher rd = request.getRequestDispatcher("productos.jsp");
            rd.forward(request, response);
        }
    }

    // ==========================
    // POST → AGREGAR PRODUCTO (ADMIN)
    // ==========================
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);
        Usuario usuario = (session != null)
                ? (Usuario) session.getAttribute("usuario")
                : null;

        if (usuario == null || !"admin".equals(usuario.getRol())) {
            response.sendRedirect("login.jsp");
            return;
        }

        Producto p = new Producto();
        p.setNombre(request.getParameter("nombre"));
        p.setDescripcion(request.getParameter("descripcion"));
        p.setPrecio(Double.parseDouble(request.getParameter("precio")));
        p.setStock(Integer.parseInt(request.getParameter("stock")));
        p.setImagen_url(request.getParameter("imagen_url"));
        p.setActivo(true);
        p.setCategoriaId(Integer.parseInt(request.getParameter("categoriaId")));

        dao.agregar(p);

        response.sendRedirect("ProductoServlet");
    }
}
