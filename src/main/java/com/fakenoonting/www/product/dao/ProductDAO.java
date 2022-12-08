package com.fakenoonting.www.product.dao;

import com.fakenoonting.www.product.vo.ProductSizeVO;
import com.fakenoonting.www.util.upload.vo.ImgItemVO;
import com.fakenoonting.www.product.vo.ProductVO;

import java.util.List;

public interface ProductDAO {
	// 물품 등록
    public int save(ProductVO productVO);
    // 썸네일 이미지 등록
    public int imageEnroll(ImgItemVO img);
    // 상세 본문 이미지 등록
    int contentImageEnroll(ImgItemVO img);
    // 제품 사이즈 등록
    public int sizeEnroll(ProductSizeVO size);

    // productId 기준으로 해당 productVO를 추출
    public ProductVO findById(ProductVO productId);
    // 모든 productVO를 추출
    public List<ProductVO> findAll();
    // productId 기준으로 해당 productImgItem 값들 추출
    public List<ImgItemVO> findImagesByProductId(ProductVO productVO);
    // productId 기준으로 해당 productContentImgItem 값들 추출
    List<ImgItemVO> findContentImgByProductId(ProductVO productVO);
    // productId 기준으로 해당 productSize 값들 추출
    List<ProductSizeVO> findSizeByProductId(ProductVO productVO);
    
    // productId 기준으로 해당 productVO를 삭제
    public int deleteProduct(ProductVO productId);
    // productId 기준으로 해당 product 썸네일 이미지를 삭제
    public int deleteImg(ProductVO productId);
    // productId 기준으로 해당 product 상세 본문 이미지를 삭제
    int deleteContentImg(ProductVO productId);
    // productId 기준으로 해당 product 사이즈 삭제
    public int deleteSize(ProductVO productId);

}
