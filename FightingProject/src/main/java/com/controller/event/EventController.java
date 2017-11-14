package com.controller.event;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.event.EventDTO;
import com.dto.event.EventPageDTO;
import com.exception.MyException;
import com.service.EventService;

@Controller
public class EventController {


	@Autowired
	EventService service;

	@RequestMapping("/eventList")
	public String page(@RequestParam(required = false) HashMap<String, String> map, Model m) throws MyException {
		// list.jsp에서 1 2 3 4

		if (map.get("curPage") == null || map.get("curPage").equals("")) {
			map.put("curPage", "1");
		}
		try {
			EventPageDTO list = service.page(map);
			m.addAttribute("list", list);

		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("list예외");
		}
		return "event/eventListView";
	}
	@RequestMapping("/loginX/eventWriteUI")
	public String eventWriteUI() {
		return "event/eventWriteView";
	}
	
	
	
	@RequestMapping("/eventPerPage")
	public String eventPerPage(String perPage) {
		if (perPage.equals("def"))
			perPage = "3";
		System.out.println(perPage);
		EventPageDTO.setEventPerPage(Integer.parseInt(perPage));
		return "redirect:/eventList";
	}
	
	@RequestMapping("/loginX/eventWrite")
	public String eventWrite(EventDTO dto) throws MyException{
		

		EventDTO dto1 = new EventDTO();
		dto1.setEventNotitle(dto.getEventNotitle());
		dto1.setEventNocontent(dto.getEventNocontent());
		dto1.setEventAdmnum(dto.getEventAdmnum());
		try {
			service.boardWrite(dto1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new MyException("eventWrite예외");
		}
		
		
		return "redirect:/eventList";
	}
	
	@RequestMapping("/eventRetrieve")
	public String eventRetrieve(int nonum,Model m) throws MyException {
		
		
		try {
			m.addAttribute("retrieve", service.selectByNum(nonum));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new MyException("eventRetrieve예외");
		}

		 
		 return "event/eventRetrieveView";
	}
	@RequestMapping("/loginX/eventUpdate")
	public String eventUpdate(EventDTO dto)throws MyException{
	
		
		EventDTO dto1 = new EventDTO();
		dto1.setEventNonum(dto.getEventNonum());
		dto1.setEventNotitle(dto.getEventNotitle());
		dto1.setEventNocontent(dto.getEventNocontent());
		
		
		try {
			service.updateByNum(dto1);

		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("eventUpdate예외");
		}
		
		return "redirect:/eventList";
	}
	@RequestMapping("/loginX/eventDelete")
	public String eventDelete(int nonum) throws MyException {
		try {
			service.deleteByNum(nonum);

		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("eventDelete예외");
		}
		
		return "redirect:/eventList";
		
	}
	

	@ExceptionHandler(MyException.class)
	public String xxxx2() {
		return "error";
	}

}
