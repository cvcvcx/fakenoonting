package com.fakenoonting.www.member.dao;

import java.util.List;
import java.util.Optional;
import com.fakenoonting.www.member.vo.MemberVO;


public interface MemberRepositoryInterface {
	
	// ���� ������ �������丮�� ����
	int save(MemberVO user) ;
	
	// ���� ���̵�� �˻�
	MemberVO getById(Long userId) ;
	
	// ���� �̸����� �˻�
	Optional<MemberVO> getByName(String userName);
	
	// ���� �̸��Ϸ� �˻�
	Optional<MemberVO> getByMail(String userMail);
	
	// ��� ������ ������
	List<MemberVO> getAllUser();
	
	// �������� ����
	int changeUser(MemberVO user);
	
}
