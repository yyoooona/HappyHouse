package com.mycom.happyhouse.dto;

public class UserDto {
	private int user_seq;
	private String user_id;
	private String user_name;
	private String user_password;
	private String email;
	private String user_profile_imgae_url;
	private int role;
	private String joindate;

	public UserDto(String user_id, String user_name, String user_password, String email) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_password = user_password;
		this.email = email;
	}

	public UserDto(int user_seq, String user_id, String user_name, String user_password, String email) {
		super();
		this.user_seq = user_seq;
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_password = user_password;
		this.email = email;
	}

	public UserDto(int user_seq, String user_id, String user_name, String email, String user_profile_imgae_url,
			int role) {
		super();
		this.user_seq = user_seq;
		this.user_id = user_id;
		this.user_name = user_name;
		this.email = email;
		this.user_profile_imgae_url = user_profile_imgae_url;
		this.role = role;
	}

	public int getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUser_profile_imgae_url() {
		return user_profile_imgae_url;
	}

	public void setUser_profile_imgae_url(String user_profile_imgae_url) {
		this.user_profile_imgae_url = user_profile_imgae_url;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

}
