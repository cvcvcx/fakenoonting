package com.fakenoonting.www.member.vo;

import java.util.Date;

import lombok.Getter;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.NoArgsConstructor;



@Component("memberVO")
@Data
@NoArgsConstructor
@Getter
public class MemberVO {
	
	private long id;			// 개발자 쪽 구분 ID
	private String email;		// 사용자 ID
	private String pwd;
	private String nick;		// 사용자 닉네임
	private String name;		// 사용자 이름
	private char gender;
	private int phone;
	private Date birth;
	private String address1;	// 상위 주소
	private String address2;	// 상세 주소
	private int zipcode;		// 우편 번호
	private Date create_date;	// ID 생성 날짜
	private Date delete_date;	// ID 삭제 날짜	

}
