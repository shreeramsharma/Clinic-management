package com.hinduja.asterix;

import java.sql.*;
import java.util.*;

public class PrescriptionWorker
{
	public static String addPrescription(Prescription p)
	{
		String result="";

		try
		{
			String query="Insert into prescription(dr_id,pt_id,pt_complaints,findings,advice,patientcharges,date,time) values (?,?,?,?,?,?,?,?);";
			PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
			pstmt.setInt(1,p.getDrId());
			pstmt.setInt(2,p.getPtId());
			pstmt.setString(3,p.getPtcomplaints());
			pstmt.setString(4,p.getFindings());
			pstmt.setString(5,p.getAdvice());
			pstmt.setString(6,p.getPatientcharges());
			pstmt.setString(7,p.getDate());
			pstmt.setString(8,p.getTime());

			int i=pstmt.executeUpdate();

			if(i==1)
			{
				result=Results.SUCCESS;
			}
			else
			{
				result=Results.FAILURE;
			}
			DatabaseConnector.closeConnection();
		}
		catch (Exception e)
		{
			e.printStackTrace();
			result=Results.PROBLEM;
		}
		return result;
	}

	public static String updatePrescription(Prescription p)
	{
		String result="";

		try
		{
			String query="Update prescription set dr_id=?,pt_id=?,,pres_id,pt_complaints=?,findings=?,advice=?,patientcharges=?,date=?,time=? where id=?;";
			PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
			pstmt.setInt(1,p.getDrId());
			pstmt.setInt(2,p.getPtId());
			pstmt.setString(3,p.getPtcomplaints());
			pstmt.setString(4,p.getFindings());
			pstmt.setString(5,p.getAdvice());
			pstmt.setString(6,p.getPatientcharges());
			pstmt.setString(7,p.getDate());
			pstmt.setString(8,p.getTime());
			pstmt.setInt(9,p.getId());

			int i=pstmt.executeUpdate();

			if(i==1)
			{
				result=Results.SUCCESS;
			}
			else
			{
				result=Results.FAILURE;
			}
			DatabaseConnector.closeConnection();
		}
		catch (Exception e)
		{
			e.printStackTrace();
			result=Results.PROBLEM;
		}
		return result;
	}

	public static String deleteprescription(int id)
	{
		String result="";

		try
		{
			String query="Delete from prescription where id="+id+";";
			PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);

			
			int i=pstmt.executeUpdate();

			if(i==1)
			{
				result=Results.SUCCESS;
			}
			else
			{
				result=Results.FAILURE;
			}
			DatabaseConnector.closeConnection();
		}
		catch (Exception e)
		{
			e.printStackTrace();
			result=Results.PROBLEM;
		}
		return result;
	}
	public static String deleteprescriptionbyptid(int ptid)
	{
		String result="";

		try
		{
			String query="Delete from prescription where pt_id='"+ptid+"';";
			PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);

			
			int i=pstmt.executeUpdate();

			if(i==1)
			{
				result=Results.SUCCESS;
			}
			else
			{
				result=Results.FAILURE;
			}
			DatabaseConnector.closeConnection();
		}
		catch (Exception e)
		{
			e.printStackTrace();
			result=Results.PROBLEM;
		}
		return result;
	}

	
	public static Prescription getPrescriptionbyId(int id)
	{
		Prescription p=null;
		try
		{
			String query="Select * from prescription where id="+id+";";
			ResultSet rs=DatabaseConnector.getResultSet(query);

			if(rs.next())
			{
				p=new Prescription();
				p.setId(rs.getInt("id"));
				p.setDrId(rs.getInt("dr_id"));
				p.setPtId(rs.getInt("pt_id"));
				p.setPtcomplaints(rs.getString("pt_complaints"));
				p.setFindings(rs.getString("findings"));
				p.setAdvice(rs.getString("advice"));
				p.setPatientcharges(rs.getString("patientcharges"));
				p.setDate(rs.getString("date"));
				p.setTime(rs.getString("time"));

			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return p;
	}
	
	public static Prescription getPrescriptionbyDrId(int drid)
	{
		Prescription p=null;
		try
		{
			String query="Select * from prescription where dr_id="+drid+";";
			ResultSet rs=DatabaseConnector.getResultSet(query);

			if(rs.next())
			{
				p=new Prescription();
				p.setId(rs.getInt("id"));
				p.setDrId(rs.getInt("dr_id"));
				p.setPtId(rs.getInt("pt_id"));
				p.setPtcomplaints(rs.getString("pt_complaints"));
				p.setFindings(rs.getString("findings"));
				p.setAdvice(rs.getString("advice"));
				p.setAdvice(rs.getString("patientcharges"));
				p.setDate(rs.getString("date"));
				p.setTime(rs.getString("time"));

			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return p;
	}

public static ArrayList<Prescription> getAllPrescription()
	{
		ArrayList<Prescription> list=new ArrayList<>();
		try
		{
			String query="Select * from prescription;";
			ResultSet rs=DatabaseConnector.getResultSet(query);

			while(rs.next())
			{
				Prescription p=new Prescription();
				p.setId(rs.getInt("id"));
				p.setDrId(rs.getInt("dr_id"));
				p.setPtId(rs.getInt("pt_id"));
				p.setPtcomplaints(rs.getString("pt_complaints"));
				p.setFindings(rs.getString("findings"));
				p.setAdvice(rs.getString("advice"));
				p.setPatientcharges(rs.getString("patientcharges"));
				p.setDate(rs.getString("date"));
				p.setTime(rs.getString("time"));

				list.add(p);
				p=null;
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	public static ArrayList<Prescription> getAllPrescriptionbyDrId(int drid)
	{
		ArrayList<Prescription> list=new ArrayList<>();
		try
		{
			String query="Select * from prescription where dr_id='"+drid+"';";
			ResultSet rs=DatabaseConnector.getResultSet(query);

			while(rs.next())
			{
				Prescription p=new Prescription();
				p.setId(rs.getInt("id"));
				p.setDrId(rs.getInt("dr_id"));
				p.setPtId(rs.getInt("pt_id"));
				p.setPtcomplaints(rs.getString("pt_complaints"));
				p.setFindings(rs.getString("findings"));
				p.setAdvice(rs.getString("advice"));
				p.setPatientcharges(rs.getString("patientcharges"));
				p.setDate(rs.getString("date"));
				p.setTime(rs.getString("time"));

				list.add(p);
				p=null;
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	public static Prescription getcountPrescriptionByDrId(int drid)
	{
		Prescription p=null;
		try
		{
			String query="Select COUNT(*) AS count from prescription where dr_id = '"+drid+"'";
			ResultSet rs=DatabaseConnector.getResultSet(query);

			if(rs.next())
			{
				p=new Prescription();
				p.setCount(rs.getString("count"));
				

			}
					
		}

		catch (Exception e)
		{
			e.printStackTrace();
		}

		return p;
	}
}