package com.search;


public class Searchworker 
{
	private String phonenumber;
    private String name;
    private String department;
    private String email;
    
    public Searchworker(String phonenumber ,String name ,String  department ,String email)
    {
    	this.phonenumber=phonenumber;
    	this.name=name;
    	this.department=department;
    	this.email=email;
    }
    
    public String getphonenumber() {
        return phonenumber;
    }

    public void setphonenumber(String phonenumber)
    {
        this.phonenumber = phonenumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getdepartment() {
        return department;
    }

    public void setdepartment(String department) {
        this.department = department;
    }

    public String getemail() {
        return email;
    }

    public void setemail(String email) {
        this.email= email;
    }
}
