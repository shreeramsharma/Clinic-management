package com.hinduja.asterix;

import java.sql.*;
import java.util.*;

public class PatientWorker
{
	public static String addPatient(Patient p)
	{
		String result="";

		try
		{
			String query="Insert into patient(firstname,lastname,dateofbirth,gender,age,email,address,contact,dr_id) values (?,?,?,?,?,?,?,?,?);";
			PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
			pstmt.setString(1,p.getFirstName());
			pstmt.setString(2,p.getLastName());
			pstmt.setString(3,p.getDateofbirth());
			pstmt.setString(4,p.getGender());
			pstmt.setString(5,p.getAge());
			pstmt.setString(6,p.getEmail());
			pstmt.setString(7,p.getAddress());
			pstmt.setString(8,p.getContact());
			pstmt.setString(9,p.getDrId());

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

	public static String updatePatient(Patient p)
	{
		String result="";

		try
		{
			String query="Update patient set firstname=?,lastname=?,dateofbirth=?,gender=?,age=?,email=?,address=?,contact=?,dr_id=? where id=?;";
			PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
			pstmt.setString(1,p.getFirstName());
			pstmt.setString(2,p.getLastName());
			pstmt.setString(3,p.getDateofbirth());
			pstmt.setString(4,p.getGender());
			pstmt.setString(5,p.getAge());
			pstmt.setString(6,p.getEmail());
			pstmt.setString(7,p.getAddress());
			pstmt.setString(8,p.getContact());
			pstmt.setString(9,p.getDrId());
			pstmt.setInt(10,p.getId());

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

	public static String deletepatient(int id)
	{
		String result="";

		try
		{
			String query="Delete from patient where id="+id+";";
			PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
			pstmt.setInt(1,id);
			
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

	public static Patient getPatientbyId(int id)
	{
		Patient p=null;
		try
		{
			String query="Select * from patient where id="+id+";";
			ResultSet rs=DatabaseConnector.getResultSet(query);

			if(rs.next())
			{
				p=new Patient();
				p.setId(rs.getInt("id"));
				p.setFirstName(rs.getString("firstname"));
				p.setLastName(rs.getString("lastname"));
				p.setDateofbirth(rs.getString("dateofbirth"));
				p.setGender(rs.getString("gender"));
				p.setAge(rs.getString("age"));
				p.setEmail(rs.getString("email"));
				p.setAddress(rs.getString("address"));
				p.setContact(rs.getString("contact"));
				p.setDrId(rs.getString("dr_id"));

			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return p;
	}

public static ArrayList<Patient> getAllPatient()
	{
		ArrayList<Patient> list=new ArrayList<>();
		try
		{
			String query="Select * from patient;";
			ResultSet rs=DatabaseConnector.getResultSet(query);

			while(rs.next())
			{
				Patient p=new Patient();
				p.setId(rs.getInt("id"));
				p.setFirstName(rs.getString("firstname"));
				p.setLastName(rs.getString("lastname"));
				p.setDateofbirth(rs.getString("dateofbirth"));
				p.setGender(rs.getString("gender"));
				p.setAge(rs.getString("age"));
				p.setEmail(rs.getString("Email"));
				p.setAddress(rs.getString("address"));
				p.setContact(rs.getString("contact"));
				p.setDrId(rs.getString("dr_id"));
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
	public static ArrayList<Patient> getAllPatientbyDrId(String drid)
	{
		ArrayList<Patient> list=new ArrayList<>();
		try
		{
			String query="Select * from patient where dr_id = '"+drid+"';";
			ResultSet rs=DatabaseConnector.getResultSet(query);

			while(rs.next())
			{
				Patient p=new Patient();
				p.setId(rs.getInt("id"));
				p.setFirstName(rs.getString("firstname"));
				p.setLastName(rs.getString("lastname"));
				p.setDateofbirth(rs.getString("dateofbirth"));
				p.setGender(rs.getString("gender"));
				p.setAge(rs.getString("age"));
				p.setEmail(rs.getString("Email"));
				p.setAddress(rs.getString("address"));
				p.setContact(rs.getString("contact"));
				p.setDrId(rs.getString("dr_id"));
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
	
	public static ArrayList<Patient> getAllPatientbyName(String name)
	{
		ArrayList<Patient> list=new ArrayList<>();
		try
		{
			String query="Select * from patient where firstname LIKE '%"+name+"%' ;";
			 
			ResultSet rs=DatabaseConnector.getResultSet(query);

			while(rs.next())
			{
				Patient p=new Patient();
				p.setId(rs.getInt("id"));
				p.setFirstName(rs.getString("firstname"));
				p.setLastName(rs.getString("lastname"));
				p.setDateofbirth(rs.getString("dateofbirth"));
				p.setGender(rs.getString("gender"));
				p.setAge(rs.getString("age"));
				p.setEmail(rs.getString("Email"));
				p.setAddress(rs.getString("address"));
				p.setContact(rs.getString("contact"));
				p.setDrId(rs.getString("dr_id"));
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
		public static ArrayList<Patient> getAllPatientbyNameLength(String name)
	{
		ArrayList<Patient> list=new ArrayList<>();
		try
		{
			String query="Select * from patient where firstname LIKE '"+name+"%';";
			 
			ResultSet rs=DatabaseConnector.getResultSet(query);

			while(rs.next())
			{
				Patient p=new Patient();
				p.setId(rs.getInt("id"));
				p.setFirstName(rs.getString("firstname"));
				p.setLastName(rs.getString("lastname"));
				p.setDateofbirth(rs.getString("dateofbirth"));
				p.setGender(rs.getString("gender"));
				p.setAge(rs.getString("age"));
				p.setEmail(rs.getString("Email"));
				p.setAddress(rs.getString("address"));
				p.setContact(rs.getString("contact"));
				p.setDrId(rs.getString("dr_id"));
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
	
		public static Patient getcountPatientByDrId(int drid)
	{
		Patient p=null;
		try
		{
			String query="Select COUNT(*) AS count from patient where dr_id = '"+drid+"'";
			ResultSet rs=DatabaseConnector.getResultSet(query);

			if(rs.next())
			{
				p=new Patient();
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