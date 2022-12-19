package com.fakenoonting.www.reviews.repository;

import com.fakenoonting.www.product.vo.ProductVO;
import com.fakenoonting.www.reviews.domain.Review;
import com.fakenoonting.www.util.paging.Pagination;
import com.fakenoonting.www.util.upload.vo.ImgItemVO;
import com.fakenoonting.www.util.upload.vo.ImgReviewItemVo;

import java.util.List;
import java.util.Map;

public interface ReviewRepository {

    // 리뷰 등록하기
    public int register(Review review) throws Exception;

    // 리뷰 존재 여부 확인
    public Integer isExist(Review review) throws Exception;

    // 리뷰 수정하기
    public int update(Review review) throws Exception;

    // 리뷰 삭제하기
    public int delete(int reviewId) throws Exception;

    // 리뷰 1개 찾기
    public Review findById(Long reviewId) throws Exception;

    // 모든 상품의 모든 리뷰 찾기
    public List<Review> findAll() throws Exception;

    // 특정 상품의 리뷰 평균 평점 구하기
    public double getProdRvAvgGrade(Long productId) throws Exception;

    // 특정 상품의 모든 리뷰 개수
    public int getProdRvCnt(Map<String, Object> map) throws Exception;

    // 특정 상품의 모든 리뷰 찾기
    public List<Review> findAllProdRvByProductId(Map<String, Object> map) throws Exception;

    // 특정 상품의 평점별 리뷰 개수
    public int getProdRvCntByGrade(Map<String, Object> map) throws Exception;

    // 특정 상품의 모든 리뷰 평점순으로 찾기
    public List<Review> findAllProdRvByGrade(Map<String, Object> map) throws Exception;

    // 리뷰 상품 사진 업로드
    public int uploadRvImg(ImgReviewItemVo img);

    public List<ImgReviewItemVo> getAllReviewImg(Long productId);

    public List<ImgReviewItemVo> getReviewImg(Long productId) throws Exception;

    public int getRvImgCnt(Long productId);

    public List<ImgItemVO> getProductImg(Long productId);

    public List<ProductVO> getProductName(Long productId);

}
