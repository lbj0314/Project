package com.controller.stay;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/StayFileDownServlet")
public class StayFileDownServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
		String stayImageClone = request.getParameter("stayImageClone");
		String stayImage = request.getParameter("stayImage");
		File fNew = new File("c:\\upload", stayImageClone);
		String sFilePath = fNew.getPath();

		byte b[] = new byte[4096];
		FileInputStream in = new FileInputStream(sFilePath);
		String sMimeType = getServletContext().getMimeType(sFilePath);
		//System.out.println("sMimeType>>>" + sMimeType);

		if (sMimeType == null)
			sMimeType = "application/octet-stream";

		response.setContentType(sMimeType);

		String sEncoding = new String(stayImage.getBytes("UTF-8"), "8859_1");

		response.setHeader("Content-Disposition", "attachment; filename= " + sEncoding);

		ServletOutputStream out = response.getOutputStream();
		int numRead;

		while ((numRead = in.read(b, 0, b.length)) != -1) {
			out.write(b, 0, numRead);
		}
		out.flush();
		out.close();
		in.close();

	}
}