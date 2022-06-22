package cs.dit.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import cs.dit.dto.japfood_ContentDto;

public class japfood_ContentDao {
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jpark");
		Connection con = ds.getConnection();
		return con;
	}
	
	public ArrayList<japfood_ContentDto> japfood_list(){
		String sql = "select * from japfood_content"; 
		ArrayList<japfood_ContentDto> dtos = new ArrayList<japfood_ContentDto>();
		
		try(
				Connection con = getConnection();
				PreparedStatement stmt = con.prepareStatement(sql);
				ResultSet rs = stmt.executeQuery(sql);
			)
		{
			while(rs.next()) {
				japfood_ContentDto dto = new japfood_ContentDto();
				dto.setCONTENTNAME(rs.getString("contentname"));
				dto.setCONTENT(rs.getString("content"));
				
				dtos.add(dto);
			}
			rs.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	public void japfood_insert(japfood_ContentDto dto) {
		String sql = "insert into japfood_content(contentname, content) values(?, ?)";
		try(
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		)
		{
			pstmt.setString(1, dto.getCONTENTNAME());
			pstmt.setString(2, dto.getCONTENT());
			
			pstmt.executeUpdate();
			
			pstmt.close();
		}	catch (Exception e) {
			e.printStackTrace();
		}
	}
}