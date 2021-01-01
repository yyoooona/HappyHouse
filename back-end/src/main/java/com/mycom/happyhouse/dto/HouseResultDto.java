package com.mycom.happyhouse.dto;

import java.util.List;

public class HouseResultDto {
		// 
	private int result;
	private HouseDealDto hddto;
	private HouseInfoDto hidto;
	private SidoGugunCodeDto sgdto;
	private List<HouseDealDto> hdlist;
	private List<HouseInfoDto> hilist;
	private List<SidoGugunCodeDto> sglist;
	private int count;
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public HouseDealDto getHddto() {
		return hddto;
	}
	public void setHddto(HouseDealDto hddto) {
		this.hddto = hddto;
	}
	public HouseInfoDto getHidto() {
		return hidto;
	}
	public void setHidto(HouseInfoDto hidto) {
		this.hidto = hidto;
	}
	public SidoGugunCodeDto getSgdto() {
		return sgdto;
	}
	public void setSgdto(SidoGugunCodeDto sgdto) {
		this.sgdto = sgdto;
	}
	public List<HouseDealDto> getHdlist() {
		return hdlist;
	}
	public void setHdlist(List<HouseDealDto> hdlist) {
		this.hdlist = hdlist;
	}
	public List<HouseInfoDto> getHilist() {
		return hilist;
	}
	public void setHilist(List<HouseInfoDto> hilist) {
		this.hilist = hilist;
	}
	public List<SidoGugunCodeDto> getSglist() {
		return sglist;
	}
	public void setSglist(List<SidoGugunCodeDto> sglist) {
		this.sglist = sglist;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
	

}
