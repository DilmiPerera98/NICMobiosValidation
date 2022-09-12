/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Dilmi
 */
public class User {
    private int id;
    private String fullName;
    private String address;
    private String nationality;
    private String nic;
    private String gender;
    private int age;
    private  String dob;

    public User(int id,String fullName, String address, String nationality, String nic, String gender, int age, String dob) {
        
        this.id = id;
        this.fullName = fullName;
        this.address = address;
        this.nationality = nationality;
        this.nic = nic;
        this.gender = gender;
        this.age = age;
        this.dob = dob;
    }
    
    public User(){
        
    }

    public int getId() {
        return id;
    }
    

    public String getFullName() {
        return fullName;
    }

    public String getAddress() {
        return address;
    }

    public String getNationality() {
        return nationality;
    }

    public String getNic() {
        return nic;
    }

    public String getGender() {
        return gender;
    }

    public int getAge() {
        return age;
    }

    public String getDob() {
        return dob;
    }
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public void setId(int id) {
        this.id = id;
    }

    

}
