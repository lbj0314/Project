package com.controller.notice;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.notice.NoticeDTO;
import com.dto.notice.PageDTO;
import com.exception.MyException;
import com.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	NoticeService service;

	@RequestMapping("/noticeList")
	public String page(@RequestParam(required = false) HashMap<String, String> map, Model m) throws MyException {
		// list.jsp에서 1 2 3 4

		if (map.get("curPage") == null || map.get("curPage").equals("")) {
			map.put("curPage", "1");
		}
		try {
			PageDTO list = service.page(map);
			m.addAttribute("list", list);

		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("list예외");
		}
		return "notice/noticelistview";
	}
	@RequestMapping("/loginX/noticeWriteUI")
	public String noticeWriteUI() {
		return "notice/writeview";
	}
	
	
	
	@RequestMapping("/noticePerPage")
	public String noticePerPage(String perPage) {
		if (perPage.equals("def"))
			perPage = "3";
		System.out.println(perPage);
		PageDTO.setPerPage(Integer.parseInt(perPage));
		return "redirect:/noticeList";
	}
	
	@RequestMapping("/loginX/noticeWrite")
	public String noticeWrite(NoticeDTO dto) throws MyException{
		

		NoticeDTO dto1 = new NoticeDTO();
		dto1.setNotitle(dto.getNotitle());
		dto1.setNocontent(dto.getNocontent());
		dto1.setAdmnum(dto.getAdmnum());
		try {
			service.boardWrite(dto1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new MyException("noticeWrite예외");
		}
		
		
		return "redirect:/noticeList";
	}
	
	@RequestMapping("/noticeRetrieve")
	public String noticeRetrieve(int nonum,Model m) throws MyException {
		
		
		try {
			m.addAttribute("retrieve", service.selectByNum(nonum));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new MyException("noticeRetrieve예외");
		}

		 
		 return "notice/retrieveview";
	}
	@RequestMapping("/loginX/noticeUpdate")
	public String noticeUpdate(NoticeDTO dto)throws MyException{
	
		
		NoticeDTO dto1 = new NoticeDTO();
		dto1.setNonum(dto.getNonum());
		dto1.setNotitle(dto.getNotitle());
		dto1.setNocontent(dto.getNocontent());
		
		
		try {
			service.updateByNum(dto1);

		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("noticeUpdate예외");
		}
		
		return "redirect:/noticeList";
	}
	@RequestMapping("/loginX/noticeDelete")
	public String noticeDelete(int nonum) throws MyException {
		try {
			service.deleteByNum(nonum);

		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("noticeDelete예외");
		}
		
		return "redirect:/noticeList";
		
	}
	

	@ExceptionHandler(MyException.class)
	public String xxxx2() {
		return "error";
	}

}
