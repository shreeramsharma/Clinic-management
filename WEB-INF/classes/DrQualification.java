package com.hinduja.asterix;

import java.sql.*;
import java.util.*;

public class DrQualification
{
	int id,drid;
	String qualification,institute;
	
	public void setId(int id)
	{
		this.id=id;
	}
	public int getId()
	{
		return id;
	}

	public void setDrId(int drid)
	{
		this.drid=drid;
	}
	public int getDrId()
	{
		return drid;
	}

	public void setQualification(String qualification)
	{
		this.qualification=qualification;
	}
	public String getQualification()
	{
		return qualification;
	}

   public void setInstitute(String institute)
	{
		this.institute=institute;
	}
	public String getInstitute()
	{
		return institute;
	}

}