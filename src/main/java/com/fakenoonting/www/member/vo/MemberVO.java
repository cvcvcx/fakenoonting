package com.fakenoonting.www.member.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.NoArgsConstructor;

@Component("memberVO")
@Data
@NoArgsConstructor
public class MemberVO {

	private Long id; // Member부분 개발자 쪽 구분 ID
	private String email; // 사용자 ID
	private String pwd;
	private String nick; // 사용자 닉네임
	private String name; // 사용자 이름
	private Character gender;
	private String phone;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	private String address1; // 상위 주소
	private String address2; // 상세 주소
	private Integer zipcode; // 우편 번호
	private Date create_date; // ID 생성 날짜
	private Date delete_date; // ID 삭제 날짜
	private int money_point; // 포인트


	//database에 존재하지 않는 변수들
	//010
	private String phoneNum1;
	//0000
	private String phoneNum2;
	//0000
	private String phoneNum3;

	public void changePhoneNumberForm(){


		String[] splitPhoneNumber = phone.split("-");
		setPhoneNum1(splitPhoneNumber[0]);
		setPhoneNum2(splitPhoneNumber[1]);
		setPhoneNum3(splitPhoneNumber[2]);
	}

}
