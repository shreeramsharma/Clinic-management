package com.hinduja.asterix;

import java.sql.*;
import java.util.*;

public class Appointment
{
	int id;
	String title,firstname,lastname,dateofappointment,address,dateofbirth,contact,email,consultingdoctor,injury,note,dr_id,count;
	

	public void setId(int id)
	{
		this.id=id;
	}
	public int getId()
	{
		return id;
	}

    public void setTitle(String title)
	{
		this.title=title;
	}
	public String getTitle()
	{
		return title;
	}

	public void setFirstname(String firstname)
	{
		this.firstname=firstname;
	}
	public String getFirstname()
	{
		return firstname;
	}

		public void setLastname(String lastname)
	{
		this.lastname=lastname;
	}
	public String getLastname()
	{
		return lastname;
	}

	public void setDateofappointment(String dateofappointment)
	{
		this.dateofappointment=dateofappointment;
	}
	public String getDateofappointment()
	{
		return dateofappointment;
	}

	public void setAddress(String address)
	{
		this.address=address;
	}
	public String getAddress()
	{
		return address;
	}

	public void setDateofbirth(String dateofbirth)
	{
		this.dateofbirth=dateofbirth;
	}
	public String getDateofbirth()
	{
		return dateofbirth;
	}

	public void setContact(String contact)
	{
		this.contact=contact;
	}
	public String getContact()
	{
		return contact;
	}

	public void setEmail(String email)
	{
		this.email=email;
	}
	public String getEmail()
	{
		return email;
	}
	
   public void setConsultingdoctor(String consultingdoctor)
	{
		this.consultingdoctor=consultingdoctor;
	}
	public String getConsultingdoctor()
	{
		return consultingdoctor;
	}

    public void setInjury(String injury)
	{
		this.injury=injury;
	}
	public String getInjury()
	{
		return injury;
	}

	public void setNote(String note)
	{
		this.note=note;
	}
	public String getNote()
	{
		return note;
	}

       public void setDrId(String dr_id)
	{
		this.dr_id=dr_id;
	}
	public String getDrId()
	{
		return dr_id;
	}

	 public void setCount(String count)
	{
		this.count=count;
	}
	public String getCount()
	{
		return count;
	}

}