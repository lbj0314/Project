package com.controller.stay;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.dto.stay.StayDTO;
import com.dto.stay.StayFileUploadDTO;
import com.dto.stay.StayPageDTO;
import com.exception.MyException;
import com.service.StayService;


@Controller
public class StayController {
	@Autowired
	StayService service;
	
	
	
	@RequestMapping("/stayList")
	public String stayList(@RequestParam HashMap<String,String> map,Model m,
			String stayForm) throws MyException {
		
		m.addAttribute("stayOrderForm", "stayOrderForm");

		if(map.get("stayCurPage") == null) {
			map.put("stayCurPage", "1");
		}
		System.out.println(map.get("stayCurPage"));
		
		try {
			StayPageDTO list=service.page(map);
			m.addAttribute("staylist",list);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new MyException("stayList예외");
			
		}
		
	
		if(!(map.get("searchValue") == null)) {
			return "stay/stay_listview";
			
		}
		
		else if(!(map.get("stayLocation") == null) || !(map.get("searchName") == null) ||  !(map.get("attType") == null) || !(map.get("sortStay") == null)) {
			return "stay/stayAjax";
			
			
			
		}else if(stayForm!=null) {
			return "order/orderForm";
		}
		
		return "stay/stay_listview";
				
	}
	
	
	
	
	@RequestMapping("/stayRetrieve")
	public String stayRetrieve(int stayNum,Model m) throws MyException{
		
		try {
			m.addAttribute("stayRetrieve",service.staySelectByNum(stayNum));
			/*if(request.getAttribute("goodok") != null)
			request.setAttribute("goodok","좋아요 성공~");
			*/
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch blocke.
			e.printStackTrace();
		
				throw new MyException("staySelectByNum예외");
			
		}
		
		
		
		
		return "stay/stay_retrieveview";
		
	}
	
	
	@RequestMapping("/loginX/stayDelete")
	public String StayDeleteByNum(int stayNum) throws MyException{
		
		
		try {
			service.StayDeleteByNum(stayNum);
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("StayDeleteByNum 예외");
		}
		return "redirect:/stayList";
		
	}
	
	
	
	
	@RequestMapping(value="/loginX/stayUpdate",  method = RequestMethod.POST)
	public String tourUpdate(StayFileUploadDTO dto) throws MyException{
		
		long milliSecond = System.currentTimeMillis();
		CommonsMultipartFile thefile = dto.getStayImage();
		String stayImage =  thefile.getOriginalFilename();
		
	
		StayDTO tdto = new StayDTO();
		tdto.setStayLocation(dto.getStayLocation());
		tdto.setEntNum(dto.getEntNum());
		tdto.setStayType(dto.getStayType());
		tdto.setStayAdultPrice(dto.getStayAdultPrice());
		tdto.setStayKidPrice(dto.getStayKidPrice());
		tdto.setStaySite(dto.getStaySite());
		tdto.setStayContent(dto.getStayContent());
		tdto.setStayName(dto.getStayName());
		tdto.setStayNum(dto.getStayNum());
		tdto.setStayPhone(dto.getStayPhone());
		tdto.setStayTitle(dto.getStayTitle());
		if (!stayImage.equals("")) {
			String[] staySplit = stayImage.split("\\.");
			String stayImageClone = staySplit[0] + milliSecond + "." + staySplit[1];
			File f = new File("c:\\upload",stayImageClone);
			try {
				thefile.transferTo(f);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			tdto.setStayImage(stayImage);
			tdto.setStayImageClone(stayImageClone);
		}
		
		tdto.setStayAddr1(dto.getStayAddr1());
		tdto.setStayAddr2(dto.getStayAddr2());
		
		
		try {
		service.stayUpdateByNum(tdto);
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("stayUpdateByNum예외");
		}
		
		
		return "redirect:/stayList";

		
	}
	
	
	
	
	@RequestMapping("/loginX/stayWriteUI")
	public String stayWriteUI() {
		return "stay/stay_writeview";
	}
	
	
	@RequestMapping(value="/loginX/stayWrite", method=RequestMethod.POST)
	public String tourWrite(StayFileUploadDTO dto) throws MyException {
		
		
		
		long milliSecond = System.currentTimeMillis();
		CommonsMultipartFile thefile = dto.getStayImage();
		String stayImage =  thefile.getOriginalFilename();
		
		
		
		String[] staySplit = stayImage.split("\\.");
		String stayImageClone = staySplit[0] + milliSecond + "." + staySplit[1];
		String staySite = dto.getStaySite();
		if(staySite.equals("")) staySite="홈페이지 주소 없음";
		System.out.println("site!!"+staySite);
		
		System.out.println(stayImageClone);
		// contentType = item.getContentType(); //이미지가 아니면 업로드 불가능 처리를 할 수 있다. 나중에 구현
		// sizeInBytes = item.getSize();
		File f = new File("c:\\upload",stayImageClone);
		try {
			thefile.transferTo(f);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		StayDTO tdto = new StayDTO();
		tdto.setStayLocation(dto.getStayLocation());
		tdto.setEntNum(dto.getEntNum());
		tdto.setStayType(dto.getStayType());
		tdto.setStayAdultPrice(dto.getStayAdultPrice());
		tdto.setStayKidPrice(dto.getStayKidPrice());
		tdto.setStaySite(staySite);
		tdto.setStayContent(dto.getStayContent());
		tdto.setStayName(dto.getStayName());
		tdto.setStayImage(stayImage);
		tdto.setStayPhone(dto.getStayPhone());
		tdto.setStayTitle(dto.getStayTitle());
		tdto.setStayImageClone(stayImageClone);
		tdto.setStayAddr1(dto.getStayAddr1());
		tdto.setStayAddr2(dto.getStayAddr2());
		
		
		try {
		service.stayWrite(tdto);
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("tourWrite예외");
		}
		
		
		return "redirect:/tourList";
	}
	
	
	
	@RequestMapping("/loginX/stayGoods")
	@ResponseBody
	public String stayGoods(@RequestParam int stayNum) throws MyException {
		
		String cnt=null;
		
		try {
			StayDTO dto = service.stayGoods(stayNum);
			cnt = String.valueOf(dto.getStayGoods());
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("stayGoods예외");
			
		}
		
		
		return cnt;
	}
	
	
	@ExceptionHandler(MyException.class)
	public String xxxx2() {
		return "error";
	}
	
	

}
