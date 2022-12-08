package com.fakenoonting.www.product.dao;

import com.fakenoonting.www.product.vo.ProductSizeVO;
import com.fakenoonting.www.util.upload.vo.ImgItemVO;
import com.fakenoonting.www.product.vo.ProductVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String nameSpace = "com.fakenoonting.product";

	// =============================================================================//
	// 등록 																			//
	// =============================================================================//
	
	// 물품 등록
	@Override
	public int save(ProductVO productVO) {

		return sqlSession.insert(nameSpace + ".saveProduct", productVO);
	}
	
	// 썸네일 이미지 등록
	@Override
	public int imageEnroll(ImgItemVO img) {
		return sqlSession.insert(nameSpace + ".uploadImg", img);
	}

	// 상세 본문 이미지 등록
	@Override
	public int contentImageEnroll(ImgItemVO img) {
		return sqlSession.insert(nameSpace + ".uploadContentImg", img);
	}
	
	// 제품 사이즈 등록
	@Override
	public int sizeEnroll(ProductSizeVO size) {
		return sqlSession.insert(nameSpace + ".sizeEnroll", size);
	}
	
	// =============================================================================//
	// 추출 																			//
	// =============================================================================//
	
	// productId 기준으로 해당 productVO를 추출
	@Override
	public ProductVO findById(ProductVO productId) {
		return sqlSession.selectOne(nameSpace + ".findById", productId);
	}
	
	// 모든 productVO를 추출
	@Override
	public List<ProductVO> findAll() {
		log.info("ProductRepo findAll 실행...");
		return sqlSession.selectList(nameSpace + ".findAll");
	}

	// productId 기준으로 해당 productImgItem 값들 추출
	@Override
	public List<ImgItemVO> findImagesByProductId(ProductVO productVO) {
		return sqlSession.selectList(nameSpace + ".findImagesByProductId", productVO);
	}

	// productId 기준으로 해당 productContentImgItem 값들 추출
	@Override
	public List<ImgItemVO> findContentImgByProductId(ProductVO productVO) {
		return sqlSession.selectList(nameSpace + ".findContentImagesByProductId", productVO);
	}
	
	// productId 기준으로 해당 productSize 값들 추출
	@Override
	public List<ProductSizeVO> findSizeByProductId(ProductVO productVO) {
		return sqlSession.selectList(nameSpace + ".findSizeByProductId", productVO);
	}
	
	// =============================================================================//
	// 삭제 																			//
	// =============================================================================//
	
	// productId 기준으로 해당 productVO를 삭제
	@Override
	public int deleteProduct(ProductVO productId) {
		log.info("deleteProduct 실행중..");
		return sqlSession.delete(nameSpace + ".deleteProduct", productId);
	}

	// productId 기준으로 해당 product 썸네일 이미지를 삭제
	@Override
	public int deleteImg(ProductVO productId) {
		log.info("deleteImg 실행중...");
		return sqlSession.delete(nameSpace + ".deleteProductImg", productId);
	}

	// productId 기준으로 해당 product 상세 본문 이미지를 삭제
	@Override
	public int deleteContentImg(ProductVO productId) {
		log.info("deleteImg 실행중...");
		return sqlSession.delete(nameSpace + ".deleteContentImg", productId);
	}

	// productId 기준으로 해당 product 사이즈 삭제
	@Override
	public int deleteSize(ProductVO productId) {

		return sqlSession.delete(nameSpace + ".deleteProductSize", productId);
	}

}
