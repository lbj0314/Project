package com.controller.packageOrder;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dto.login.ComDTO;
import com.dto.order.PackListDTO;
import com.dto.order.PackOrderDTO;
import com.dto.order.PackResultListDTO;
import com.dto.restaurant.RestDTO;
import com.dto.review.ReviewDTO;
import com.dto.stay.StayDTO;
import com.dto.tour.TourDTO;
import com.exception.MyException;
import com.service.PackOrderService;
import com.service.RestService;
import com.service.StayService;
import com.service.TourService;

import net.sf.json.JSONArray;

@Controller
public class PackageOrderController {

	@Autowired
	TourService tourService;

	@Autowired
	RestService restService;

	@Autowired
	StayService stayService;

	@Autowired
	PackOrderService packService;

	@RequestMapping("/packageOrderForm")
	@ResponseBody
	public ModelAndView packageOrderForm(@RequestParam(defaultValue = "0") int attNum,
			@RequestParam(defaultValue = "0") int restNum, @RequestParam(defaultValue = "0") int stayNum,
			@RequestParam(defaultValue = "0") int betweenDay, @RequestParam(defaultValue = "0") String startDay,
			@RequestParam(defaultValue = "0") String endDay, HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/orderForm");
		if (attNum != 0) {
			if (session.getAttribute("orderTourList") == null) {
				List<TourDTO> tourList = new ArrayList<>();
				TourDTO tourDto = tourService.selectByTourNum(attNum);
				tourList.add(tourDto);
				session.setAttribute("orderTourList", tourList);
			} else {
				List<TourDTO> tourList = (List<TourDTO>) session.getAttribute("orderTourList");
				TourDTO tourDto = tourService.selectByTourNum(attNum);
				tourList.add(tourDto);
				session.setAttribute("orderTourList", tourList);
			}
		} else if (restNum != 0) {
			if (session.getAttribute("orderRestList") == null) {
				List<RestDTO> restList = new ArrayList<>();
				RestDTO restDto = restService.selectByRestNum(restNum);
				restList.add(restDto);
				session.setAttribute("orderRestList", restList);
			} else {
				List<RestDTO> restList = (List<RestDTO>) session.getAttribute("orderRestList");
				RestDTO restDto = restService.selectByRestNum(restNum);
				restList.add(restDto);
				session.setAttribute("orderRestList", restList);
			}
		} else if (stayNum != 0) {
			if (session.getAttribute("orderStayList") == null) {
				List<StayDTO> stayList = new ArrayList<>();
				StayDTO stayDto = stayService.staySelectByNum(stayNum);
				stayList.add(stayDto);
				session.setAttribute("orderStayList", stayList);
			} else {
				List<StayDTO> stayList = (List<StayDTO>) session.getAttribute("orderStayList");
				StayDTO stayDto = stayService.staySelectByNum(stayNum);
				stayList.add(stayDto);
				session.setAttribute("orderStayList", stayList);
			}
		}

		session.setAttribute("betweenDay", betweenDay);

		if (startDay.equals("0")) {

			Date today = new Date();
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			startDay = transFormat.format(today);
			endDay = transFormat.format(today);

			session.setAttribute("startDay", startDay);
			session.setAttribute("endDay", endDay);
		} else if (!startDay.equals("0")) {

			session.setAttribute("startDay", startDay);
			session.setAttribute("endDay", endDay);
		}
		mav.addObject("orderForm", "aaaaa");

		return mav;
	}

	@RequestMapping(value = "/reservationPackage", method = RequestMethod.POST)
	@ResponseBody
	public String reservationPackage(@RequestBody String reservArray, HttpSession session1) {

		List<Map<String, Object>> resultMap = new ArrayList<Map<String, Object>>();
		resultMap = JSONArray.fromObject(reservArray);

		session1.setAttribute("reserv", resultMap);

		return reservArray;

	}

	@RequestMapping(value = "/packReserv", method = RequestMethod.GET)
	public ModelAndView aaaa(HttpSession session1, HttpSession session) {
		ModelAndView mav = new ModelAndView();

		List<Map<String, Object>> resultMap = (List<Map<String, Object>>) session1.getAttribute("reserv");

		for (Map<String, Object> map : resultMap) {

			if (map.get("date") == null)
				map.put("date", 1);

			if (map.get("type").equals("관광지")) {
				TourDTO tourDto = tourService.selectByTourNum(Integer.parseInt((String) map.get("num")));
				map.put("tourDto", tourDto);
			} else if (map.get("type").equals("음식점")) {
				RestDTO restDto = restService.selectByRestNum(Integer.parseInt((String) map.get("num")));
				map.put("restDto", restDto);
			} else {
				StayDTO stayDto = stayService.staySelectByNum(Integer.parseInt((String) map.get("num")));
				map.put("stayDto", stayDto);
			}
			System.out.println(map.get("date") + " : " + map.get("num") + " : " + map.get("type"));
		}

		mav.addObject("reserv", resultMap);

		mav.addObject("orderForm", "aaaaa");
		mav.setViewName("order/packReserv");

		return mav;

	}

	@RequestMapping("/packageBuy")
	public String packageBuy(@RequestParam int resultPrice, @RequestParam int adultCount, @RequestParam int kidCount,
			@RequestParam String payment, @RequestParam String packName, HttpSession session, HttpSession session1,
			Model m) {
		// 시작날짜,종료날짜,총합계,인원수, usernum DB // 시작일자,종료날짜, 숙박,관광지,맛집별 넘버,몇일차, usernum DB
		//
		List<Map<String, Object>> resultMap = (List<Map<String, Object>>) session1.getAttribute("reserv");
		ComDTO dto = (ComDTO) session.getAttribute("comLogin");

		PackOrderDTO odto = new PackOrderDTO();
		Map<String, Object> map = new HashMap<String, Object>();

		List<PackListDTO> list = new ArrayList<>();
		/*
		 * HashMap<String, String> serviceMap = new HashMap<>(); serviceMap.put("comId",
		 * dto.getComid());
		 */

		odto.setComNum(dto.getComnum());
		odto.setAdult(adultCount);
		odto.setKid(kidCount);
		odto.setPackName(packName);
		odto.setPayment(payment);
		odto.setPrice(resultPrice);
		odto.setStartDay((String) session.getAttribute("startDay"));
		odto.setEndDay((String) session.getAttribute("endDay"));
		odto.setState(0);
		map.put("startDay", (String) session.getAttribute("startDay"));
		map.put("comNum", (int) dto.getComnum());

		PackOrderDTO pdto = packService.packOrderInsert(odto, map);

		// serviceMap.put("totalPrice", resultPrice);
		// serviceMap.put("startDate", startDate);

		for (Map<String, Object> controllMap : resultMap) {

			if (controllMap.get("date") == null) {
				controllMap.put("date", "1");
			}
			PackListDTO ddto = new PackListDTO();
			ddto.setComNum(dto.getComnum());

			ddto.setDay(Integer.parseInt(String.valueOf(controllMap.get("date"))));
			System.out.println(ddto.getDay());
			ddto.setPackOrderNum(pdto.getPackOrderNum());
			ddto.setTypeNum(Integer.parseInt(String.valueOf(controllMap.get("num"))));
			ddto.setType(String.valueOf(controllMap.get("type")));
			ddto.setState(0);
			ddto.setEndDay(pdto.getEndDay());
			list.add(ddto);
			// System.out.println(ldto.get(0));
			// System.out.println(ldto.get(1));
			// System.out.println(ldto.get(2));

		}

		packService.packListInsert(list);

		session1.removeAttribute("reserv");

		session.removeAttribute("orderTourList");

		session.removeAttribute("orderRestList");

		session.removeAttribute("orderStayList");

		session.removeAttribute("betweenDay");

		session.removeAttribute("startDay");

		session.removeAttribute("endDay");

		m.addAttribute("orderDone", 1);
		return "order/orderForm";
	}

	// 제발 지우지 말아주세요 ajax 통신부에요 왜 값이 안먹나했네
	@ResponseBody
	@RequestMapping("/packMulty")
	public int packMulty(int n) {
		return n;
	}

	@RequestMapping("/Reserv")
	public ModelAndView Reserv(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		ComDTO cdto = (ComDTO) session.getAttribute("comLogin");

		List<PackOrderDTO> odto = packService.packOrderList(cdto.getComnum());
		List<PackListDTO> ldto = packService.packListList(cdto.getComnum());
		List<PackResultListDTO> ydto = null;
		Map<String, Object> map = new HashMap<>();

		// for문 시작
		for (PackOrderDTO dto : odto) {

			// 반복 돌리기 위한 초기회 작업
			List<List<PackResultListDTO>> lldto = new ArrayList<>();
			List<PackResultListDTO> yydto = new ArrayList<>();

			String a1 = "a";
			String a2 = "b";
			String a3 = "c";

			// 조건비교
			for (PackListDTO packListDTO : ldto) {

				ydto = null;
				String tt = packListDTO.getType();
				if (tt.equals("음식점") && a1.equals("a")) {
					System.out.println(packListDTO.getType());
					map.put("type", packListDTO.getType());
					map.put("packOrderNum", dto.getPackOrderNum());

					ydto = packService.selectByResultPack(map);
					a1 = "nono";
					System.out.println("second1" + ydto);
				} else if (tt.equals("관광지") && a2.equals("b")) {
					System.out.println(packListDTO.getType());
					map.put("type", packListDTO.getType());
					map.put("packOrderNum", dto.getPackOrderNum());
					map.get("type");
					ydto = packService.selectByResultPack(map);
					a2 = "nono";

				} else if (tt.equals("숙박업소") && a3.equals("c")) {
					System.out.println(packListDTO.getType());
					map.put("type", packListDTO.getType());
					map.put("packOrderNum", dto.getPackOrderNum());
					map.get("type");
					ydto = packService.selectByResultPack(map);
					a3 = "nono";

				}

				if (ydto != null) {
					lldto.add(ydto);
				}

			}
			System.out.println("lldto!" + lldto);

			for (List<PackResultListDTO> packResultListDTO : lldto) {

				for (PackResultListDTO aaa : packResultListDTO) {
					yydto.add(aaa);
				}
			}

			dto.setPackrelist(yydto);

			ydto = null;

		}

		for (PackOrderDTO dto : odto) {
			System.out.println("GETPACKLIST!" + dto.getPackrelist());

		}

		mav.addObject("order", odto);
		mav.setViewName("mypage/mypageReservation");

		return mav;
	}

	@RequestMapping("/ReservLeave")
	public ModelAndView ReservLeave(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		ComDTO cdto = (ComDTO) session.getAttribute("comLogin");

		List<PackOrderDTO> odto = packService.packOrderListLeave(cdto.getComnum());
		List<PackListDTO> ldto = packService.packListListLeave(cdto.getComnum());
		List<PackResultListDTO> ydto = null;
		Map<String, Object> map = new HashMap<>();

		// for문 시작
		for (PackOrderDTO dto : odto) {

			// 반복 돌리기 위한 초기회 작업
			List<List<PackResultListDTO>> lldto = new ArrayList<>();
			List<PackResultListDTO> yydto = new ArrayList<>();

			String a1 = "a";
			String a2 = "b";
			String a3 = "c";

			// 조건비교
			for (PackListDTO packListDTO : ldto) {

				ydto = null;
				String tt = packListDTO.getType();
				if (tt.equals("음식점") && a1.equals("a")) {
					System.out.println(packListDTO.getType());
					map.put("type", packListDTO.getType());
					map.put("packOrderNum", dto.getPackOrderNum());

					ydto = packService.selectByResultPackLeave(map);
					a1 = "nono";
					System.out.println("second1" + ydto);
				} else if (tt.equals("관광지") && a2.equals("b")) {
					System.out.println(packListDTO.getType());
					map.put("type", packListDTO.getType());
					map.put("packOrderNum", dto.getPackOrderNum());
					map.get("type");
					ydto = packService.selectByResultPackLeave(map);
					a2 = "nono";

				} else if (tt.equals("숙박업소") && a3.equals("c")) {
					System.out.println(packListDTO.getType());
					map.put("type", packListDTO.getType());
					map.put("packOrderNum", dto.getPackOrderNum());
					map.get("type");
					ydto = packService.selectByResultPackLeave(map);
					a3 = "nono";

				}

				if (ydto != null) {
					lldto.add(ydto);
				}

			}
			System.out.println("lldto!" + lldto);

			for (List<PackResultListDTO> packResultListDTO : lldto) {

				for (PackResultListDTO aaa : packResultListDTO) {
					yydto.add(aaa);
				}
			}

			dto.setPackrelist(yydto);

			ydto = null;

		}

		mav.addObject("order", odto);
		mav.setViewName("mypage/mypageBox");

		return mav;
	}

	@RequestMapping(value = "/Review", method = RequestMethod.GET)
	public ModelAndView Review(@ModelAttribute PackOrderDTO dto) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("order", dto);
		mav.setViewName("mypage/mypageReview/reviewWriteView");
		return mav;
	}

	@RequestMapping("/deletePackage")
	public String deletePackage(@RequestBody String[] deleteArray, HttpSession session) {
		for (int i = 0; i < deleteArray.length; i++) {

			String deleteType = deleteArray[i].substring(deleteArray[i].length() - 6, deleteArray[i].length());
			int deleteData = Integer.parseInt(deleteArray[i].substring(0, deleteArray[i].length() - 6));
			if (deleteType.equals("tourTr")) {
				List<TourDTO> list = (List<TourDTO>) session.getAttribute("orderTourList");
				while (true) {
					if (list.size() > 1) {
						for (TourDTO dto : list) {
							if (dto.getAttNum() == deleteData) {
								list.remove(dto);
								session.setAttribute("orderTourList", list);
								break;
							}
						}

					} else if (list.size() == 1) {
						session.removeAttribute("orderTourList");
					}
					break;
				}

			}
			if (deleteType.equals("restTr")) {
				List<RestDTO> list = (List<RestDTO>) session.getAttribute("orderRestList");
				while (true) {
					if (list.size() > 1) {
						for (RestDTO dto : list) {
							if (dto.getRestNum() == deleteData) {
								list.remove(dto);
								session.setAttribute("orderRestList", list);
								break;
							}
						}

					} else if (list.size() == 1) {
						System.out.println("1개");
						session.removeAttribute("orderRestList");
					}
					break;
				}

			}
			if (deleteType.equals("stayTr")) {
				List<StayDTO> list = (List<StayDTO>) session.getAttribute("orderStayList");
				while (true) {
					if (list.size() > 1) {
						for (StayDTO dto : list) {
							if (dto.getStayNum() == deleteData) {
								list.remove(dto);
								session.setAttribute("orderStayList", list);
								break;
							}
						}

					} else if (list.size() == 1) {
						System.out.println("1개");
						session.removeAttribute("orderStayList");
					}
					break;
				}

			}

		}
		return "order/orderForm";
	}

	@RequestMapping("/guideDate")
	@ResponseBody
	public void guideDate(@RequestBody String dateForm, HttpSession session,HttpServletResponse response) {

		String startDay = dateForm.substring(10, 20);
		String endDay = dateForm.substring(29);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
		Date startDate = null;
		Date endDate = null;
		boolean result = true;
		try {
			startDate = format.parse(startDay);
			endDate = format.parse(endDay);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ComDTO comDto = (ComDTO) session.getAttribute("comLogin");
		int comNum = comDto.getComnum();
		List<PackOrderDTO> list = packService.packOrderList(comNum);
		for (PackOrderDTO orderDto : list) {
			String orderStartDay = orderDto.getStartDay();
			String orderEndDay = orderDto.getEndDay();
			Date orderStartDate = null;
			Date orderEndDate = null;
			SimpleDateFormat format2 = new SimpleDateFormat("yyyy/mm/dd");
			try {
				orderStartDate = format2.parse(orderStartDay);
				orderEndDate = format2.parse(orderEndDay);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			long a = startDate.getTime()-orderStartDate.getTime();
			long c = endDate.getTime()-orderStartDate.getTime();
			if(a>0) {
				result = false;
			}else if(c<0) {
				result = false;
			}
		}
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@ExceptionHandler(MyException.class)
	public String xxxx2() {
		return "error";
	}

}
