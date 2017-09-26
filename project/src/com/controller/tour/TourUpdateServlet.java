package com.controller.tour;

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

import com.dto.tour.TourDTO;
import com.exception.MyException;
import com.service.notice.NoticeService;
import com.service.tour.TourService;

/**
 * Servlet implementation class MyBoardUpdateServlet
 */
@WebServlet("/TourUpdateServlet")
public class TourUpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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
		String entNum = null;
		String attNum = null;
		String attImage = null;
		String attImageClone = null;
		String attContent = null;
		String attName = null;
		String attLocation = null;
		String attType = null;
		String attAdultPrice = null;
		String attKidPrice = null;
		String attPhone = null;
		String attSite = null;
		String attTitle = null;
		String attAddr1 = null;
		String attAddr2 = null;
		String target = "TourListServlet";
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

					if (name.equals("attType")) {
						attType = value;

					} else if (name.equals("attNum")) {
						attNum = value;

					} else if (name.equals("entNum")) {
						entNum = value;

					}

					else if (name.equals("attLocation")) {
						attLocation = value;

					} else if (name.equals("attName")) {
						attName = value;

					} else if (name.equals("attAdultPrice")) {
						attAdultPrice = value;

					} else if (name.equals("attKidPrice")) {
						attKidPrice = value;

					} else if (name.equals("attSite")) {
						if (value.equals("")) {
							attSite = "홈페이지 주소 없음";
						} else {
							attSite = value;
						}

					} else if (name.equals("attContent")) {
						attContent = value;

					} else if (name.equals("attPhone")) {
						attPhone = value;

					} else if (name.equals("attTitle")) {
						attTitle = value;

					} else if (name.equals("attAddr1")) {
						attAddr1 = value;

					} else if (name.equals("attAddr2")) {
						attAddr2 = value;

					}

					// System.out.println(name+"\t"+value);
					// System.out.println(contentType+"\t"+isInMemory+"\t"+sizeInBytes);

				} else {
					// type="file"인 경우

					fileName = item.getName();
					// 이미지 파일을 수정했을 경우
					if (!fileName.equals("")) {
						attImage = fileName;
						String[] attSplit = fileName.split("\\.");
						attImageClone = attSplit[0] + milliSecond + "." + attSplit[1];
						// contentType = item.getContentType(); //이미지가 아니면 업로드 불가능 처리를 할 수 있다. 나중에 구현
						// sizeInBytes = item.getSize();
						File uploadedFile = new File("c:\\upload");

						// 폴더가 없으면 폴더 생성
						if (!uploadedFile.exists()) {

							uploadedFile.mkdir();
							uploadedFile = new File("c:\\upload", attImageClone);

						} else {
							uploadedFile = new File("c:\\upload", attImageClone);

						}

						item.write(uploadedFile);

					}

				}
			}

			// request.setAttribute("fileName", fileName);
			// request.setAttribute("sizeInBytes", sizeInBytes);

		} catch (

		FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		TourDTO dto = new TourDTO();
		dto.setAttLocation(attLocation);
		dto.setEntNum(Integer.parseInt(entNum));
		dto.setAttType(attType);
		dto.setAttAdultPrice(Integer.parseInt(attAdultPrice));
		dto.setAttKidPrice(Integer.parseInt(attKidPrice));
		dto.setAttSite(attSite);
		dto.setAttContent(attContent);
		dto.setAttName(attName);
		dto.setAttNum(Integer.parseInt(attNum));
		dto.setAttAddr1(attAddr1);
		dto.setAttAddr2(attAddr2);
		System.out.println("attnum" + attNum);

		// 이미지 파일이 수정되었을 때
		if (!fileName.equals("")) {
			dto.setAttImage(attImage);
			dto.setAttImageClone(attImageClone);
		}
		dto.setAttPhone(attPhone);
		dto.setAttTitle(attTitle);

		TourService service = new TourService();
		try {
			service.updateByTourNum(dto);
			request.setAttribute("tourcomp", "정상적으로 수정 완료하였습니다.");
		} catch (MyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			target = "error.jsp";
			request.setAttribute("tourcomp", "수정 실패~");

		}

		response.sendRedirect(target);

	}// end

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
