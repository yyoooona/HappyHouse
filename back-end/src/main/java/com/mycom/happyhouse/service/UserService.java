package com.mycom.happyhouse.service;

import com.mycom.happyhouse.dto.UserDto;
import com.mycom.happyhouse.dto.UserResultDto;

public interface UserService {
	public UserResultDto register(UserDto userDto);
	public UserDto login(UserDto userDto);
}
