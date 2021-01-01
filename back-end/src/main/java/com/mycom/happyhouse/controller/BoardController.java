package com.mycom.happyhouse.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.mycom.happyhouse.dto.BoardDto;
import com.mycom.happyhouse.dto.BoardParamDto;
import com.mycom.happyhouse.dto.BoardResultDto;
import com.mycom.happyhouse.dto.UserDto;
import com.mycom.happyhouse.service.BoardService;
import com.mycom.happyhouse.service.UserService;

@RestController
public class BoardController {

	@Autowired
	BoardService service;
	
	private static final int SUCCESS = 1;
	private static final int FAIL = -1;
	
	@GetMapping(value="/boards")
	private ResponseEntity<BoardResultDto> boardList(BoardParamDto boardParamDto){
		
		BoardResultDto boardResultDto;
		
		if( boardParamDto.getSearchWord().isEmpty() ) {
			boardResultDto = service.boardList(boardParamDto);
		}else {
			boardResultDto = service.boardListSearchWord(boardParamDto);
		}
		
		if( boardResultDto.getResult() == SUCCESS ) {
			return new ResponseEntity<BoardResultDto>(boardResultDto, HttpStatus.OK);
		}else {
			return new ResponseEntity<BoardResultDto>(boardResultDto, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
//	@GetMapping(value="/boards/count")
//	private ResponseEntity<Integer> boardListCount(BoardParamDto boardParamDto){
//		
//		if( boardParamDto.getSearchWord().isEmpty() ) {
//			return new ResponseEntity<Integer>( service.boardListTotalCount(), HttpStatus.OK);
//		}else {
//			return new ResponseEntity<Integer>( service.boardListSearchWordTotalCount(boardParamDto), HttpStatus.OK);
//		}
//		 
//	}
	
	@GetMapping(value="/boards/{boardId}")
	private ResponseEntity<BoardResultDto> boardDetail(@PathVariable int boardId, HttpSession session){

		BoardParamDto boardParamDto = new BoardParamDto();
		boardParamDto.setBoardId(boardId);
		boardParamDto.setUserSeq( ((UserDto) session.getAttribute("userDto")).getUser_seq());
		
		BoardResultDto boardResultDto = service.boardDetail(boardParamDto);

		if( boardResultDto.getResult() == SUCCESS ) {
			return new ResponseEntity<BoardResultDto>(boardResultDto, HttpStatus.OK);
		}else {
			return new ResponseEntity<BoardResultDto>(boardResultDto, HttpStatus.INTERNAL_SERVER_ERROR);
		}		 
	}
	
	@PostMapping(value="/boards")
	private ResponseEntity<BoardResultDto> boardInsert(
			BoardDto boardDto, 
			@RequestParam(value="file", required = false) MultipartFile file) {
		
		BoardResultDto boardResultDto = service.boardInsert(boardDto, file);
		
		if( boardResultDto.getResult() == SUCCESS ) {
			return new ResponseEntity<BoardResultDto>(boardResultDto, HttpStatus.OK);
		}else {
			return new ResponseEntity<BoardResultDto>(boardResultDto, HttpStatus.INTERNAL_SERVER_ERROR);
		}		 
	}
	
	// PUT + multipart/form-data (X)
	// In RESTful,
	// PUT & DELETE methods are defined to be idempotent
	// 만약 글만 수정한다면?? PUT mapping OK  여러 번 수정해도 back-end 결과가 같음
	// 첨부파일이 포함되면 idempotent 하지 않음.
	
	@PostMapping(value="/boards/{boardId}") 
	private ResponseEntity<BoardResultDto> boardUpdate(
			BoardDto boardDto, 
			@RequestParam(value="file", required = false) MultipartFile file){

		BoardResultDto boardResultDto = service.boardUpdate(boardDto, file);
		
		if( boardResultDto.getResult() == SUCCESS ) {
			return new ResponseEntity<BoardResultDto>(boardResultDto, HttpStatus.OK);
		}else {
			return new ResponseEntity<BoardResultDto>(boardResultDto, HttpStatus.INTERNAL_SERVER_ERROR);
		}		
	}
	
	@DeleteMapping(value="/boards/{boardId}") 
	private ResponseEntity<BoardResultDto> boardDelete(@PathVariable(value="boardId") int boardId){
		BoardResultDto boardResultDto = service.boardDelete(boardId);
		
		if( boardResultDto.getResult() == SUCCESS ) {
			return new ResponseEntity<BoardResultDto>(boardResultDto, HttpStatus.OK);
		}else {
			return new ResponseEntity<BoardResultDto>(boardResultDto, HttpStatus.INTERNAL_SERVER_ERROR);
		}		 
	}

//	@ExceptionHandler(Exception.class)
//	public String handleErrorView(HttpServletRequest req, Exception ex) {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("exception", ex);
//		mav.addObject("url", req.getRequestURL());
//		mav.setViewName("error");
//		return "error";
//	}
//	
//	@ExceptionHandler(Exception.class)
//	public String handleErrorView() {
//		return "error";
//	}
//	
//	@ExceptionHandler({ SQLException.class, IOException.class })
//	public String handleErrorViewSQL() {
//		return "error";
//	}
	
//	@ExceptionHandler(Exception.class)
//	public ResponseEntity<BoardResultDto> handleErrorResponseEntity() {
//		BoardResultDto boardResultDto = new BoardResultDto();
//		boardResultDto.setResult(FAIL);
//		return new ResponseEntity<BoardResultDto>(boardResultDto, HttpStatus.INTERNAL_SERVER_ERROR);
//	}
}
