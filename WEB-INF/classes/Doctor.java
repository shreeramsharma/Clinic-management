package com.hinduja.asterix;

import java.sql.*;
import java.util.*;

public class Doctor
{
	int id;
	String firstname,lastname,contact,clinicaddress,email,password;
	

	public void setId(int id)
	{
		this.id=id;
	}
	public int getId()
	{
		return id;
	}

	public void setFirstName(String firstname)
	{
		this.firstname=firstname;
	}
	public String getFirstName()
	{
		return firstname;
	}

	public void setLastName(String lastname)
	{
		this.lastname=lastname;
	}
	public String getLastName()
	{
		return lastname;
	}

   public void setContact(String contact)
	{
		this.contact=contact;
	}
	public String getContact()
	{
		return contact;
	}
    public void setClinicaddress(String clinicaddress)
	{
		this.clinicaddress=clinicaddress;
	}
	public String getClinicaddress()
	{
		return clinicaddress;
	}

	public void setEmail(String email)
	{
		this.email=email;
	}
	public String getEmail()
	{
		return email;
	}
	
	public void setPassword(String password)
	{
		this.password=password;
	}
	public String getPassword()
	{
		return password;
	}


}