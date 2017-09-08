package com.controller.stay;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dto.stay.StayDTO;
import com.exception.MyException;
import com.service.stay.StayService;


@WebServlet("/StayWriteServlet")
public class StayWriteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		long milliSecond = System.currentTimeMillis();

		DiskFileItemFactory factory = new DiskFileItemFactory();

		// Configure a repository (to ensure a secure temp location is used)
		ServletContext servletContext = this.getServletConfig().getServletContext();
		File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		factory.setRepository(repository);

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);

		// 파일크기제한
		upload.setFileSizeMax(1024 * 1024 * 2); // 개별적인 파일 크기 2M
		upload.setSizeMax(1024 * 1024 * 5); // 전체 크기 5M

		String fileName = null;
		// long sizeInBytes = 0;
		// String contentType = null;

		String stayLocation = null;

		String stayType = null;
		String stayName = null;
		String stayAdultPrice = null;
		String stayKidPrice = null;
		String stayGrade = null;
		String staySite = null;
		String stayContent = null;
		String stayPhone = null;
		String stayTitle = null;
		String entNum = null;
		String stayImage = null;
		String stayImageClone = null;
		
		String target = "StayBoardListServlet";
		// Parse the request
		try {
			List<FileItem> items = upload.parseRequest(request);
			// Process the uploaded items
			Iterator<FileItem> iter = items.iterator();
			
			while (iter.hasNext()) {
				FileItem item = iter.next();

				if (item.isFormField()) {

					String name = item.getFieldName();
					String value = item.getString("UTF-8");

					boolean isInMemory = item.isInMemory();

					if (name.equals("stayType")) {
						stayType = value;

					} else if (name.equals("stayLocation")) {
						stayLocation = value;

					} else if (name.equals("stayName")) {
						stayName = value;

					} else if (name.equals("stayAdultPrice")) {
						stayAdultPrice = value;
					} else if (name.equals("stayKidPrice")) {
						stayKidPrice = value;
					} else if (name.equals("stayGrade")) {
						stayGrade = value;


					} else if (name.equals("staySite")) {
						if (value.equals("")) {
							staySite = "홈페이지 주소 없음";
						} else {
							staySite = value;
						}

					} else if (name.equals("stayContent")) {
						stayContent = value;

					} else if (name.equals("stayPhone")) {
						stayPhone = value;

					} else if (name.equals("stayTitle")) {
						stayTitle = value;

					}
					else if (name.equals("entNum")) {
						entNum = value;

					}

					// System.out.println(name+"\t"+value);
					// System.out.println(contentType+"\t"+isInMemory+"\t"+sizeInBytes);

				} else {
					// type="file"인 경우

					fileName = item.getName();
					stayImage = fileName;
					String[] staySplit = fileName.split("\\.");
					stayImageClone = staySplit[0] + milliSecond + "." + staySplit[1];
					// contentType = item.getContentType(); //이미지가 아니면 업로드 불가능 처리를 할 수 있다. 나중에 구현
					// sizeInBytes = item.getSize();
					File uploadedFile = new File("c:\\upload", stayImageClone);
					item.write(uploadedFile);
					
					

					

				}
			}

			// request.setrestribute("fileName", fileName);
			// request.setrestribute("sizeInBytes", sizeInBytes);

		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		StayDTO dto = new StayDTO();
		dto.setStayLocation(stayLocation);
		dto.setEntNum(Integer.parseInt(entNum));
		dto.setStayType(stayType);
		dto.setStayAdultPrice(Integer.parseInt(stayAdultPrice));
		dto.setStayKidPrice(Integer.parseInt(stayKidPrice));
		dto.setStayGrade(stayGrade);
		dto.setStaySite(staySite);
		dto.setStayContent(stayContent);
		dto.setStayName(stayName);
		dto.setStayImage(stayImage);
		dto.setStayPhone(stayPhone);
		dto.setStayTitle(stayTitle);
		dto.setStayImageClone(stayImageClone);
		StayService service = new StayService();
		try {
			service.stayWrite(dto);
			request.setAttribute("Staycomp", "정상적으로 입력 완료하였습니다.");
		} catch (MyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			target = "error.jsp";
			request.setAttribute("Staycomp", "입력 실패~");

		}

		response.sendRedirect(target);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
