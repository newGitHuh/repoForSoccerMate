/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminController;

import DAO.productDAO;
import DTO.productDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
@WebServlet(name = "submitEdit", urlPatterns = {"/submitEdit"})
public class submitEdit extends HttpServlet {

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
            String productName = request.getParameter("productName");
            String productImg = request.getParameter("productImg");
            String productDes = request.getParameter("productDes");
            String category = request.getParameter("category");
            
            int productPrice = Integer.parseInt(request.getParameter("price"));
            
            ////////////////////////////////
            HttpSession session = request.getSession();
            productDTO product = (productDTO) session.getAttribute("currentItem");
            
            ////////////////////////////////
            int productID = Integer.parseInt(product.getProductID().trim());
            /*----------------------------------------------*/
            if (productName == null || productName.trim().isEmpty()) {
                productName = product.getProductName();
            }
            if (productImg == null || productImg.trim().isEmpty()) {
                productImg = product.getProductImg();
            }
            if (productDes == null || productDes.trim().isEmpty()) {
                productDes = product.getProductDes();
            }
            if (category == null || category.trim().isEmpty()) {
                category = product.getProductCategory();
            }
            if (productPrice < 0) {
                productPrice = product.getPrices();
            }
            /*----------------------------------------------*/
            productDAO dao = new productDAO();
            dao.editProduct(productName, productImg, productID, productPrice, productDes, category);
            /*----------------------------------------------*/
            response.sendRedirect("productDashboard");
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
