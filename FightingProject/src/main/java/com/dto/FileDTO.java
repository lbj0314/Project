package com.dto;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class FileDTO {
	
	private String theText;
	private CommonsMultipartFile theFile;
	
	
	
	
	public String getTheText() {
		return theText;
	}
	public void setTheText(String theText) {
		this.theText = theText;
	}
	public CommonsMultipartFile getTheFile() {
		return theFile;
	}
	public void setTheFile(CommonsMultipartFile theFile) {
		this.theFile = theFile;
	}
	
	

}
