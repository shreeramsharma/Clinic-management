package com.hinduja.asterix;

import java.sql.*;
import java.util.*;

public class Presmedi
{
	int id,pres_id;
	String medicine,dosage,days,comments,dr_id;

	public void setId(int id)
	{
		this.id=id;
	}
	public int getId()
	{
		return id;
	}

	public void setPres_Id(int pres_id)
	{
		this.pres_id=pres_id;
	}
	public int getPres_Id()
	{
		return pres_id;
	}

	public void setMedicine(String medicine)
	{
		this.medicine=medicine;
	}
	public String getMedicine()
	{
		return medicine;
	}

	public void setDosage(String dosage)
	{
		this.dosage=dosage;
	}
	public String getDosage()
	{
		return dosage;
	}

   public void setDays(String days)
	{
		this.days=days;
	}
	public String getDays()
	{
		return days;
	}

   public void setComments(String comments)
	{
		this.comments=comments;
	}
	public String getComments()
	{
		return comments;
	
	}
	public void setDr_Id(String dr_id)
	{
		this.dr_id=dr_id;
	}
	public String getDr_Id()
	{
		return dr_id;
	}

}