package com.hinduja.asterix;

import java.sql.*;
import java.util.*;

public class Prescription
{
	int id,drid,ptid;
	String ptcomplaints,findings,advice,patientcharges,date,time,count;
	

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

	public void setPtId(int ptid)
	{
		this.ptid=ptid;
	}
	public int getPtId()
	{
		return ptid;
	}

	public void setPtcomplaints(String ptcomplaints)
	{
		this.ptcomplaints=ptcomplaints;
	}
     public String getPtcomplaints()
	 {
         return ptcomplaints;
    }

	public void setFindings(String findings)
	{
		this.findings=findings;
	}
	public String getFindings()
	{
		return findings;
	}

	public void setAdvice(String advice)
	{
		this.advice=advice;
	}
	public String getAdvice()
	{
		return advice;
	}

	public void setPatientcharges(String patientcharges)
	{
		this.patientcharges=patientcharges;
	}
	public String getPatientcharges()
	{
		return patientcharges;
	}

	public void setDate(String date)
	{
		this.date=date;
	}
	public String getDate()
	{
		return date;
	}

   public void setTime(String time)
	{
		this.time=time;
	}
	public String getTime()
	{
		return time;
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