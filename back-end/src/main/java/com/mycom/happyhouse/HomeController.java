//
//package com.mycom.happyhouse;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//
///**
// * Handles requests for the application home page.
// */
//
//	@Controller
//	public class HomeController {
//		
//		@GetMapping(value = "/" )
//		private String home(){
//			return ("index"); 
//		}
//		
//		@GetMapping(value= "/processBoard")
//		private String board() {
//			return ("page/board/boardMain");
//		}
//		
//		@GetMapping(value="/processHouse")
//		private String processHouse() {
//			return ("page/house/houseMain");
//		}
//		
//		@GetMapping(value="/processAbout")
//		private String processAbout() {
//			return ("page/about");
//		}
//		
//		@GetMapping(value="/processNotice")
//		private String processNotice() {
//			return ("page/notice/noticeMain");
//		}
//		
//		/*
//		 * @GetMapping(value = "/login") private String login(){ return ("login"); }
//		 */
//	}
