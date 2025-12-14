package com.loginrolesapp.controlador;

import com.loginrolesapp.modelo.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/PedidoServlet")
public class PedidoServlet extends HttpServlet {

    PedidoDAO pedidoDAO = new PedidoDAO();
    CarritoClienteDAO carritoDAO = new CarritoClienteDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuario");

        if (usuario == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String accion = request.getParameter("accion");

        if (!"confirmar".equals(accion)) {
            response.sendRedirect("CarritoClienteServlet");
            return;
        }

        // 1️⃣ Obtener carrito
        List<Producto> carrito = carritoDAO.listarCarrito(usuario.getId());

        if (carrito == null || carrito.isEmpty()) {
            response.sendRedirect("CarritoClienteServlet");
            return;
        }

       // Calcular total
double total = 0;
for (Producto p : carrito) {
    total += p.getPrecio() * p.getCantidad();
}

// 👉 DATOS DE FACTURACIÓN
String direccion = request.getParameter("direccion");
String metodoPago = request.getParameter("metodo_pago");

// Crear pedido
int pedidoId = pedidoDAO.crearPedido(
        usuario.getId(),
        total,
        direccion,
        metodoPago
);


        // 4️⃣ Guardar detalle + descontar stock
        for (Producto p : carrito) {
            pedidoDAO.insertarDetallePedido(
                    pedidoId,
                    p.getId(),
                    p.getCantidad(),
                    p.getPrecio()
            );
            pedidoDAO.descontarStock(p.getId(), p.getCantidad());
        }

        // 5️⃣ Vaciar carrito
        carritoDAO.vaciarCarrito(usuario.getId());

        // 6️⃣ Redirigir
        response.sendRedirect("cliente/compraExitosa.jsp");
    }
}
