package com.loginrolesapp.controlador;

import com.loginrolesapp.modelo.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ProductoAdminServlet extends HttpServlet {

    ProductoDAO productoDAO = new ProductoDAO();
    CategoriaDAO categoriaDAO = new CategoriaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        if (accion == null) accion = "listar";

        switch (accion) {

            case "nuevo": {
                List<Categoria> categorias = categoriaDAO.listar();
                request.setAttribute("categorias", categorias);
                request.getRequestDispatcher("admin/formProducto.jsp").forward(request, response);
                break;
            }

            case "editar": {
                int idEdit = Integer.parseInt(request.getParameter("id"));
                Producto producto = productoDAO.obtenerPorId(idEdit);
                List<Categoria> categorias = categoriaDAO.listar();

                request.setAttribute("producto", producto);
                request.setAttribute("categorias", categorias);

                request.getRequestDispatcher("admin/editarProducto.jsp").forward(request, response);
                break;
            }

            case "eliminar": {
                int idDel = Integer.parseInt(request.getParameter("id"));
                productoDAO.eliminar(idDel);
                response.sendRedirect("ProductoAdminServlet");
                break;
            }

          default: {
    List<Producto> lista = productoDAO.listar();
    List<Categoria> categorias = categoriaDAO.listar();

    request.setAttribute("productos", lista);
    request.setAttribute("categorias", categorias);

    request.getRequestDispatcher("admin/productosAdmin.jsp").forward(request, response);
    break;
}

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        boolean activo = request.getParameter("activo") != null;

        if ("agregar".equals(accion)) {

            Producto p = new Producto();
            p.setNombre(request.getParameter("nombre"));
            p.setDescripcion(request.getParameter("descripcion"));
            p.setPrecio(Double.parseDouble(request.getParameter("precio")));
            p.setStock(Integer.parseInt(request.getParameter("stock")));
            p.setImagen_url(request.getParameter("imagen_url"));
            p.setActivo(activo);
            p.setCategoriaId(Integer.parseInt(request.getParameter("categoriaId")));

            productoDAO.agregar(p);

        } else if ("actualizar".equals(accion)) {

            Producto p = new Producto();
            p.setId(Integer.parseInt(request.getParameter("id")));
            p.setNombre(request.getParameter("nombre"));
            p.setDescripcion(request.getParameter("descripcion"));
            p.setPrecio(Double.parseDouble(request.getParameter("precio")));
            p.setStock(Integer.parseInt(request.getParameter("stock")));
            p.setImagen_url(request.getParameter("imagen_url"));
            p.setActivo(activo);
            p.setCategoriaId(Integer.parseInt(request.getParameter("categoriaId")));

            productoDAO.actualizar(p);
        }

        response.sendRedirect("ProductoAdminServlet");
    }
}
