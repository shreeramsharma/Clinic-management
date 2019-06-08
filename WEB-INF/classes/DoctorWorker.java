package com.hinduja.asterix;

import java.sql.*;
import java.util.*;

public class DoctorWorker
{
		public static String checkLogin(Doctor d)
	{
		String result="";
		try
		{
			Statement stmt=DatabaseConnector.getStatement();

			String query="Select * from doctor where email='"+d.getEmail()+"' and password='"+d.getPassword()+"';";
			System.out.println(query);
			ResultSet rs=stmt.executeQuery(query);
			if(rs.next())
			{
				result="SUCCESS";
			}
			stmt.close();
		}
		catch (Exception e)
		{
		e.printStackTrace();
		}
		return result;
	}
	public static String addDoctor(Doctor d)
	{
		String result="";

		try
		{
			String query="Insert into doctor(firstname,lastname,contact,clinicaddress,email,password) values (?,?,?,?,?,?);";
			PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
			pstmt.setString(1,d.getFirstName());
			pstmt.setString(2,d.getLastName());

			pstmt.setString(3,d.getContact());
			pstmt.setString(4,d.getClinicaddress());
			pstmt.setString(5,d.getEmail());
			pstmt.setString(6,d.getPassword());


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

	public static String updateDoctor(Doctor d)
	{
		String result="";

		try
		{
			String query="Update doctor set firstname=?,lastname=?,contact=?,clinicaddress=?,email=?,password=? where id=?;";
			PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
			pstmt.setString(1,d.getFirstName());
			pstmt.setString(2,d.getLastName());

			pstmt.setString(3,d.getContact());
			pstmt.setString(4,d.getClinicaddress());
			pstmt.setString(5,d.getEmail());
			pstmt.setString(6,d.getPassword());

			pstmt.setInt(7,d.getId());

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

	public static String updateDoctorPassword(Doctor d)
	{
		String result="";

		try
		{
			String query="Update doctor set password=? where id=?;";
			PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
			pstmt.setString(1,d.getPassword());
			pstmt.setInt(2,d.getId());

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
	
	public static String deletedoctor(int id)
	{
		String result="";

		try
		{
			String query="Delete from doctor where id="+id+";";
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

	public static Doctor getDoctorbyId(int id)
	{
		Doctor d=null;
		try
		{
			String query="Select * from doctor where id="+id+";";
			ResultSet rs=DatabaseConnector.getResultSet(query);

			if(rs.next())
			{
				d=new Doctor();
				d.setId(rs.getInt("id"));
				d.setFirstName(rs.getString("firstname"));
				d.setLastName(rs.getString("lastname"));
				d.setContact(rs.getString("contact"));
				d.setClinicaddress(rs.getString("clinicaddress"));
				d.setEmail(rs.getString("email"));
				d.setPassword(rs.getString("password"));

			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return d;
	}

public static ArrayList<Doctor> getAllDoctor()
	{
		ArrayList<Doctor> list=new ArrayList<>();
		try
		{
			String query="Select * from doctor;";
			ResultSet rs=DatabaseConnector.getResultSet(query);

			while(rs.next())
			{
				Doctor d=new Doctor();
				d.setId(rs.getInt("id"));
				d.setFirstName(rs.getString("firstname"));
				d.setLastName(rs.getString("lastname"));

				d.setContact(rs.getString("contact"));
				d.setClinicaddress(rs.getString("clinicaddress"));
				d.setEmail(rs.getString("email"));
				d.setPassword(rs.getString("password"));


				list.add(d);
				d=null;
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
}