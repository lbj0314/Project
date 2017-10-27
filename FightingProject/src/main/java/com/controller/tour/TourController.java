package com.controller.tour;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.dto.tour.TourFileUploadDTO;
import com.dto.tour.TourDTO;
import com.dto.tour.TourPageDTO;
import com.exception.MyException;
import com.service.TourService;

@Controller
public class TourController extends HttpServlet  {
	
	@Autowired 
	TourService service;
	
	
	
	@RequestMapping("/tourList")
	public String tourList(@RequestParam HashMap<String,String> map,Model m,
			String tourForm) throws MyException {
		
		m.addAttribute("tourOrderForm", "tourOrderForm");
	
		if(map.get("curPage") == null) {
			map.put("curPage", "1");
		}

		
		try {
			TourPageDTO list=service.page(map);
			m.addAttribute("tourlist",list);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new MyException("tourList예외");
			
		}
		
	
		if(!(map.get("searchValue") == null)) {
			return "tour/tourListView";
			
		}
		
		else if(!(map.get("attLocation") == null) || !(map.get("searchName") == null) ||  !(map.get("attType") == null) || !(map.get("sortAtt") == null)) {
			return "tour/tourAjax";
			
			
			
		}else if(tourForm!=null) {
			return "order/orderForm";
		}
		
		return "tour/tourListView";
				
	}
	
	
	
	
	@RequestMapping("/tourRetrieve")
	public String tourRetrieve(int attNum,Model m) throws MyException{
		
		try {
			m.addAttribute("tourRetrieve",service.selectByTourNum(attNum));
			/*if(request.getAttribute("goodok") != null)
			request.setAttribute("goodok","좋아요 성공~");
			*/
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch blocke.
			e.printStackTrace();
		
				throw new MyException("selectByTour예외");
			
		}
		
		
		
		
		return "tour/tourRetrieveView";
		
	}
	
	
	@RequestMapping("/loginX/tourDelete")
	public String tourtourDelete(int attNum) throws MyException{
		
		
		try {
			service.deleteByTourNum(attNum);
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("tourRetrieve 예외");
		}
		return "redirect:/tourList";
		
	}
	
	
	
	
	@RequestMapping(value="/loginX/tourUpdate",  method = RequestMethod.POST)
	public String tourUpdate(TourFileUploadDTO dto) throws MyException{
		
		long milliSecond = System.currentTimeMillis();
		CommonsMultipartFile thefile = dto.getAttImage();
		String attImage =  thefile.getOriginalFilename();
		
	
		TourDTO tdto = new TourDTO();
		tdto.setAttLocation(dto.getAttLocation());
		tdto.setEntNum(dto.getEntNum());
		tdto.setAttType(dto.getAttType());
		tdto.setAttAdultPrice(dto.getAttAdultPrice());
		tdto.setAttKidPrice(dto.getAttKidPrice());
		tdto.setAttSite(dto.getAttSite());
		tdto.setAttContent(dto.getAttContent());
		tdto.setAttName(dto.getAttName());
		tdto.setAttNum(dto.getAttNum());
		tdto.setAttPhone(dto.getAttPhone());
		tdto.setAttTitle(dto.getAttTitle());
		if (!attImage.equals("")) {
			String[] attSplit = attImage.split("\\.");
			String attImageClone = attSplit[0] + milliSecond + "." + attSplit[1];
			File f = new File("c:\\upload",attImageClone);
			try {
				thefile.transferTo(f);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			tdto.setAttImage(attImage);
			tdto.setAttImageClone(attImageClone);
		}
		
		tdto.setAttAddr1(dto.getAttAddr1());
		tdto.setAttAddr2(dto.getAttAddr2());
		
		
		try {
		service.updateByTourNum(tdto);
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("tourUpdate예외");
		}
		
		
		return "redirect:/tourList";

		
	}
	
	
	
	
	@RequestMapping("/loginX/tourWriteUI")
	public String tourWriteUI() {
		return "tour/tourwriteview";
	}
	
	
	@RequestMapping(value="/loginX/tourWrite", method=RequestMethod.POST)
	public String tourWrite(TourFileUploadDTO dto) throws MyException {
		
		
		
		long milliSecond = System.currentTimeMillis();
		CommonsMultipartFile thefile = dto.getAttImage();
		String attImage =  thefile.getOriginalFilename();
		
		
		
		String[] attSplit = attImage.split("\\.");
		String attImageClone = attSplit[0] + milliSecond + "." + attSplit[1];
		String attSite = dto.getAttSite();
		if(attSite.equals("")) attSite="홈페이지 주소 없음";
		System.out.println("site!!"+attSite);
		
		System.out.println(attImageClone);
		// contentType = item.getContentType(); //이미지가 아니면 업로드 불가능 처리를 할 수 있다. 나중에 구현
		// sizeInBytes = item.getSize();
		File f = new File("c:\\upload",attImageClone);
		try {
			thefile.transferTo(f);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		TourDTO tdto = new TourDTO();
		tdto.setAttLocation(dto.getAttLocation());
		tdto.setEntNum(dto.getEntNum());
		tdto.setAttType(dto.getAttType());
		tdto.setAttAdultPrice(dto.getAttAdultPrice());
		tdto.setAttKidPrice(dto.getAttKidPrice());
		tdto.setAttSite(attSite);
		tdto.setAttContent(dto.getAttContent());
		tdto.setAttName(dto.getAttName());
		tdto.setAttImage(attImage);
		tdto.setAttPhone(dto.getAttPhone());
		tdto.setAttTitle(dto.getAttTitle());
		tdto.setAttImageClone(attImageClone);
		tdto.setAttAddr1(dto.getAttAddr1());
		tdto.setAttAddr2(dto.getAttAddr2());
		
		
		try {
		service.tourWrite(tdto);
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("tourWrite예외");
		}
		
		
		return "redirect:/tourList";
	}
	
	
	
	@RequestMapping("/loginX/tourGoods")
	@ResponseBody
	public String tourGoods(@RequestParam int attNum) throws MyException {
		
		String cnt=null;
		
		try {
		
			TourDTO dto = service.goodsTour(attNum);
			cnt = String.valueOf(dto.getAttGoods());
			System.out.println("cnt!!"+cnt);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("tourGoods예외");
			
		}
		
		
		return cnt;
	}
	
	
	@ExceptionHandler(MyException.class)
	public String xxxx2() {
		return "error";
	}
	
	@RequestMapping("/mustgo100")
	public String must() {
		return "tour/mustgo100view";
	}

}
