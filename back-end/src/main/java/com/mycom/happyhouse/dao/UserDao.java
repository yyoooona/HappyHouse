package com.mycom.happyhouse.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycom.happyhouse.dto.UserDto;

@Mapper
public interface UserDao {
	public int register(UserDto userDto);
	public UserDto login(UserDto userDto);
}
