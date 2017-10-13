package com.controller.restaurant;

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

import com.dto.restaurant.RestDTO;
import com.dto.tour.TourDTO;
import com.exception.MyException;
import com.service.notice.NoticeService;
import com.service.restaurant.RestService;
import com.service.tour.TourService;

/**
 * Servlet implementation class MyBoardUpdateServlet
 */
@WebServlet("/RestUpdateServlet")
public class RestUpdateServlet extends HttpServlet {

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
		String restNum = null;
		String restImage = null;
		String restImageClone = null;
		String restContent = null;
		String restName = null;
		String restLocation = null;
		String restType = null;
		String restPrice = null;
		String restPhone = null;
		String restSite = null;
		String restTitle = null;
		String restAddr1 = null;
		String restAddr2 = null;
		String target = "RestListServlet";
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

					if (name.equals("restType")) {
						restType = value;

					}else if (name.equals("entNum")) {
						entNum = value;

					}else if (name.equals("restNum")) {
						restNum = value;

					}
					
					else if (name.equals("restLocation")) {
						restLocation = value;

					} else if (name.equals("restName")) {
						restName = value;

					} else if (name.equals("restPrice")) {
						restPrice = value;

					} else if (name.equals("restSite")) {
						if (value.equals("")) {
							restSite = "홈페이지 주소 없음";
						} else {
							restSite = value;
						}

					} else if (name.equals("restContent")) {
						restContent = value;

					} else if (name.equals("restPhone")) {
						restPhone = value;

					} else if (name.equals("restTitle")) {
						restTitle = value;

					}
					else if (name.equals("restAddr1")) {
						restAddr1 = value;

					}
					else if (name.equals("restAddr2")) {
						restAddr2 = value;

					}

					// System.out.println(name+"\t"+value);
					// System.out.println(contentType+"\t"+isInMemory+"\t"+sizeInBytes);

				} else {
					// type="file"인 경우
					
					fileName = item.getName();
					// 이미지 파일을 수정했을 경우
					if (!fileName.equals("")) {
						restImage = fileName;
						String[] restSplit = fileName.split("\\.");
						restImageClone = restSplit[0] + milliSecond + "." + restSplit[1];
						// contentType = item.getContentType(); //이미지가 아니면 업로드 불가능 처리를 할 수 있다. 나중에 구현
						// sizeInBytes = item.getSize();
						File uploadedFile = new File("c:\\upload"); 
						
						//폴더가 없으면 폴더 생성
						if (!uploadedFile.exists()) {
							
							uploadedFile.mkdir();
							uploadedFile = new File("c:\\upload",restImageClone); 
							
						}
						else {
							uploadedFile = new File("c:\\upload",restImageClone); 
							
						}
						
						
						item.write(uploadedFile);

					}

				}
			}

			// request.setAttribute("fileName", fileName);
			// request.setAttribute("sizeInBytes", sizeInBytes);

		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		RestDTO dto = new RestDTO();
		dto.setRestLocation(restLocation);
		dto.setEntNum(Integer.parseInt(entNum));
		dto.setRestType(restType);
		dto.setRestPrice(Integer.parseInt(restPrice));
		dto.setRestSite(restSite);
		dto.setRestContent(restContent);
		dto.setRestName(restName);
		dto.setRestNum(Integer.parseInt(restNum));
		dto.setRestAddr1(restAddr1);
		dto.setRestAddr2(restAddr2);
		System.out.println("restnum"+restNum);
		
		//이미지 파일이 수정되었을 때
		if (!fileName.equals("")) {
			dto.setRestImage(restImage);
			dto.setRestImageClone(restImageClone);
		}
		dto.setRestPhone(restPhone);
		dto.setRestTitle(restTitle);

		RestService service = new RestService();
		try {
			service.updateByRestNum(dto);
			request.setAttribute("restcomp", "정상적으로 수정 완료하였습니다.");
		} catch (MyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			target = "error.jsp";
			request.setAttribute("restcomp", "수정 실패~");

		}

		response.sendRedirect(target);

	}// end

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
