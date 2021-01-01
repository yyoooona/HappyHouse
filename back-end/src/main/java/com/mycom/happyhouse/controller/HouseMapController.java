package com.mycom.happyhouse.controller;

import javax.servlet.http.HttpServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mycom.happyhouse.dto.HouseResultDto;
import com.mycom.happyhouse.service.HouseMapService;

@CrossOrigin(origins = "*", maxAge = 6000)
@RestController
public class HouseMapController extends HttpServlet {

	@Autowired
	HouseMapService houseMapService ;
	
	private static final int SUCCESS = 1;
	private static final int FAIL = -1;
	
	@GetMapping(value="/getSido")
	private ResponseEntity<HouseResultDto> getSido(){
		
		HouseResultDto houseResultDto;
		houseResultDto = houseMapService.getSido();
		
		if(houseResultDto.getResult() == SUCCESS) {
			return new ResponseEntity<HouseResultDto>(houseResultDto, HttpStatus.OK);
		}else {
			return new ResponseEntity<HouseResultDto>(houseResultDto,HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping(value="/getGugunInSido")
	private ResponseEntity<HouseResultDto> getGugunInSido(@RequestParam("sido") String sido) {
		HouseResultDto houseResultDto;
		houseResultDto = houseMapService.getGugunInSido(sido);
		if(houseResultDto.getResult() == SUCCESS) {
			return new ResponseEntity<HouseResultDto>(houseResultDto, HttpStatus.OK);
		}else {
			return new ResponseEntity<HouseResultDto>(houseResultDto,HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping(value="/getDongInGugun")
	private ResponseEntity<HouseResultDto> getDongInGugun(@RequestParam("gugun") String gugun) {
		
		HouseResultDto houseResultDto;
		houseResultDto = houseMapService.getDongInGugun(gugun);
		if(houseResultDto.getResult() == SUCCESS) {
			return new ResponseEntity<HouseResultDto>(houseResultDto, HttpStatus.OK);
		}else {
			return new ResponseEntity<HouseResultDto>(houseResultDto,HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping(value="/getAptInDong")
	private ResponseEntity<HouseResultDto> getAptInDong(@RequestParam("dong") String dong){
		HouseResultDto houseResultDto;
		houseResultDto = houseMapService.getAptInDong(dong);
		if(houseResultDto.getResult()==SUCCESS) {
			return new ResponseEntity<HouseResultDto>(houseResultDto, HttpStatus.OK);
		}
		else {
			return new ResponseEntity<HouseResultDto>(houseResultDto, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	

	
//	@PostMapping(value = "/map")
//	protected void process(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		response.setCharacterEncoding("UTF-8");
//		String act = request.getParameter("act");
//
//		if ("sido".equals(act)) {
//			PrintWriter out = response.getWriter();
//			List<SidoGugunCodeDto> list = null;
//			JSONArray arr = new JSONArray();
//			try {
//				list = houseMapService.getHouseMapService().getSido();
//				for (SidoGugunCodeDto dto : list) {
//					JSONObject obj = new JSONObject();
//					obj.put("sido_code", dto.getSidoCode());
//					obj.put("sido_name", dto.getSidoName());
//					arr.add(obj);
//				}
//			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
//				e.printStackTrace();
//			} finally {
//				out.print(arr.toJSONString());
//				out.close();
//			}
//		} // sido
//		else if ("gugun".equals(act)) {
//			String sido = request.getParameter("sido");
//			PrintWriter out = response.getWriter();
//			List<SidoGugunCodeDto> list = null;
//			JsonArray arr = new JsonArray();
//			try {
//				list = HouseMapServiceImpl.getHouseMapService().getGugunInSido(sido);
//				for (SidoGugunCodeDto dto : list) {
//					JSONObject obj = new JSONObject();
//					obj.put("gugun_code", dto.getGugunCode());
//					obj.put("gugun_name", dto.getGugunName());
//					arr.add(obj);
//				}
//			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
//				e.printStackTrace();
//			} finally {
//				out.print(arr.toJSONString());
//				out.close();
//			}
//		} // gugun
//		else if ("dong".equals(act)) {
//			String gugun = request.getParameter("gugun");
//			PrintWriter out = response.getWriter();
//			List<HouseInfoDto> list = null;
//			JSONArray arr = new JSONArray();
//			try {
//				list = HouseMapServiceImpl.getHouseMapService().getDongInGugun(gugun);
//				for (HouseInfoDto dto : list) {
//					JSONObject obj = new JSONObject();
//					obj.put("code", dto.getCode());
//					obj.put("dong", dto.getDong());
//					arr.add(obj);
//				}
//			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
//				e.printStackTrace();
//			} finally {
//				out.print(arr.toJSONString());
//				out.close();
//			}
//		} // dong
//		else if ("apt".equals(act)) {
//			String dong = request.getParameter("dong");
//			PrintWriter out = response.getWriter();
//			List<HouseInfoDto> list = null;
//			JSONArray arr = new JSONArray();
//			try {
//				list = HouseMapServiceImpl.getHouseMapService().getAptInDong(dong);
//				for (HouseInfoDto dto : list) {
//					JSONObject obj = new JSONObject();
//					obj.put("no", dto.getNo());
//					obj.put("dong", dto.getDong());
//					obj.put("aptName", dto.getAptName());
//					obj.put("code", dto.getCode());
//					obj.put("jibun", dto.getJibun());
//					arr.add(obj);
//				}
//			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
//				e.printStackTrace();
//			} finally {
//				out.print(arr.toJSONString());
//				out.close();
//			}
//		} // dong
//	}// process


}