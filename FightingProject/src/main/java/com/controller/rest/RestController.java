package com.controller.rest;

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

import com.dto.restaurant.RestDTO;
import com.dto.restaurant.RestFileUploadDTO;
import com.dto.restaurant.RestPageDTO;
import com.exception.MyException;
import com.service.RestService;
import com.service.TourService;

@Controller
public class RestController extends HttpServlet  {
	
	@Autowired
	RestService service;
	
	
	
	@RequestMapping("/restList")
	public String restList(@RequestParam HashMap<String,String> map,Model m,
			String restForm) throws MyException {
		
		
		
		
		if(map.get("curPage") == null) {
			map.put("curPage", "1");
		}
		System.out.println(map.get("curPage"));
		
		try {
			RestPageDTO list=service.page(map);
			m.addAttribute("restlist",list);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new MyException("restList예외");
			
		}
		
	
		if(!(map.get("searchValue") == null)) {
			return "restaurant/restListView";
			
		}
		
		else if(!(map.get("restLocation") == null) || !(map.get("searchName") == null) ||  !(map.get("restType") == null) || !(map.get("sortRest") == null)) {
			return "restaurant/restAjax";
			
			
			
		}else if(restForm!=null) {
			return "order/orderForm";
		}
		
		return "restaurant/restListView";
				
	}
	
	
	
	
	@RequestMapping("/restRetrieve")
	public String restRetrieve(int restNum,Model m) throws MyException{
		
		try {
			m.addAttribute("restRetrieve",service.selectByRestNum(restNum));
			/*if(request.getAttribute("goodok") != null)
			request.setAttribute("goodok","좋아요 성공~");
			*/
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch blocke.
			e.printStackTrace();
		
				throw new MyException("selectByRest예외");
			
		}
		
		
		
		
		return "restaurant/restRetrieveView";
		
	}
	
	
	@RequestMapping("/loginX/restDelete")
	public String restDelete(int restNum) throws MyException{
		
		
		try {
			service.deleteByRestNum(restNum);
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("restRetrieve 예외");
		}
		return "redirect:/restList";
		
	}
	
	
	
	
	@RequestMapping(value="/loginX/restUpdate",  method = RequestMethod.POST)
	public String tourUpdate(RestFileUploadDTO dto) throws MyException{
		
		long milliSecond = System.currentTimeMillis();
		CommonsMultipartFile thefile = dto.getRestImage();
		String restImage =  thefile.getOriginalFilename();
		
	
		RestDTO tdto = new RestDTO();
		tdto.setRestLocation(dto.getRestLocation());
		tdto.setEntNum(dto.getEntNum());
		tdto.setRestType(dto.getRestType());
		tdto.setRestPrice(dto.getRestPrice());
		tdto.setRestSite(dto.getRestSite());
		tdto.setRestContent(dto.getRestContent());
		tdto.setRestName(dto.getRestName());
		tdto.setRestNum(dto.getRestNum());
		tdto.setRestPhone(dto.getRestPhone());
		tdto.setRestTitle(dto.getRestTitle());
		if (!restImage.equals("")) {
			String[] restSplit = restImage.split("\\.");
			String restImageClone = restSplit[0] + milliSecond + "." + restSplit[1];
			File f = new File("c:\\upload",restImageClone);
			try {
				thefile.transferTo(f);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			tdto.setRestImage(restImage);
			tdto.setRestImageClone(restImageClone);
		}
		
		tdto.setRestAddr1(dto.getRestAddr1());
		tdto.setRestAddr2(dto.getRestAddr2());
		
		
		try {
		service.updateByRestNum(tdto);
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("tourUpdate예외");
		}
		
		
		return "redirect:/restList";

		
	}
	
	
	
	
	@RequestMapping("/loginX/restWriteUI")
	public String tourWriteUI() {
		return "restaurant/restwriteview";
	}
	
	
	@RequestMapping(value="/loginX/restWrite", method=RequestMethod.POST)
	public String tourWrite(RestFileUploadDTO dto) throws MyException {
		
		
		
		long milliSecond = System.currentTimeMillis();
		CommonsMultipartFile thefile = dto.getRestImage();
		String restImage =  thefile.getOriginalFilename();
		
		
		
		String[] restSplit = restImage.split("\\.");
		String restImageClone = restSplit[0] + milliSecond + "." + restSplit[1];
		String restSite = dto.getRestSite();
		if(restSite.equals("")) restSite="홈페이지 주소 없음";
		System.out.println("site!!"+restSite);
		
		System.out.println(restImageClone);
		// contentType = item.getContentType(); //이미지가 아니면 업로드 불가능 처리를 할 수 있다. 나중에 구현
		// sizeInBytes = item.getSize();
		File f = new File("c:\\upload",restImageClone);
		try {
			thefile.transferTo(f);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RestDTO tdto = new RestDTO();
		tdto.setRestLocation(dto.getRestLocation());
		tdto.setEntNum(dto.getEntNum());
		tdto.setRestType(dto.getRestType());
		tdto.setRestPrice(dto.getRestPrice());
		tdto.setRestSite(restSite);
		tdto.setRestContent(dto.getRestContent());
		tdto.setRestName(dto.getRestName());
		tdto.setRestImage(restImage);
		tdto.setRestPhone(dto.getRestPhone());
		tdto.setRestTitle(dto.getRestTitle());
		tdto.setRestImageClone(restImageClone);
		tdto.setRestAddr1(dto.getRestAddr1());
		tdto.setRestAddr2(dto.getRestAddr2());
		
		
		try {
		service.restWrite(tdto);
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("restWrite예외");
		}
		
		
		return "redirect:/restList";
	}
	
	
	
	@RequestMapping("/loginX/restGoods")
	@ResponseBody
	public String restGoods(@RequestParam int restNum) throws MyException {
		
		String cnt=null;
		
		try {
		
			RestDTO dto = service.goodsRest(restNum);
			cnt = String.valueOf(dto.getRestGoods());
			System.out.println("cnt!!"+cnt);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("restGoods예외");
			
		}
		
		
		return cnt;
	}
	
	
	@ExceptionHandler(MyException.class)
	public String xxxx2() {
		return "error";
	}

}
