package com.hinduja.asterix;

import java.sql.*;
import java.util.*;

public class Patient
{
	int id;
	String firstname,lastname,dateofbirth,gender,age,email,address,contact,dr_id,count;
	

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

	public void setDateofbirth(String dateofbirth)
	{
		this.dateofbirth=dateofbirth;
	}
	public String getDateofbirth()
	{
		return dateofbirth;
	}

  public void setGender(String gender)
	{
		this.gender=gender;
	}
	public String getGender()
	{
		return gender;
	}

	public void setAge(String age)
	{
		this.age=age;
	}
	public String getAge()
	{
		return age;
	}

   public void setEmail(String email)
	{
		this.email=email;
	}
	public String getEmail()
	{
		return email;
	}

	public void setAddress(String address)
	{
		this.address=address;
	}
	public String getAddress()
	{
		return address;
	}

   public void setContact(String contact)
	{
		this.contact=contact;
	}
	public String getContact()
	{
		return contact;
	}
	
   public void setCount(String count)
	{
		this.count=count;
	}
	public String getCount()
	{
		return count;
	}
   public void setDrId(String dr_id)
	{
		this.dr_id=dr_id;
	}
	public String getDrId()
	{
		return dr_id;
	}
}