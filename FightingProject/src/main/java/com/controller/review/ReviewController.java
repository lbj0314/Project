package com.controller.review;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dto.notice.NoticeDTO;
import com.dto.notice.PageDTO;
import com.dto.order.PackListDTO;
import com.dto.order.PackOrderDTO;
import com.dto.order.PackResultListDTO;
import com.dto.restaurant.RestDTO;
import com.dto.review.ReviewDTO;
import com.dto.review.ReviewPageDTO;
import com.exception.MyException;
import com.service.ReviewService;

@Controller
public class ReviewController {
	
	
	@Autowired
	ReviewService reviewService;
	
	
	@RequestMapping("/reviewInsert")
	public String packReviewInsert(@ModelAttribute ReviewDTO dto,Model m) {
		
		reviewService.packReviewInsert(dto);
		
		m.addAttribute("success","성공적으로 리뷰가 등록되었습니다!");
		
		return "redirect:reviewList";
	}
	
	@RequestMapping("/reviewList")
	public String page(@RequestParam(required = false) HashMap<String, String> map, Model m) throws MyException {
		// list.jsp에서 1 2 3 4

		if (map.get("curPage") == null || map.get("curPage").equals("")) {
			map.put("curPage", "1");
		}
		try {
			ReviewPageDTO list = reviewService.page(map);
			m.addAttribute("list", list);

		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("list예외");
		}
		return "mypage/mypageReview/reviewlistview";
	}
	
	
	@RequestMapping("/reviewRetrieve")
	public ModelAndView reviewRetrieve(@RequestParam int packReviewNum) {
		ModelAndView mav = new ModelAndView();
		Map<String, Integer> map = new HashMap<>();
		Map<String, Object> map2 = new HashMap<>();
		ReviewDTO rdto = reviewService.reviewRetrieve(packReviewNum);
		int comNum=rdto.getComNum();
		int packOrderNum=rdto.getPackOrderNum();
		map.put("comNum", comNum);
		map.put("packOrderNum", packOrderNum);
		map2.put("packOrderNum", packOrderNum);
		PackOrderDTO odto = reviewService.packOrderView(map);
		
		String a1="a";
		String a2="b";
		String a3="c";
		
		List<PackListDTO> ldto = reviewService.packListSelect(map);
		List<PackResultListDTO> lldto = new ArrayList<>();
		List<List<PackResultListDTO>> yydto = new ArrayList<>();
		List<PackResultListDTO> llldto = new ArrayList<>();
	
		for (PackListDTO packListDTO : ldto) {
			
			String type=packListDTO.getType();
			map2.put("type", type);
			
			if(a1.equals("a") && type.equals("관광지")) {
				lldto = reviewService.packListView(map2);
				a1="nono";
			}
			else if(a2.equals("b") && type.equals("숙박업소")) {
				
				lldto = reviewService.packListView(map2);
				a2="nono";
			}
			else if(a3.equals("c") && type.equals("음식점")) {
				
				lldto = reviewService.packListView(map2);
				a3="nono";
			}
			 if(lldto!=null) yydto.add(lldto);
			 lldto=null;
			 map2.remove("type");
		}
		
		for (List<PackResultListDTO> list : yydto) {
			for (PackResultListDTO packResultListDTO : list) {
				llldto.add(packResultListDTO);
			}
		}
		/*List<List<PackResultListDTO>> yyydto = new ArrayList<>();
		for (List<PackResultListDTO> list : yydto) {
			yyydto.add(list);
		}*/
		
		
		
		mav.addObject("rdto",rdto);
		mav.addObject("odto",odto);
		mav.addObject("ldto",llldto);
		
		mav.setViewName("mypage/mypageReview/reviewRetrieveview");
		return mav;
		
		
	
	}
	
	
	/*@RequestMapping("/loginX/packReviewGoods")
	@ResponseBody
	public String packReviewGoods(@RequestParam int packReviewNum) throws MyException {
		
		String cnt=null;
		
		try {
		
			ReviewDTO dto = service.goodsRest(restNum);
			cnt = String.valueOf(dto.getRestGoods());
			System.out.println("cnt!!"+cnt);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("restGoods예외");
			
		}
		
		
		return cnt;
	}*/
	
	
	
	@RequestMapping("/reviewPerPage")
	public String reviewPerPage(String perPage) {
		if (perPage.equals("def"))
			perPage = "3";
		System.out.println(perPage);
		ReviewPageDTO.setPerPage(Integer.parseInt(perPage));
		return "reviewList";
	}
	/*
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
		
	}*/
	

}
