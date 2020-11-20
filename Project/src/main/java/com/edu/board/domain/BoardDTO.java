package com.edu.board.domain;

import java.util.Date;

import lombok.Data;

//import lombok.Data;

@Data
public class BoardDTO {

	private		int		bno;		//게시글 일련번호
	private		String	subject;	//게시글 제목
	private		String	content;	//게시글 내용
	private		String	writer;		//게시글 작성자
	private		Date	reg_date;	//게시글 작성일시
//	public void setBno(int bno) {
//		this.bno = bno;
//	}
//	public void setSubject(String subject) {
//		this.subject = subject;
//	}
//	public void setContent(String content) {
//		this.content = content;
//	}
//	public void setWriter(String writer) {
//		this.writer = writer;
//	}
//	public void setReg_date(Date reg_date) {
//		this.reg_date = reg_date;
//	}
//	public int getBno() {
//		return bno;
//	}
//	public String getSubject() {
//		return subject;
//	}
//	public String getContent() {
//		return content;
//	}
//	public String getWriter() {
//		return writer;
//	}
//	public Date getReg_date() {
//		return reg_date;
//	}
//	
//
	@Data
	public class BoardVO {
		private		int		bno;		//게시글 일련번호
		private		String	subject;	//게시글 제목
		private		String	content;	//게시글 내용
		private		String	writer;		//게시글 작성자
		private		Date	reg_date;	//게시글 작성일시
	}
}