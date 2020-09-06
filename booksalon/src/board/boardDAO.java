package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class boardDAO {
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
			String sql="select max(num) from pj_sentence";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				num=rs.getInt("max(num)")+1;
			}
			sql="insert into pj_sentence(num,id,pass,subject,content,readcount,date) value(?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getId());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, bb.getReadcount());
			pstmt.setTimestamp(7, bb.getDate());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null)try {con.close();}catch(SQLException ex) {}
			if(rs!=null)try {rs.close();}catch(SQLException ex) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
		}
	}//insertBoard닫힘
	public List getBoardList(int startRow, int pageSize) {
		List boardList = new ArrayList();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from pj_sentence order by num desc limit ?,?";
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
	
	public void readcount(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			String sql="update pj_sentence set readcount=readcount+1 where num=?";
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
			String sql="select * from pj_sentence where num=?";
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
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null)try {con.close();}catch(SQLException ex) {}
			if(rs!=null)try {rs.close();}catch(SQLException ex) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
		}return bb;
	}//getcontent닫힘
	
	public int check(String id,String pass) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		int check=-1;
		try {
			con=getConnection();
			String sql="select * from pj_sentence where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				boardBean bb=new boardBean();
				if(pass.equals(rs.getString("pass"))) {
					check=1;
				}else {
					check=0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null)try {con.close();}catch(SQLException ex) {}
			if(rs!=null)try {rs.close();}catch(SQLException ex) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
		}return check;
	}//check닫힘
	
	public void updatecontent(boardBean bb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			String sql="update pj_sentence set subject=?, content=? where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, bb.getSubject());
			pstmt.setString(2, bb.getContent());
			pstmt.setInt(3, bb.getNum());
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
			String sql="delete from pj_sentence where num=?";
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
	
	public int getBoardCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			String sql="select count(*) from pj_sentence";
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
	
	public int getBoardCount(String search) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			// 예외가 발생하것 같은 구문
			// 1단계 드라이버로더			 // 2단계 디비연결
			con=getConnection();
			// 3단계 sql board테이블 
//			String sql="select count(*) from pj_sentence where subject like '%검색어%'";
			String sql="select count(*) from pj_sentence where subject like ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			// 4단계 rs <= 실행 결과 저장
			rs=pstmt.executeQuery();
			// 5단계     
			if(rs.next()) {
					count=rs.getInt("count(*)");
			}
		} catch (Exception e) {
			// 예외가 발생하면 처리하는 구문
			e.printStackTrace();
		}finally {
			// 예외상관없이 마무리작업 구문=> 기억장소 해제
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) try {pstmt.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();} catch(SQLException ex) {}
		}
		return count;
	}//getBoardCount(search)
	
	
	public List getBoardList(int startRow,int pageSize,String search) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List boardList=new ArrayList();
		try {
			// 예외가 발생하것 같은 구문
			// 1단계 드라이버로더			 // 2단계 디비연결
			con=getConnection();
			
			// 3단계 sql board테이블 모든글 가져오기(최근글이 맨처음에 나오게 정렬)
//			String sql="select * from pj_sentence order by num desc";
//			String sql="select * from pj_sentence where subject like '%검색어%' order by num desc limit ?,?";
			String sql="select * from pj_sentence where subject like ? order by num desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			pstmt.setInt(2, startRow-1);// startRow 시작행 포함하지 않아서 -1 
			pstmt.setInt(3, pageSize);
			// 4단계 rs <= 실행 결과 저장
			rs=pstmt.executeQuery();
			// 5단계   bb < =  rs    bb => 배열한칸에 저장
			while(rs.next()) {
				boardBean bb=new boardBean();
				bb.setNum(rs.getInt("num"));
				bb.setSubject(rs.getString("subject"));
				bb.setId(rs.getString("id"));
				bb.setDate(rs.getTimestamp("date"));
				bb.setReadcount(rs.getInt("readcount"));
				// 한개의 글 배열 한컨에 저장
				boardList.add(bb);
			}
		} catch (Exception e) {
			// 예외가 발생하면 처리하는 구문
			e.printStackTrace();
		}finally {
			// 예외상관없이 마무리작업 구문=> 기억장소 해제
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) try {pstmt.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();} catch(SQLException ex) {}
		}
		return boardList;
	}
	
	 
	
}
