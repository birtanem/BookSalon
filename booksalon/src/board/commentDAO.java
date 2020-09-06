package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class commentDAO {

	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
	public void insertComment(commentBean cb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int cnum=0;
		try {
			con=getConnection();
			String sql="select max(cnum) from comment";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnum=rs.getInt("max(cnum)")+1;
			}
			sql="insert into comment(cnum,bnum,writer,regdate,content) value(?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, cnum);
			pstmt.setInt(2, cb.getBnum());
			pstmt.setString(3, cb.getWriter());
			pstmt.setTimestamp(4, cb.getRegdate());
			pstmt.setString(5, cb.getContent());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null) try {con.close();} catch(SQLException ex) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException ex) {}
			if(rs!=null) try {rs.close();} catch(SQLException ex) {}
		}
	}//insertComment
	public List getCommentList() {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		List boardList=new ArrayList();
		try {
			con=getConnection();
			String sql="select * from comment order by cnum desc";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				commentBean cb=new commentBean();
				cb.setBnum(rs.getInt("bnum"));
				cb.setCnum(rs.getInt("cnum"));
				cb.setWriter(rs.getString("writer"));
				cb.setRegdate(rs.getTimestamp("regdate"));
				cb.setContent(rs.getString("content"));
				boardList.add(cb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null)try {con.close();}catch(SQLException ex) {}
			if(rs!=null)try {rs.close();}catch(SQLException ex) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
		}return boardList;
	}//getBoardList닫힘
	
	public int getCommentCount(int bnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			String sql="select count(*) from comment where bnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null) try {con.close();}catch(SQLException ex) {}
			if(pstmt!=null) try {pstmt.close();}catch(SQLException ex) {}
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}
		}return count;
	}//getCommentCount닫힘
	public int getBnum(int bnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int getbnum=0;
		try {
			con=getConnection();
			String sql="select * from comment where bnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				getbnum=1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null) try {con.close();}catch(SQLException ex) {}
			if(pstmt!=null) try {pstmt.close();}catch(SQLException ex) {}
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}
		}return getbnum;
	}//getbnum
}
