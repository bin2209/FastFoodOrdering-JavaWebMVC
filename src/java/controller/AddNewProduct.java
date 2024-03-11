/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Collection;
import java.util.UUID;
import model.Database;
import model.Product;
import model.Shop;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class AddNewProduct extends HttpServlet {

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
            out.println("<title>Servlet AddNewProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddNewProduct at " + request.getContextPath() + "</h1>");
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
    // Phương thức hỗ trợ để lấy tên tệp tin từ một Part
    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");

        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                // Trong trường hợp upload nhiều tệp tin, tìm và trả về tên tệp tin cuối cùng
                String fileName = item.substring(item.indexOf("=") + 2, item.length() - 1);
                return Paths.get(fileName).getFileName().toString();
            }
        }

        return "";
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Đường dẫn đến thư mục lưu trữ ảnh
            String uploadPath = "D:\\BAI_TAP_JAVA\\AssignmentFastFood\\web\\static\\images";

            // Tạo thư mục nếu nó không tồn tại
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs(); // Sử dụng mkdirs() để tạo cả các thư mục cha nếu chúng không tồn tại
            }

            // Nhận thông tin từ form
            String productName = request.getParameter("productName");
            String productPrice1 = request.getParameter("productPrice");
            double productPrice = Double.parseDouble(productPrice1);
            String description = request.getParameter("productDescription");
            Shop shop = (Shop) request.getSession().getAttribute("SHOP");
            Database db = new Database();
            // Khởi tạo ArrayList để lưu đường dẫn của ảnh mới
            ArrayList<String> imagePaths = new ArrayList<>();
// Lặp qua danh sách các tệp tin từ request
            Collection<Part> fileParts = request.getParts();
            for (Part filePart : fileParts) {
                if (filePart.getSubmittedFileName() != null && !filePart.getSubmittedFileName().isEmpty()) {
                    // Nếu tệp tin được chọn
                    String fileName = extractFileName(filePart);

                    // Lưu ảnh vào thư mục
                    try ( InputStream input = filePart.getInputStream()) {
                        // Đường dẫn của thư mục 'images' tương đối với thư mục gốc
                        String relativeUploadPath = "images";

                        // Đường dẫn đầy đủ đến thư mục 'images' trong ứng dụng
                        String absoluteUploadPath = request.getServletContext().getRealPath(relativeUploadPath);

                        // Lưu ảnh vào thư mục 'images'
                        Path filePath = new File(uploadDir, fileName).toPath();
                        Files.copy(input, filePath, StandardCopyOption.REPLACE_EXISTING);

                        // Lưu đường dẫn tương đối của ảnh mới vào ArrayList
                        String relativeImagePath = relativeUploadPath + File.separator + fileName;
                        imagePaths.add(relativeImagePath);
                    }

//                    // Xử lý thông tin, ví dụ: in ra console
//                    System.out.println("Class: " + className);
//                    System.out.println("Image file name: " + fileName);
                }
            }

//            // Điều hướng hoặc trả về response tùy thuộc vào yêu cầu của bạn
//            response.sendRedirect("owner.jsp");
            // Sử dụng imagePaths ở đây cho mục đích của bạn
            for (String imagePath : imagePaths) {
                Product pro = new Product(1, productName, productPrice, imagePath, description, shop.getShopID());
                db.addNewProduct(pro);
            }

            ArrayList<Product> product1 = db.getAllProducts();
            ArrayList<Product> products = new ArrayList<>();
            ArrayList<Product> productss = new ArrayList<>();
            for (Product pro : product1) {
                if (pro.getShopId() == shop.getShopID()) {
                    productss.add(pro);
                }
            }
            if (!productss.isEmpty()) {
                products.add(productss.get(0));
            }

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

            request.setAttribute("products", products);
            request.getRequestDispatcher("owner.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace(); // In ra lỗi (thực tế nên xử lý lỗi phù hợp với ứng dụng của bạn)
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
