/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Conscious;
import model.Database;
import model.District;
import model.Shop;
import model.Staff;

/**
 *
 * @author Admin
 */
public class WorkingPage extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet WorkingPage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet WorkingPage at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        Staff s = (Staff) request.getSession().getAttribute("USER");
        Database db = new Database();
        Shop shop = db.getShopByStaffID(s.getStaffID());
        ArrayList<Conscious> con = db.getAllConscious();
        switch (s.getRole()) {
            case 1:
                if (shop != null) {
                    request.getSession().setAttribute("SHOP", shop);
                    Conscious conShop = db.getConsciousByDistrictId(shop.getDistrictID());
                    District disShop = db.getDistrictById(shop.getDistrictID());

                    Conscious conUser = db.getConsciousByDistrictId(s.getDistrictID());
                    District disUser = db.getDistrictById(s.getDistrictID());
                    request.setAttribute("SHOPaddress", shop.getAddress() + "," + disShop.getName() + "," + conShop.getName());
                    request.setAttribute("USERaddress", s.getAddress() + "," + disUser.getName() + "," + conUser.getName());
                    request.getRequestDispatcher("owner.jsp").forward(request, response);
                } else {
                    request.setAttribute("consciouss", con);
                    request.getRequestDispatcher("registershop.jsp").forward(request, response);
                }
                break;
            case 2:
                request.getRequestDispatcher("shipper.jsp").forward(request, response);
                break;
            case 3:
                request.getRequestDispatcher("admin.jsp").forward(request, response);
                break;
        }
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
        Staff s = (Staff) request.getSession().getAttribute("USER");
        String name = request.getParameter("shopname");
        String address = request.getParameter("shopaddress");
        String phone = request.getParameter("shopphone");
        String tax = request.getParameter("shoptaxcode");
        String decription = request.getParameter("shopdecription");
        int district = Integer.parseInt(request.getParameter("district"));
        Database db = new Database();
        Shop sh = new Shop(1, name, phone, address, decription, tax, s.getStaffID(), district);
        if (db.addNewShop(sh)) {
            request.setAttribute("message", "Create Shop Susscessful.");
            request.getRequestDispatcher("owner.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Create Shop Fail.");
            request.getRequestDispatcher("shop.jsp").forward(request, response);
        }
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
