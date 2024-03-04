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
import model.Staff;

/**
 *
 * @author Admin
 */
public class Update extends HttpServlet {

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
            out.println("<title>Servlet Update</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Update at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String pass = request.getParameter("pass");
        int role = Integer.parseInt(request.getParameter("role"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String mail = request.getParameter("mail");
        String gender = request.getParameter("gender");
        int district = Integer.parseInt(request.getParameter("district"));
        String address = request.getParameter("address");

        Database db = new Database();
        ArrayList<Conscious> con = db.getAllConscious();

//        District dis = db.getDistrictById(district);
        Staff st = new Staff(id, name, gender, phone, pass, mail, address, role, false, district);
        String ms = "";
        if (db.updateStaff(st)) {
            District dis = db.getDistrictById(st.getDistrictID());
            Conscious con1 = db.getConsciousByDistrictId(st.getDistrictID());
            ms = "Update Successful.";
            request.setAttribute("dis", dis.getDistrictID());
            request.setAttribute("con1", con1.getConsciousID());
            request.setAttribute("consciouss", con);
            request.setAttribute("message", ms);
            request.getRequestDispatcher("account.jsp").forward(request, response);
        } else {
            District dis = db.getDistrictById(st.getDistrictID());
            Conscious con1 = db.getConsciousByDistrictId(st.getDistrictID());
            ms = "Update Fail.";
            request.setAttribute("dis", dis.getDistrictID());
            request.setAttribute("con1", con1.getConsciousID());
            request.setAttribute("consciouss", con);
            request.setAttribute("message", ms);
            request.getRequestDispatcher("account.jsp").forward(request, response);
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
