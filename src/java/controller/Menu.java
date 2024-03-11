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
import model.Product;

/**
 *
 * @author Admin
 */
public class Menu extends HttpServlet {

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
            out.println("<title>Servlet Menu</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Menu at " + request.getContextPath() + "</h1>");
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
        Database db = new Database();
        ArrayList<Conscious> con = db.getAllConscious();
        ArrayList<Product> product2 = db.getAllProducts();
        ArrayList<Product> products = new ArrayList<>();
        products.add(product2.get(0));
        for (int i = 1; i < product2.size(); i++) {
            // Lấy sản phẩm hiện tại và sản phẩm trước đó
            Product currentProduct = product2.get(i);
            Product previousProduct = product2.get(i - 1);

            // So sánh tên của sản phẩm hiện tại và sản phẩm trước đó
            if (!currentProduct.getName().equals(previousProduct.getName())) {
                // Nếu tên khác nhau, thêm sản phẩm hiện tại vào danh sách products
                products.add(currentProduct);
            }
        }

        request.setAttribute("products", products);
        request.setAttribute("consciouss", con);
        request.getRequestDispatcher("menu.jsp").forward(request, response);
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
        int district = Integer.parseInt(request.getParameter("district"));
        String namesearch = request.getParameter("searchTerm");
        Database db = new Database();
        ArrayList<Product> product2 = db.getAllProducts();
        ArrayList<Product> product1 = db.getProductsByDistrictID(district);
        ArrayList<Product> products = new ArrayList<>();
        ArrayList<Product> productss = new ArrayList<>();
        ArrayList<Conscious> con = db.getAllConscious();

        for (Product pro : product1) {
            if (pro.getName().contains(namesearch)) {
                productss.add(pro);
            }
        }
        if (!productss.isEmpty()) {
            products.add(productss.get(0));
            for (int i = 1; i < productss.size(); i++) {
                // Lấy sản phẩm hiện tại và sản phẩm trước đó
                Product currentProduct = productss.get(i);
                Product previousProduct = productss.get(i - 1);

                // So sánh tên của sản phẩm hiện tại và sản phẩm trước đó
                if (!currentProduct.getName().equals(previousProduct.getName())) {
                    // Nếu tên khác nhau, thêm sản phẩm hiện tại vào danh sách products
                    products.add(currentProduct);
                }

            }
            request.setAttribute("consciouss", con);
            request.setAttribute("products", products);
            request.getRequestDispatcher("menu.jsp").forward(request, response);
        } else {
            products.add(product2.get(0));
            for (int i = 1; i < product2.size(); i++) {
                // Lấy sản phẩm hiện tại và sản phẩm trước đó
                Product currentProduct = product2.get(i);
                Product previousProduct = product2.get(i - 1);

                // So sánh tên của sản phẩm hiện tại và sản phẩm trước đó
                if (!currentProduct.getName().equals(previousProduct.getName())) {
                    // Nếu tên khác nhau, thêm sản phẩm hiện tại vào danh sách products
                    products.add(currentProduct);
                }
            }
            request.setAttribute("message", "Không tìm thấy sản phẩm !");
            request.setAttribute("consciouss", con);
            request.setAttribute("products", products);
            request.getRequestDispatcher("menu.jsp").forward(request, response);
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
