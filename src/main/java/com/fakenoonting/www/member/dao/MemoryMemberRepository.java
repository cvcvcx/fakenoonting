package com.fakenoonting.www.member.dao;

import com.fakenoonting.www.member.vo.MemberVO;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.ArrayList;


public class MemoryMemberRepository implements MemberRepositoryInterface{

	private static Map<Long, MemberVO> store = new HashMap<>();
	
	// ���߿� try ~ catch ��� ��
	// ���� ������ �������丮�� ����
	@Override
	public int save(MemberVO user) {
		
		store.put(user.getId(),user);		
		return 0;
		
	}

	
	
	// ���� ���̵�� �˻�
	@Override
	public MemberVO getById(Long userId) {		
		
		return store.get(userId);
		
	}

	
	
	// ���� �̸����� �˻�
	@Override
	public Optional<MemberVO> getByName(String userName) {

		return store.values().stream().filter(member -> member.getName().equals(userName)).findAny();
		
	}

	
	
	// ���� �̸��Ϸ� �˻�
	@Override
	public Optional<MemberVO> getByMail(String userMail){

		return store.values().stream().filter(member -> member.getMail().equals(userMail)).findAny();
		
	}

	
	
	// ��� ������ ������
	@Override
	public	List<MemberVO> getAllUser() {

		return new ArrayList<>(store.values());
		
	}

	
	
	// �������� ����
	@Override
	public int changeUser(MemberVO user) {
		
		return 0;
		
	}
	
	

}
