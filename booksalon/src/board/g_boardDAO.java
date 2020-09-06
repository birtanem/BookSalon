package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class g_boardDAO {
	public Connection getConnection() throws Exception{
		Context init= new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
	public List getBoardList(int startRow, int pageSize) {
		List boardList = new ArrayList();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from pj_gathering order by num desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				boardBean bb =new boardBean();
				SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd");
				bb.setNum(rs.getInt("num"));
				bb.setSubject(rs.getString("subject"));
				bb.setId(rs.getString("id"));
				bb.setSimpleDate(sd.format(rs.getTimestamp("date")));
				bb.setReadcount(rs.getInt("readcount"));
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
	public int getBoardCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			String sql="select count(*) from pj_gathering";
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
	public void insertBoard(boardBean bb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int num=0;
		try {
			con=getConnection();
			String sql="select max(num) from pj_gathering";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				num=rs.getInt("max(num)")+1;
			}
			sql="insert into pj_gathering(num,id,pass,subject,content,readcount,date,file) value(?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getId());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, bb.getReadcount());
			pstmt.setTimestamp(7, bb.getDate());
			pstmt.setString(8, bb.getFile());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null)try {con.close();}catch(SQLException ex) {}
			if(rs!=null)try {rs.close();}catch(SQLException ex) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
		}
	}//insertBoard닫힘
	
	public void readcount(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			String sql="update pj_gathering set readcount=readcount+1 where num=?";
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
	public boardBean getcontent(int num) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		boardBean bb=new boardBean();
		try {
			con=getConnection();
			String sql="select * from pj_gathering where num=?";
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
	public void deleteContent(boardBean bb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			String sql="delete from pj_gathering where num=?";
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
	public void updatecontent(boardBean bb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			String sql="update pj_gathering set subject=?, content=?, file=? where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, bb.getSubject());
			pstmt.setString(2, bb.getContent());
			pstmt.setString(3, bb.getFile());
			pstmt.setInt(4, bb.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null)try {con.close();}catch(SQLException ex){}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex){}			
		}
	}//updatecontent닫힘
}
