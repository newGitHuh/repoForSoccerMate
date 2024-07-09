/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CartController;

import DAO.accountDAO;
import DAO.invoiceDAO;
import DAO.productDAO;
import DTO.accountDTO;
import DTO.cartDTO;
import DTO.invoiceDTO;
import DTO.productDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
@WebServlet(name = "loadInvoice", urlPatterns = {"/loadInvoice"})
public class loadInvoice extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String id = request.getParameter("invoiceID");
            productDAO pdao = new productDAO();
            invoiceDAO idao = new invoiceDAO();
            accountDAO adao = new accountDAO();
            List<invoiceDTO> listInvoice = new ArrayList<>();
            List<cartDTO> listCart = new ArrayList<>();
            listInvoice = idao.listAllInvoice();
            accountDTO account = new accountDTO();
//            for (invoiceDTO dTO : listInvoice) {
//                dTO.
//            }
            listCart = idao.listInvoiceByID(id);
            invoiceDTO invoice = idao.listDetailCartByID(id);
            account = adao.accountByUsername(invoice.getName());
            request.setAttribute("listInvoice", listInvoice);
            request.setAttribute("account", account);
            request.setAttribute("invoice", invoice);
            request.setAttribute("listCart", listCart);
            
            request.getRequestDispatcher("invoiceDashboard.jsp").forward(request, response);
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
