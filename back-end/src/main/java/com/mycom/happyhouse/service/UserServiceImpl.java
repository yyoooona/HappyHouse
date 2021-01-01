package com.mycom.happyhouse.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.happyhouse.dao.UserDao;
import com.mycom.happyhouse.dto.UserDto;
import com.mycom.happyhouse.dto.UserResultDto;

@Service
public class UserServiceImpl implements UserService {

	private static final int SUCCESS = 1;
	private static final int FAIL = -1;

	@Autowired
	UserDao userDao;

	@Override
	public UserResultDto register(UserDto userDto) {
		UserResultDto userResultDto = new UserResultDto();
		if (userDao.register(userDto) == 1) {
			userResultDto.setResult(SUCCESS);
		} else {
			userResultDto.setResult(FAIL);
		}
		return userResultDto;
	}

	@Override
	public UserDto login(UserDto dto) {
		return userDao.login(dto);
	}

}
