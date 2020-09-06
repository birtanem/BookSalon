package board;

import java.sql.Timestamp;

public class commentBean {
	private int cnum;
	private int bnum;
	private String writer;
	private Timestamp regdate;
	private int pcontent;
	private String content;
	
	
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getPcontent() {
		return pcontent;
	}
	public void setPcontent(int pcontent) {
		this.pcontent = pcontent;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
