package com.mycom.happyhouse.service;

import java.util.List;

import com.mycom.happyhouse.dto.HouseInfoDto;
import com.mycom.happyhouse.dto.HouseResultDto;
import com.mycom.happyhouse.dto.SidoGugunCodeDto;

public interface HouseMapService {
	
//	public HouseResultDto houseMapList(HouseParamDto houseParamDto);
//	public HouseResultDto houseMapListSearchWord(HouseParamDto houseParamDto);
	
//	public int houseMapListTotalCount();
//	public int houseMapListSearchWordTotalCount(HouseParamDto houseParamDto);
	
	public HouseResultDto getSido();
	
	public HouseResultDto getGugunInSido(String sido);
	public HouseResultDto getDongInGugun(String gugun);
	public HouseResultDto getAptInDong(String dong);
	public HouseResultDto getDealApt(String AptName);
	
}
