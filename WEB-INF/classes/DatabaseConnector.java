package com.hinduja.asterix;
import java.sql.*;
import java.util.*;

public class DatabaseConnector
{
	public static String url="jdbc:mysql://localhost:3306/clinicmanagement";
	public static String user="root";
	public static String password="root";
	public static Connection con=null;
	
	public static Connection getConnection()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(url,user,password);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}

	public static Statement getStatement()
	{
		Statement stmt=null;
		try
		{
			con=getConnection();
			stmt=con.createStatement();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return stmt;
	}

	public static PreparedStatement getPreparedStatement(String query)
	{
		PreparedStatement pstmt=null;
		try
		{
			con=getConnection();
			pstmt=con.prepareStatement(query);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return pstmt;
	}
	public static ResultSet getResultSet(String query)
	{
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try
		{
			pstmt=getPreparedStatement(query);
			rs=pstmt.executeQuery();

		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return rs;
	}

	public static void closeConnection()
	{
		try
		{
			if(con!=null)
			{
				con.close();
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}  
