package com.fakenoonting.www.member.dao;

import com.fakenoonting.www.member.vo.MemberVO;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.ArrayList;


public class MemoryMemberRepository implements MemberRepositoryInterface{

	private static Map<String, MemberVO> store = new HashMap<>();
	
	// 나중에 try ~ catch 써야 함
	// 유저 정보를 리포지토리에 저장
	@Override
	public int save(MemberVO user) {
		
		store.put(user.getId(),user);		
		return 0;
		
	}

	
	
	// 유저 아이디로 검색
	@Override
	public MemberVO getById(String userId) {		
		
		return store.get(userId);
		
	}

	
	
	// 유저 이름으로 검색
	@Override
	public Optional<MemberVO> getByName(String userName) {

		return store.values().stream().filter(member -> member.getName().equals(userName)).findAny();
		
	}

	
	
	// 유저 이메일로 검색
	@Override
	public Optional<MemberVO> getByMail(String userMail){

		return store.values().stream().filter(member -> member.getMail().equals(userMail)).findAny();
		
	}

	
	
	// 모든 유저를 가져옴
	@Override
	public	List<MemberVO> getAllUser() {

		return new ArrayList<>(store.values());
		
	}

	
	
	// 유저정보 변경
	@Override
	public int changeUser(MemberVO user) {
		
		return 0;
		
	}
	
	

}
