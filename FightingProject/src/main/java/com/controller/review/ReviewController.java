package com.controller.review;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dto.login.ComDTO;
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
	
	
	@RequestMapping("/reviewRetrieve/packReviewNum/{packReviewNum}")
	public ModelAndView reviewRetrieve(@PathVariable int packReviewNum ,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Map<String, Integer> map = new HashMap<>();
		Map<String, Object> map2 = new HashMap<>();
		
		if(session.getAttribute("comLogin") != null) {
		ComDTO dto = (ComDTO)session.getAttribute("comLogin");
		
		
		int comNum1=dto.getComnum();
		mav.addObject("comNum1",comNum1);
		}
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
	
	
	@RequestMapping("/loginX/packReviewGoods")
	@ResponseBody
	public String packReviewGoods(@RequestParam int packReviewNum) throws MyException {
		System.out.println(packReviewNum);
		String cnt=null;
		System.out.println(packReviewNum);
		
		
		
		try {
		
			ReviewDTO dto = reviewService.readpackReviewGoods(packReviewNum);
			cnt = String.valueOf(dto.getPackReviewGoods());
			System.out.println("cnt!!"+cnt);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("packReviewGoods예외");
			
		}
		
		
		
		return cnt;
	}
	@RequestMapping("/reviewPerPage")
	public String reviewPerPage(String perPage) {
		if (perPage.equals("def"))
			perPage = "3";
		System.out.println(perPage);
		ReviewPageDTO.setPerPage(Integer.parseInt(perPage));
		return "redirect:/reviewList";
	}
	
	@RequestMapping("/loginX/packReviewUpdate")
	public String packReviewUpdate(ReviewDTO dto)throws MyException{
	
		
		ReviewDTO dto1 = new ReviewDTO();
		dto1.setPackReviewNum(dto.getPackReviewNum());
		dto1.setPackContent(dto.getPackContent());
		dto1.setPackTitle(dto.getPackTitle());
		
		
		try {
			reviewService.packReviewUpdate(dto1);

		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("ReviewUpdate예외");
		}
		
		return "redirect:/reviewList";
	}
	
	
	
	@RequestMapping("/loginX/packReviewDelete/packReviewNum/{packReviewNum}")
	public String packReviewDelete(@PathVariable int packReviewNum) throws MyException {
		try {
			reviewService.packReviewDelete(packReviewNum);

		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("packReviewDelete예외");
		}
		
		return "redirect:/reviewList";
		
	}
	

}
