package member;

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

public class MemberDAO {
	//디비연결1단계, 2단계 메서드로 만들기
	private Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}

	public void insertMember(MemberBean mb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			
			String sql="insert into pj_member(id,pass,name,email,birthYear,birthMonth,birthDate,mobile,zipcode,address,addressDetail,gender,reg_date,address2, grade) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPass());
			pstmt.setString(3, mb.getName());
			pstmt.setString(4, mb.getEmail());
			pstmt.setString(5, mb.getBirthYear());
			pstmt.setString(6, mb.getBirthMonth());
			pstmt.setString(7, mb.getBirthDate());
			pstmt.setString(8, mb.getMobile());
			pstmt.setString(9, mb.getZipcode());
			pstmt.setString(10, mb.getAddress());
			pstmt.setString(11, mb.getAddressDetail());
			pstmt.setString(12, mb.getGender());
			pstmt.setTimestamp(13, mb.getReg_date());
			pstmt.setString(14, mb.getAddress2());
			pstmt.setString(15, mb.getGrade());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			 if(pstmt!=null) try {pstmt.close();}catch(SQLException ex) {}
			 if(con!=null) try{con.close();}catch(SQLException ex) {} 
		}
	}//insertMember문닫힘
	public int dupcheck(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int dcheck=-1;
		try {
			con=getConnection();
			
			String sql="select * from pj_member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dcheck=1;
			}else {dcheck=-1;}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try {pstmt.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
			if(rs!=null) try{rs.close();}catch(SQLException ex) {}
		 }return dcheck;
		
	}//dupcheck문닫힘
	
	
	public int userCheck(String id, String pass) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int check=-1;
		try {
			con=getConnection();
			
			String sql="select * from pj_member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				if(pass.equals(rs.getString("pass"))) {
					check=1;
				}else {check=0;}
			}else {check=-1;}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally { 
			 if(pstmt!=null) try {pstmt.close();}catch(SQLException ex) {}
			 if(con!=null) try{con.close();}catch(SQLException ex) {}
			 if(rs!=null) try{rs.close();}catch(SQLException ex) {}
		}return check;
	}//userCheck닫힘
	
	public MemberBean getMember(String id) {
		MemberBean mb=new MemberBean();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from pj_member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				mb.setId(rs.getString("id"));
				mb.setName(rs.getString("name"));
				mb.setEmail(rs.getString("email"));
				mb.setBirthYear(rs.getString("birthYear"));
				mb.setBirthMonth(rs.getString("birthMonth"));
				mb.setBirthDate(rs.getString("birthDate"));
				mb.setMobile(rs.getString("mobile"));
				mb.setZipcode(rs.getString("zipcode"));
				mb.setAddress(rs.getString("address"));
				mb.setAddress2(rs.getString("address2"));
				mb.setAddressDetail(rs.getString("addressDetail"));
				mb.setGender(rs.getString("gender"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
				mb.setGrade(rs.getString("grade"));
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			if(con!=null) try {con.close();} catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();} catch(SQLException ex) {}
			if(rs!=null) try {rs.close();} catch(SQLException ex) {}
		}return mb;
		
	}//getMember문닫힘
	public void updateMember(MemberBean mb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			String sql="update pj_member set pass=?, name=?, email=?, mobile=?, zipcode=?, address=?, addressDetail=?, gender=?, address2=? where id=?";
			pstmt=con.prepareStatement(sql);
			if(mb.getPass2()=="") {		
				pstmt.setString(1, mb.getPass());
				}else {
					pstmt.setString(1, mb.getPass2());
				}
			pstmt.setString(2, mb.getName());
			pstmt.setString(3, mb.getEmail());
			pstmt.setString(4, mb.getMobile());
			pstmt.setString(5, mb.getZipcode());
			pstmt.setString(6, mb.getAddress());
			pstmt.setString(7, mb.getAddressDetail());
			pstmt.setString(8, mb.getGender());
			pstmt.setString(9, mb.getAddress2());
			pstmt.setString(10, mb.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null) try {con.close();} catch(SQLException ex) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException ex) {}
		}
	}//updateMember닫힘
	
	public void updateMemberList(String id, String grade) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			String sql="update pj_member set grade=? where id=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, grade);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("dao:"+id);
			System.out.println("dao:"+grade);
			e.printStackTrace();
		}finally {
			if(con!=null) try {con.close();} catch(SQLException ex) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException ex) {}
		}
	}//updateMemberList닫힘
	
	
	public void deleteMember(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			String sql="delete from pj_member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally { 
			if(con!=null) try {con.close();} catch(SQLException ex) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException ex) {}
		}
	}//deleteMember닫힘
	public List getMemberList() {
		List memberList=new ArrayList();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from pj_member";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberBean mb=new MemberBean();
				mb.setId(rs.getString("id"));
				mb.setPass(rs.getString("pass"));
				mb.setName(rs.getString("name"));
				mb.setEmail(rs.getString("email"));
				mb.setBirthYear(rs.getString("birthYear"));
				mb.setBirthMonth(rs.getString("birthMonth"));
				mb.setBirthDate(rs.getString("birthDate"));
				mb.setMobile(rs.getString("mobile"));
				mb.setZipcode(rs.getString("zipcode"));
				mb.setAddress(rs.getString("address"));
				mb.setAddressDetail(rs.getString("addressDetail"));
				mb.setAddress2(rs.getString("address2"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
				mb.setGender(rs.getString("gender"));
				mb.setGrade(rs.getString("grade"));
				memberList.add(mb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null) try {con.close();} catch(SQLException ex) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException ex) {}
			if(rs!=null) try {rs.close();} catch(SQLException ex) {}
		}return memberList;
	}//getMemberList()닫힘
}
