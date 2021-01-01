package com.mycom.happyhouse.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.mycom.happyhouse.dto.UserDto;
import com.mycom.happyhouse.dto.UserResultDto;
import com.mycom.happyhouse.service.JwtService;
import com.mycom.happyhouse.service.UserService;

//@CrossOrigin(origins = "*", allowedHeaders = "*", maxAge = 6000)
//@CrossOrigin
@CrossOrigin(origins = "*", maxAge = 6000)
@RestController
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Autowired
	UserService service;
	
	@Autowired
	private JwtService jwtService;
	
	public static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	private static final int SUCCESS = 1;
	private static final int FAIL = -1;

	@PostMapping(value = "/user/register")
	public ResponseEntity<UserResultDto> register(@RequestBody UserDto dto, HttpSession session) {
		System.out.println("hi");
		System.out.println(dto.getEmail());
		UserResultDto userResultDto = service.register(dto);
		if (userResultDto.getResult() == SUCCESS) {
			return new ResponseEntity<UserResultDto>(userResultDto, HttpStatus.OK);
		} else {
			return new ResponseEntity<UserResultDto>(userResultDto, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// RestController = Controller + ResponseBody
//	@PostMapping(value = "/user/login")
//	public ResponseEntity<UserDto> login(@RequestBody UserDto dto, HttpSession session) {
//		System.out.println("Email : " + dto.getUser_id());
//		UserDto userDto = service.login(dto.getUser_id());
//		if (userDto != null) {
//			session.setAttribute("userDto", userDto);
//			return new ResponseEntity<UserDto>(userDto, HttpStatus.OK);
//		}
//		return new ResponseEntity<UserDto>(userDto, HttpStatus.NOT_FOUND);
//	}
	@PostMapping("/user/login")
	public ResponseEntity<Map<String, Object>> login(@RequestBody UserDto userDto, HttpServletResponse response, HttpSession session) {
//		System.out.println(this.getClass().getName());
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = null;
		try {
			UserDto loginUser = service.login(userDto);
			
			System.out.println(loginUser);
			if(loginUser != null) {
//				jwt.io에서 확인
//				로그인 성공했다면 토큰을 생성한다.
				String token = jwtService.create(loginUser);
				logger.trace("로그인 토큰정보 : {}", token);
				
//				토큰 정보는 response의 헤더로 보내고 나머지는 Map에 담는다.
//				response.setHeader("auth-token", token);
				System.out.println(token);
				resultMap.put("auth-token", token);
				resultMap.put("user-id", loginUser.getUser_id());
				resultMap.put("user-name", loginUser.getUser_name());
//				resultMap.put("status", true);
//				resultMap.put("data", loginUser);
				status = HttpStatus.ACCEPTED;
			} else {
				resultMap.put("message", "로그인 실패");
				status = HttpStatus.ACCEPTED;
			}
		} catch (Exception e) {
			logger.error("로그인 실패 : {}", e);
			resultMap.put("message", e.getMessage());
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}


	@GetMapping(value = "/user/logout")
	public void logout(HttpSession session) {
		// session 삭제
		session.removeAttribute("userinfo");
		session.invalidate();

	}
}
