package com.mycom.happyhouse.service;

import org.springframework.web.multipart.MultipartFile;

import com.mycom.happyhouse.dto.BoardDto;
import com.mycom.happyhouse.dto.BoardParamDto;
import com.mycom.happyhouse.dto.BoardResultDto;

public interface BoardService {
	
	public BoardResultDto boardDetail(BoardParamDto boardParamDto);
	
	public BoardResultDto boardDelete(int boardId);
	
	public BoardResultDto boardUpdate(BoardDto dto, MultipartFile file);
	
	public BoardResultDto boardInsert(BoardDto dto, MultipartFile file);
			
	public BoardResultDto boardList(BoardParamDto boardParamDto);
	//public int boardListTotalCount();	
	public BoardResultDto boardListSearchWord(BoardParamDto boardParamDto);
	//public int boardListSearchWordTotalCount(boardParamDto boardParamDto);
	
	
	// Changes for FileUpload
	
	
	
	
	
	
	
	
	
}
