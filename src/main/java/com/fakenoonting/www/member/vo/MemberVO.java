package com.fakenoonting.www.member.vo;

import java.util.Date;



public class MemberVO {
	
	private Long id;	
	private String pwd;
	private String nick;
	private String name;
	private char gender;
	private int phone;
	private String mail;
	private Date birth;
	private String address;
	private Date regdate;
	private boolean isExist;
	
	
	
	public MemberVO(Long id, String pwd, String nick, String name, char gender, int phone, String mail, Date birth,
			String address, Date regdate, boolean isExist) {
		
		super();
		this.id = id;
		this.pwd = pwd;
		this.nick = nick;
		this.name = name;
		this.gender = gender;
		this.phone = phone;
		this.mail = mail;
		this.birth = birth;
		this.address = address;
		this.regdate = regdate;
		this.isExist = isExist;
		
	}
	

	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public boolean isExist() {
		return isExist;
	}
	public void setExist(boolean isExist) {
		this.isExist = isExist;
	}

}
