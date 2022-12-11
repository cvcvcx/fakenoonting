package com.fakenoonting.www.reviews.repository;

import com.fakenoonting.www.reviews.domain.Review;
import com.fakenoonting.www.util.paging.Pagination;

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

    // 리뷰 1개 찾기(고유번호 사용)
    public Review findById(int reviewId) throws Exception;

    // 모든 상품의 모든 리뷰 찾기
    public List<Review> findAll() throws Exception;

    // 모든 상품의 모든 리뷰 찾기 + 페이징적용
    public List<Review> findAllPaging(Pagination pagination) throws Exception;

    // 특정 상품의 모든 리뷰 찾기
    public List<Review> findAllByProductId(Map<String, Object> map) throws Exception;

    // 특정 상품의 모든 리뷰 평점순으로 찾기
    public List<Review> findAllByGrade(Map<String, Object> map) throws Exception;

    // 특정 상품의 리뷰 평균 평점 구하기
    public double getAvgGrade(Long productId) throws Exception;

    // 특정 상품의 평점별 리뷰 개수트 리스트
    public int getReviewCountListByGrade(Map<String, Object> map) throws Exception;

    // 모든 상품의 모든 리뷰 개수
    public int productReviewCount(Long productId) throws Exception;

    // 특정 유저의 모든 리뷰 찾기
    public List<Review> findAllByMemberId(int memberId) throws Exception;
}
