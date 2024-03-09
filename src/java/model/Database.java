/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import static model.DBInfo.dbPass;
import static model.DBInfo.dbURL;
import static model.DBInfo.dbUser;
import static model.DBInfo.driver;

/**
 *
 * @author Admin
 */
public class Database implements DBInfo {

    public Database() {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static Staff getByEmail(String email) {
        Staff s = null;

        try ( Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass)) {
            String query = "SELECT Staff_ID, Name, Gender, Phone, Password, Email, Address, Role, Status, DistrictID FROM Staff WHERE Email=?";
            try ( PreparedStatement pstmt = con.prepareStatement(query)) {
                pstmt.setString(1, email);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    int staffID = rs.getInt("Staff_ID");
                    String name = rs.getString("Name");
                    String genderStr = rs.getString("Gender");
                    char gender = (genderStr != null && !genderStr.isEmpty()) ? genderStr.charAt(0) : '\0';
                    String phone = rs.getString("Phone");
                    String password = rs.getString("Password");
                    String address = rs.getString("Address");
                    int role = rs.getInt("Role");
                    boolean status = rs.getBoolean("Status");
                    int districtID = rs.getInt("DistrictID");

                    s = new Staff(staffID, name, gender, phone, password, email, address, role, status, districtID);
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    public static void addNewStaff(Staff newStaff) {
        try ( Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass)) {
            String query = "INSERT INTO Staff (Name, Gender, Phone, Password, Email, Address, Role, Status, DistrictID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            try ( PreparedStatement pstmt = con.prepareStatement(query)) {
                pstmt.setString(1, newStaff.getName());
                pstmt.setNull(2, Types.VARCHAR);
                pstmt.setNull(3, Types.VARCHAR);
                pstmt.setString(4, newStaff.getPassword());
                pstmt.setString(5, newStaff.getEmail());
                pstmt.setNull(6, Types.VARCHAR);
                pstmt.setInt(7, newStaff.getRole());
                pstmt.setNull(8, Types.VARCHAR);
                pstmt.setNull(9, Types.VARCHAR);

                pstmt.executeUpdate();
            }
        } catch (Exception ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static ArrayList<Conscious> getAllConscious() {
        ArrayList<Conscious> consciousList = new ArrayList<>();

        try ( Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass);  Statement stmt = con.createStatement();  ResultSet rs = stmt.executeQuery("SELECT ConsciousID, Name FROM Conscious")) {

            while (rs.next()) {
                int consciousID = rs.getInt("ConsciousID");
                String name = rs.getString("Name");

                Conscious conscious = new Conscious(consciousID, name);
                consciousList.add(conscious);
            }

        } catch (Exception ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }

        return consciousList;
    }

    public static District getDistrictById(int districtId) {
        District district = null;

        try ( Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass)) {
            String query = "SELECT ConsciousID, Name FROM District WHERE DistrictID=?";
            try ( PreparedStatement pstmt = con.prepareStatement(query)) {
                pstmt.setInt(1, districtId);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    int consciousID = rs.getInt("ConsciousID");
                    String name = rs.getString("Name");

                    district = new District(districtId, consciousID, name);
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }

        return district;
    }

    public static boolean updateStaff(Staff updatedStaff) {
        try ( Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass)) {
            String query = "UPDATE Staff SET Name=?, Gender=?, Phone=?, Password=?, Address=?, Role=?, Status=?, DistrictID=? WHERE Staff_ID=?";

            try ( PreparedStatement pstmt = con.prepareStatement(query)) {
                pstmt.setString(1, updatedStaff.getName());
                pstmt.setString(2, "" + updatedStaff.getGender().charAt(0));
                pstmt.setString(3, updatedStaff.getPhone());
                pstmt.setString(4, updatedStaff.getPassword());
                pstmt.setString(5, updatedStaff.getAddress());
                pstmt.setInt(6, updatedStaff.getRole());
                pstmt.setString(7, updatedStaff.getStatus());
                pstmt.setInt(8, updatedStaff.getDistrictID());
                pstmt.setInt(9, updatedStaff.getStaffID());

                int rowsAffected = pstmt.executeUpdate();

                return rowsAffected > 0;
            }
        } catch (Exception ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public static Conscious getConsciousByDistrictId(int districtId) {
        Conscious conscious = null;

        try ( Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass)) {
            String query = "SELECT c.ConsciousID, c.Name FROM Conscious c "
                    + "JOIN District d ON c.ConsciousID = d.ConsciousID "
                    + "WHERE d.DistrictID=?";
            try ( PreparedStatement pstmt = con.prepareStatement(query)) {
                pstmt.setInt(1, districtId);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    int consciousID = rs.getInt("ConsciousID");
                    String name = rs.getString("Name");

                    conscious = new Conscious(consciousID, name);
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }

        return conscious;
    }

    public static Shop getShopByStaffID(int staffID) {
        Shop shop = null;

        try ( Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass)) {
            String query = "SELECT Shop_ID, Name_Shop, Phone_Shop, Address_Shop, Shop_Description, MS_Tax, Staff_ID, DistrictID FROM Shop WHERE Staff_ID=?";
            try ( PreparedStatement pstmt = con.prepareStatement(query)) {
                pstmt.setInt(1, staffID);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    int shopID = rs.getInt("Shop_ID");
                    String name = rs.getString("Name_Shop");
                    String phone = rs.getString("Phone_Shop");
                    String address = rs.getString("Address_Shop");
                    String description = rs.getString("Shop_Description");
                    String tax = rs.getString("MS_Tax");
                    int districtID = rs.getInt("DistrictID");

                    shop = new Shop(shopID, name, phone, address, description, tax, staffID, districtID);
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }

        return shop;
    }

    public static boolean addNewShop(Shop newShop) {
        try ( Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass)) {
            String query = "INSERT INTO Shop (Name_Shop, Phone_Shop, Address_Shop, Shop_Description, MS_Tax, Staff_ID, DistrictID) VALUES (?, ?, ?, ?, ?, ?, ?)";

            try ( PreparedStatement pstmt = con.prepareStatement(query)) {
                pstmt.setString(1, newShop.getName());
                pstmt.setString(2, newShop.getPhone());
                pstmt.setString(3, newShop.getAddress());
                pstmt.setString(4, newShop.getDescription());
                pstmt.setString(5, newShop.getTax());
                pstmt.setInt(6, newShop.getStaffID());
                pstmt.setInt(7, newShop.getDistrictID());

                int rowsAffected = pstmt.executeUpdate();

                return rowsAffected > 0;
            }
        } catch (Exception ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public static boolean addNewProduct(Product newProduct) {
        try ( Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass)) {
            String query = "INSERT INTO Product (Name, Price, ImagePath, Product_Description, Shop_ID) VALUES (?, ?, ?, ?, ?)";

            try ( PreparedStatement pstmt = con.prepareStatement(query)) {
                pstmt.setString(1, newProduct.getName());
                pstmt.setDouble(2, newProduct.getPrice());
                pstmt.setString(3, newProduct.getImagePath());
                pstmt.setString(4, newProduct.getProductDescription());
                pstmt.setInt(5, newProduct.getShopId());

                int rowsAffected = pstmt.executeUpdate();

                return rowsAffected > 0;
            }
        } catch (Exception ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public static ArrayList<Product> getAllProducts() {
        ArrayList<Product> productList = new ArrayList<>();

        try ( Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass);  Statement stmt = con.createStatement();  ResultSet rs = stmt.executeQuery("SELECT * FROM Product")) {

            while (rs.next()) {
                int productId = rs.getInt("Product_ID");
                String name = rs.getString("Name");
                double price = rs.getDouble("Price");
                String imagePath = rs.getString("ImagePath");
                String productDescription = rs.getString("Product_Description");
                int shopId = rs.getInt("Shop_ID");

                Product product = new Product(productId, name, price, imagePath, productDescription, shopId);
                productList.add(product);
            }

        } catch (Exception ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }

        return productList;
    }

}
