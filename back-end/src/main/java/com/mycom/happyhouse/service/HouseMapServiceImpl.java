package com.mycom.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.happyhouse.dao.HouseMapDao;
import com.mycom.happyhouse.dto.HouseDealDto;
import com.mycom.happyhouse.dto.HouseInfoDto;
import com.mycom.happyhouse.dto.HouseResultDto;
import com.mycom.happyhouse.dto.SidoGugunCodeDto;

@Service
public class HouseMapServiceImpl implements HouseMapService {
	
	private static final int SUCCESS = 1;
	private static final int FAIL = -1;

	@Autowired
	HouseMapDao houseMapDao;

	@Override
	public HouseResultDto getSido() {
		HouseResultDto houseResultDto = new HouseResultDto();
		try {
			List<SidoGugunCodeDto> sglist = houseMapDao.getSido();
			houseResultDto.setSglist(sglist);
			houseResultDto.setResult(SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			houseResultDto.setResult(FAIL);
		}
		return houseResultDto;
	}

	@Override
	public HouseResultDto getGugunInSido(String sido) {

		HouseResultDto houseResultDto = new HouseResultDto();

		try {
			List<SidoGugunCodeDto> sglist = houseMapDao.getGugunInSido(sido);
			houseResultDto.setSglist(sglist);
			houseResultDto.setResult(SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			houseResultDto.setResult(FAIL);
		}

		return houseResultDto;
	}

	@Override
	public HouseResultDto getDongInGugun(String gugun) {
		HouseResultDto houseResultDto = new HouseResultDto();

		try {
			List<HouseInfoDto> hilist = houseMapDao.getDongInGugun(gugun);
			houseResultDto.setHilist(hilist);
			houseResultDto.setResult(SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			houseResultDto.setResult(FAIL);
		}

		return houseResultDto;
	}

	@Override
	public HouseResultDto getAptInDong(String dong) {
		HouseResultDto houseResultDto = new HouseResultDto();
		try {
			List<HouseInfoDto> hilist = houseMapDao.getAptInDong(dong);
			houseResultDto.setHilist(hilist);
			houseResultDto.setResult(SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			houseResultDto.setResult(FAIL);
		}
		return houseResultDto;
	}

	@Override
	public HouseResultDto getDealApt(String AptName) {
		HouseResultDto houseResultDto = new HouseResultDto();
		
		try {
			List<HouseDealDto> hdlist = houseMapDao.getDealApt(AptName);
			houseResultDto.setHdlist(hdlist);
			houseResultDto.setResult(SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			houseResultDto.setResult(FAIL);
		}
		return houseResultDto;
	}

}
