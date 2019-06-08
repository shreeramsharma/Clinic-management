package com.hinduja.asterix;

import java.sql.*;
import java.util.*;

public class DrQualificationWorker
{
	public static String addDrQualification(DrQualification q)
	{
		String result="";

		try
		{
			String query="Insert into drqualification (dr_id,qualification,institute) values (?,?,?);";
			PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
			pstmt.setInt(1,q.getDrId());
			pstmt.setString(2,q.getQualification());
			pstmt.setString(3,q.getInstitute());

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

	public static String updateDrQualification(DrQualification q)
	{
		String result="";

		try
		{
			String query="Update drqualification set dr_id=?,qualification=?,institute=? where id=?;";
			PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
			pstmt.setString(1,q.getQualification());
			pstmt.setString(2,q.getInstitute());
			pstmt.setInt(3,q.getId());
		    pstmt.setInt(4,q.getDrId());


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

   public static String deletedrqualification(int id)
	{
		String result="";

		try
		{
			String query="Delete from drqualification where id="+id+";";
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

	public static DrQualification getDrQualificationbyId(int id)
	{
		DrQualification q=null;
		try
		{
			String query="Select * from drqualification where id="+id+";";
			ResultSet rs=DatabaseConnector.getResultSet(query);

			if(rs.next())
			{
				q=new DrQualification();
				q.setId(rs.getInt("id"));
				q.setDrId(rs.getInt("dr_id"));
				q.setQualification(rs.getString("qualification"));
				q.setInstitute(rs.getString("institute"));

			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return q;
     	}
		public static DrQualification getDrQualificationbyDrId(int drid)
	{
		DrQualification q=null;
		try
		{
			String query="Select * from drqualification where dr_id="+drid+";";
			ResultSet rs=DatabaseConnector.getResultSet(query);

			if(rs.next())
			{
				q=new DrQualification();
				q.setId(rs.getInt("id"));
				q.setDrId(rs.getInt("dr_id"));
				q.setQualification(rs.getString("qualification"));
				q.setInstitute(rs.getString("institute"));

			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return q;
     	}

       public static ArrayList<DrQualification> getAllDrQualification()
     	{
		ArrayList<DrQualification> list=new ArrayList<>();
		try
		{
			String query="Select * from drqualification;";
			ResultSet rs=DatabaseConnector.getResultSet(query);

			while(rs.next())
			{
				DrQualification q=new DrQualification();
				q.setId(rs.getInt("id"));
				q.setDrId(rs.getInt("dr_id"));
				q.setQualification(rs.getString("qualification"));
				q.setInstitute(rs.getString("institute"));
				list.add(q);
				q=null;
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
}