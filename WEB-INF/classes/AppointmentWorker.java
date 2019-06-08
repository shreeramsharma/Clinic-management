package com.hinduja.asterix;

import java.sql.*;
import java.util.*;

public class AppointmentWorker
{
	public static String addAppointment(Appointment a)
	{
		String result="";

		try
		{
			String query="Insert into appointment(title,firstname,lastname,dateofappointment,address,dateofbirth,contact,email,consultingdoctor,injury,note,dr_id) values (?,?,?,?,?,?,?,?,?,?,?,?);";
			PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
			pstmt.setString(1,a.getTitle());
			pstmt.setString(2,a.getFirstname());
			pstmt.setString(3,a.getLastname());
			pstmt.setString(4,a.getDateofappointment());
			pstmt.setString(5,a.getAddress());
			pstmt.setString(6,a.getDateofbirth());
			pstmt.setString(7,a.getContact());
			pstmt.setString(8,a.getEmail());
			pstmt.setString(9,a.getConsultingdoctor());
			pstmt.setString(10,a.getInjury());
			pstmt.setString(11,a.getNote());
		    pstmt.setString(12,a.getDrId());

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

	public static String updateAppointment(Appointment a)
	{
		String result="";

		try
		{
			String query="Update appointment set title=?,firstname=?,lastname=?,dateofappointment=?,address=?,dateofbirth=?,contact=?,email=?,consultingdoctor=?,inujury=?,note=?,dr_id=? where id=?;";
			PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
			pstmt.setString(1,a.getTitle());
			pstmt.setString(2,a.getFirstname());
			pstmt.setString(3,a.getLastname());
			pstmt.setString(4,a.getDateofappointment());
			pstmt.setString(5,a.getAddress());
			pstmt.setString(6,a.getDateofbirth());
			pstmt.setString(7,a.getContact());
			pstmt.setString(8,a.getEmail());
			pstmt.setString(9,a.getConsultingdoctor());
			pstmt.setString(10,a.getInjury());
			pstmt.setString(11,a.getNote());
		    pstmt.setString(12,a.getDrId());
			pstmt.setInt(13,a.getId());

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

	public static String deleteappointment(int id)
	{
		String result="";

		try
		{
			String query="Delete from appointment where id="+id+";";
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

	public static Appointment getAppointmentbyId(int id)
	{
	    Appointment a=null;
		try
		{
			String query="Select * from appointment where id="+id+";";
			ResultSet rs=DatabaseConnector.getResultSet(query);

			if(rs.next())
			{
				a=new Appointment();
				a.setId(rs.getInt("id"));
				a.setTitle(rs.getString("title"));
				a.setFirstname(rs.getString("firstname"));
				a.setLastname(rs.getString("lastname"));
				a.setDateofappointment(rs.getString("dateofappointment"));
				a.setAddress(rs.getString("address"));
				a.setDateofbirth(rs.getString("dateofbirth"));
				a.setContact(rs.getString("contact"));
				a.setEmail(rs.getString("email"));
				a.setConsultingdoctor(rs.getString("consultingdoctor"));
				a.setInjury(rs.getString("injury"));
				a.setNote(rs.getString("note"));
			    a.setDrId(rs.getString("dr_id"));


			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return a;
	}

public static ArrayList<Appointment> getAllAppointment()
	{
		ArrayList<Appointment> list=new ArrayList<>();
		try
		{
			String query="Select * from appointment;";
			ResultSet rs=DatabaseConnector.getResultSet(query);

			while(rs.next())
			{
				Appointment a=new Appointment();
				a.setId(rs.getInt("id"));
				a.setTitle(rs.getString("title"));
				a.setFirstname(rs.getString("firstname"));
				a.setLastname(rs.getString("lastname"));
				a.setDateofappointment(rs.getString("dateofappointment"));
				a.setAddress(rs.getString("address"));
				a.setDateofbirth(rs.getString("dateofbirth"));
				a.setContact(rs.getString("contact"));
				a.setEmail(rs.getString("email"));
				a.setConsultingdoctor(rs.getString("consultingdoctor"));
				a.setInjury(rs.getString("injury"));
				a.setNote(rs.getString("note"));
				a.setDrId(rs.getString("dr_id"));
				list.add(a);
				a=null;
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	public static ArrayList<Appointment> getAllAppointmentbyDrId(String drid)
	{
		ArrayList<Appointment> list=new ArrayList<>();
		try
		{
			String query="Select * from appointment where dr_id = '"+drid+"';";
			ResultSet rs=DatabaseConnector.getResultSet(query);

			while(rs.next())
			{
				Appointment a=new Appointment();
				a.setId(rs.getInt("id"));
				a.setTitle(rs.getString("title"));
				a.setFirstname(rs.getString("firstname"));
				a.setLastname(rs.getString("lastname"));
				a.setDateofappointment(rs.getString("dateofappointment"));
				a.setAddress(rs.getString("address"));
				a.setDateofbirth(rs.getString("dateofbirth"));
				a.setContact(rs.getString("contact"));
				a.setEmail(rs.getString("email"));
				a.setConsultingdoctor(rs.getString("consultingdoctor"));
				a.setInjury(rs.getString("injury"));
				a.setNote(rs.getString("note"));
				a.setDrId(rs.getString("dr_id"));
				list.add(a);
				a=null;
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
		public static Appointment getcountAppointmentByDrId(int drid)
	{
		Appointment a=null;
		try
		{
			String query="Select COUNT(*) AS count from appointment where consultingdoctor = '"+drid+"'";
			ResultSet rs=DatabaseConnector.getResultSet(query);

			if(rs.next())
			{
				a=new Appointment();
				a.setCount(rs.getString("count"));
				

			}
					
		}

		catch (Exception e)
		{
			e.printStackTrace();
		}

		return a;
	}
}