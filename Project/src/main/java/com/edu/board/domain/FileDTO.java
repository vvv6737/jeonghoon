package com.edu.board.domain;

import lombok.Data;

@Data
public class FileDTO {
	
	private		int			fno;			// 파일 일련번호
	private		int			bno;			// 게시글 번호
	private		String		fileName;		// 저장될 파일명
	private		String		fileOriName;	// 원래 파일명
	private		String		fileUrl;		// 파일의 위치
//	public void setFno(int fno) {
//		this.fno = fno;
//	}
//	public void setBno(int bno) {
//		this.bno = bno;
//	}
//	public void setFileName(String fileName) {
//		this.fileName = fileName;
//	}
//	public void setFileOriName(String fileOriName) {
//		this.fileOriName = fileOriName;
//	}
//	public void setFileUrl(String fileUrl) {
//		this.fileUrl = fileUrl;
//	}
//	public int getFno() {
//		return fno;
//	}
//	public int getBno() {
//		return bno;
//	}
//	public String getFileName() {
//		return fileName;
//	}
//	public String getFileOriName() {
//		return fileOriName;
//	}
//	public String getFileUrl() {
//		return fileUrl;
//	}
//	
}