/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Conscious;
import model.Database;
import model.District;
import model.Staff;

/**
 *
 * @author Admin
 */
public class Login extends HttpServlet {

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
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
        String getType = request.getParameter("e");

        if (getType != null && !getType.isEmpty()) {
            switch (getType) {
                case "register":
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                    break;
                case "lostaccount":
                    request.getRequestDispatcher("lostaccount.jsp").forward(request, response);
                    break;
                case "registersuccess":
                    request.getRequestDispatcher("loginstatus.jsp").forward(request, response);
                    break;
                default:
                    request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }

        if (session != null && session.getAttribute("userEmail") != null) {
            response.sendRedirect("account");
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email != null && password != null) {
            Database db = new Database();
            Staff user = db.getByEmail(email);

            if (user != null && user.login(email, password) != null) {
                String msg = "Welcome " + user.getName();
                request.setAttribute("message", msg);

                if ("1".equals(request.getParameter("rm"))) {
                    // Add cookie only if the "Remember Me" option is checked
                    response.addCookie(new Cookie("user", email));
                }

                request.setAttribute("message", msg);
                request.getSession().setAttribute("USER", user);
                response.sendRedirect("account");
            } else {
                String msg = "Đăng nhập thất bại.";
                request.setAttribute("message", msg);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            // Handle the case where email or password is null
            String msg = "Invalid email or password.";
            request.setAttribute("message", msg);
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
