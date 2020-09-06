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

public class w_boardDAO {
	public Connection getConnection() throws Exception {
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;

	}//getConnection닫힘
	public void insertBoard(boardBean bb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int num=0;
		try {
			con=getConnection();
			String sql="select max(num) from pj_write";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				num=rs.getInt("max(num)")+1;
			}
			sql="insert into pj_write(num,id,pass,subject,readcount,date,file,content) value(?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getId());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setInt(5, bb.getReadcount());
			pstmt.setTimestamp(6, bb.getDate());
			pstmt.setString(7, bb.getFile());
			pstmt.setString(8, bb.getContent());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null)try {con.close();}catch(SQLException ex) {}
			if(rs!=null)try {rs.close();}catch(SQLException ex) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
		}
	}//insertBoard닫힘
	public int getBoardCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			String sql="select count(*) from pj_write";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
				if(rs.next()) {
					count=rs.getInt("count(*)");
				}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null)try {con.close();} catch(SQLException ex) {}
			if(pstmt!=null)try {pstmt.close();} catch(SQLException ex) {}
			if(rs!=null)try {rs.close();} catch(SQLException ex) {}
		}return count;
	}//getBoardCount닫힘
	
	public List getBoardList(int startRow, int pageSize) {
		List boardList = new ArrayList();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from pj_write order by num desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				boardBean bb =new boardBean();
				bb.setNum(rs.getInt("num"));
				bb.setSubject(rs.getString("subject"));
				bb.setId(rs.getString("id"));
				bb.setDate(rs.getTimestamp("date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setFile(rs.getString("file"));
				boardList.add(bb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null)try {con.close();} catch(SQLException ex) {}
			if(pstmt!=null)try {pstmt.close();} catch(SQLException ex) {}
			if(rs!=null)try {rs.close();} catch(SQLException ex) {}
		}return boardList;
	}//getBoardList닫힘
	public boardBean getcontent(int num) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		boardBean bb=new boardBean();
		try {
			con=getConnection();
			String sql="select * from pj_write where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				bb.setNum(rs.getInt("num"));
				bb.setId(rs.getString("id"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getTimestamp("date"));
				bb.setFile(rs.getString("file"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null)try {con.close();}catch(SQLException ex) {}
			if(rs!=null)try {rs.close();}catch(SQLException ex) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
		}return bb;
	}//getcontent닫힘
	public void readcount(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			String sql="update pj_write set readcount=readcount+1 where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null)try {con.close();}catch(SQLException ex) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
		}
	}//readcount닫힘
	
	public void updatecontent(boardBean bb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			String sql="update pj_write set subject=?, content=?, file=?, id=?,pass=?  where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, bb.getSubject());
			pstmt.setString(2, bb.getContent());
			pstmt.setString(3, bb.getFile());
			pstmt.setString(4, bb.getId());
			pstmt.setString(5, bb.getPass());
			pstmt.setInt(6, bb.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("업데이트");
			e.printStackTrace();
		}finally {
			if(con!=null)try {con.close();}catch(SQLException ex){}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex){}			
		}
	}//updatecontent닫힘
	public void deleteContent(boardBean bb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			String sql="delete from pj_write where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, (bb.getNum()));
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null)try {con.close();} catch(SQLException ex) {}
			if(pstmt!=null)try {pstmt.close();} catch(SQLException ex) {}
		}
	}//deleteContent닫힘
	
}
