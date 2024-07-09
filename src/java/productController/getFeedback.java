/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package productController;

import DAO.feedBackDAO;
import DAO.productDAO;
import DTO.accountDTO;
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
@WebServlet(name = "getFeedback", urlPatterns = {"/getFeedback"})
public class getFeedback extends HttpServlet {

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
            String comment = request.getParameter("comment");
            int starVote = Integer.parseInt(request.getParameter("rating"));
            String pid = request.getParameter("pid").toString();
            System.out.println(pid + "a");
            HttpSession session = request.getSession();
            accountDTO account = new accountDTO();

            account = (accountDTO) session.getAttribute("user");
            feedBackDAO dao = new feedBackDAO();
            dao.addComment(dao.genID(), pid, account.getUsername(), comment, starVote,account.getFullname());
//            productDTO product = new productDTO();
//            productDAO daoP = new productDAO();
//            product=daoP.getProductByID(pid);
//            request.setAttribute("productDetail", product);
//            request.getRequestDispatcher("detailPage.jsp").forward(request, response);
            response.sendRedirect("detailProduct?pid=" + pid);
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
