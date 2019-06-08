package com.hinduja.asterix;

import java.sql.*;
import java.util.*;

public class PresmediWorker
{
	public static String addPresmedi(Presmedi m)
	{
		String result="";

		try
		{
			String query="Insert into presmedi(medicine,dosage,days,comments,pres_id,dr_id) values (?,?,?,?,?,?);";
			PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
			pstmt.setString(1,m.getMedicine());
			pstmt.setString(2,m.getDosage());
		    pstmt.setString(3,m.getDays());
			pstmt.setString(4,m.getComments());
			pstmt.setInt(5,m.getPres_Id());
			pstmt.setString(6,m.getDr_Id());

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

	public static String updatePatient(Presmedi m)
	{
		String result="";

		try
		{
			String query="Update presmedi set medicine=?,dosage=?,days=?,comments=?,pres_id,dr_id=? where id=?;";
			PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
			pstmt.setString(1,m.getMedicine());
			pstmt.setString(2,m.getDosage());
			pstmt.setString(3,m.getDays());
			pstmt.setString(4,m.getComments());
			pstmt.setInt(5,m.getPres_Id());
			pstmt.setString(6,m.getDr_Id());
			pstmt.setInt(7,m.getId());

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

	public static String deletepresmedi(int id)
	{
		String result="";

		try
		{
			String query="Delete from presmedi where id="+id+";";
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

	public static Presmedi getPresmedibyId(int id)
	{
		Presmedi m=null;
		try
		{
			String query="Select * from presmedi where id="+id+";";
			ResultSet rs=DatabaseConnector.getResultSet(query);

			if(rs.next())
			{
				m=new Presmedi();
				m.setId(rs.getInt("id"));
				m.setMedicine(rs.getString("medicine"));
				m.setDosage(rs.getString("dosage"));
				m.setDays(rs.getString("days"));
				m.setComments(rs.getString("comments"));
				m.setPres_Id(rs.getInt("pres_id"));
				m.setDr_Id(rs.getString("dr_id"));

			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return m;
	}
	public static Presmedi getPresmedibyPres_Id(int id)
	{
		Presmedi m=null;
		try
		{
			String query="Select * from presmedi where pres_id="+id+";";
			ResultSet rs=DatabaseConnector.getResultSet(query);

			if(rs.next())
			{
				m=new Presmedi();
				m.setId(rs.getInt("id"));
				m.setMedicine(rs.getString("medicine"));
				m.setDosage(rs.getString("dosage"));
				m.setDays(rs.getString("days"));
				m.setComments(rs.getString("comments"));
				m.setPres_Id(rs.getInt("pres_id"));
				m.setDr_Id(rs.getString("dr_id"));

			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return m;
	}

public static ArrayList<Presmedi> getAllPresmedi()
	{
		ArrayList<Presmedi> list=new ArrayList<>();
		try
		{
			String query="Select * from presmedi;";
			ResultSet rs=DatabaseConnector.getResultSet(query);

			while(rs.next())
			{
				Presmedi m=new Presmedi();
				m.setId(rs.getInt("id"));
				m.setMedicine(rs.getString("medicine"));
				m.setDosage(rs.getString("dosage"));
				m.setComments(rs.getString("comments"));
				m.setDays(rs.getString("days"));
				m.setDr_Id(rs.getString("dr_id"));
				list.add(m);
				m=null;
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	
public static ArrayList<Presmedi> getAllPresmedibyPres_Id(int id)
	{
		ArrayList<Presmedi> list=new ArrayList<>();
		try
		{
			String query="Select * from presmedi where pres_id="+id+";";
			ResultSet rs=DatabaseConnector.getResultSet(query);

			while(rs.next())
			{
				Presmedi m=new Presmedi();
				m.setId(rs.getInt("id"));
				m.setMedicine(rs.getString("medicine"));
				m.setDosage(rs.getString("dosage"));
				m.setComments(rs.getString("comments"));
				m.setDays(rs.getString("days"));
				m.setDr_Id(rs.getString("dr_id"));
				list.add(m);
				m=null;
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

}