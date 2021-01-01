package com.mycom.happyhouse.dto;

import java.time.LocalDateTime;

public class NoticeDto {
	private int notice_no;
	private int user_seq;
	private String user_name;
	private String title;
	private String content;
	private LocalDateTime regtime;

	public NoticeDto() {
		// TODO Auto-generated constructor stub
	}

	public NoticeDto(int notice_no, int user_seq, String title, String content) {
		super();
		this.notice_no = notice_no;
		this.user_seq = user_seq;
		this.title = title;
		this.content = content;
	}
	
	public NoticeDto(int notice_no, String user_name, String title, String content, LocalDateTime regtime) {
		super();
		this.notice_no = notice_no;
		this.user_name = user_name;
		this.title = title;
		this.content = content;
		this.regtime = regtime;
	}
	
	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public int getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	
	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDateTime getRegtime() {
		return regtime;
	}

	public void setRegtime(LocalDateTime regtime) {
		this.regtime = regtime;
	}
}
