package com.mycom.happyhouse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycom.happyhouse.dto.HouseDealDto;
import com.mycom.happyhouse.dto.HouseInfoDto;
import com.mycom.happyhouse.dto.SidoGugunCodeDto;

@Mapper
public interface HouseMapDao {

//	public List<HouseInfoDto> houseMapList(HouseParamDto houseParamDto);
//	public int houseMapListTotalCount();
//	public List<HouseInfoDto> houseMapListSearchWord(HouseParamDto houseParamDto);
//	public int houseMapListSearchWordTotalCount(HouseParamDto houseParamDto);
	
	public List<SidoGugunCodeDto> getSido();
	public List<SidoGugunCodeDto> getGugunInSido(String sido);
	public List<HouseInfoDto> getDongInGugun(String gugun);
	public List<HouseInfoDto> getAptInDong(String dong);
	public List<HouseDealDto> getDealApt(String AptName);
	
}
