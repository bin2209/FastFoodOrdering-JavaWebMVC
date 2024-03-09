/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Staff {

    private int staffID;
    private String name;
    private char gender;
    private String phone;
    private String password;
    private String email;
    private String address;
    private int role;
    private boolean status;
    private int DistrictID;

    public Staff() {
    }

    public Staff(int staffID, String name, char gender, String phone, String password, String email, String address, int role, boolean status, int DistrictID) {
        this.staffID = staffID;
        this.name = name;
        this.gender = gender;
        this.phone = phone;
        this.password = password;
        this.email = email;
        this.address = address;
        this.role = role;
        this.status = status;
        this.DistrictID = DistrictID;
    }

    public Staff(int staffID, String name, String gender, String phone, String password, String email, String address, int role, boolean status, int DistrictID) {
        this.staffID = staffID;
        this.name = name;
        this.gender = gender.charAt(0);
        this.phone = phone;
        this.password = password;
        this.email = email;
        this.address = address;
        this.role = role;
        this.status = status;
        this.DistrictID = DistrictID;
    }

    public Staff(String name, String password, String email, int role) {
        this.name = name;
        this.password = password;
        this.email = email;
        this.role = role;
    }

    public int getStaffID() {
        return staffID;
    }

    public void setStaffID(int staffID) {
        this.staffID = staffID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        switch (gender) {
            case 'M':
                return "Male";
            case 'F':
                return "Female";
            case 'L':
                return "Lesbian";
            default:
                return "NA";
        }

    }

    public void setGender(String gender) {
        this.gender = gender.charAt(0);
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getStatus() {
        return status ? "on" : "off";
    }

    public int getDistrictID() {
        return DistrictID;
    }

    public void setDistrictID(int DistrictID) {
        this.DistrictID = DistrictID;
    }

    public Staff login(String email, String inputMatKhau) {
        if (email.equals(this.email) && this.password.equals(inputMatKhau)) {
            return this;
        }
        return null;
    }

    @Override
    public String toString() {
        return "Staff{" + "staffID=" + staffID + ", name=" + name + ", gender=" + gender + ", phone=" + phone + ", password=" + password + ", email=" + email + ", address=" + address + ", role=" + role + ", status=" + status + ", DistrictID=" + DistrictID + '}';
    }


}
