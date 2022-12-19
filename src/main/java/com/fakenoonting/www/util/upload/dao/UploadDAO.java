package com.fakenoonting.www.util.upload.dao;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fakenoonting.www.member.vo.MemberVO;
import com.fakenoonting.www.util.upload.service.UploadService;
import com.fakenoonting.www.util.upload.vo.ImgItemVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository("UploadDAO")
public class UploadDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String Namespace = "com.fakenoonting.www.util.upload";

	
	// 이미지 등록 처리
	public int registerImg(MultipartFile[] uploadFile, ImgItemVO imgItemVO) throws DataAccessException {
		
		log.info("이미지 등록 처리 시작..." + imgItemVO);		

		// sqlSession.insert(사용할 mapper의 id, 저장할 값)
		// insert 한 행의 결과 갯수를 반환
		int result = sqlSession.insert(Namespace + ".registerImg", imgItemVO);
		
		return result;
	}
	
	

}
