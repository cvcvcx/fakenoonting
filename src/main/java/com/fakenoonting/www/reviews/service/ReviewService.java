package com.fakenoonting.www.reviews.service;

import com.fakenoonting.www.reviews.domain.Review;
import com.fakenoonting.www.reviews.repository.ReviewRepository;
import com.fakenoonting.www.util.paging.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewService {

    private final ReviewRepository reviewRepository;

    @Autowired
    public ReviewService(ReviewRepository reviewRepository) throws Exception {
        this.reviewRepository = reviewRepository;
    }

    // 리뷰 등록하기
    public int register(Review review) throws Exception {
        return reviewRepository.register(review);
    }

    // 리뷰 존재 여부 확인
    public String isExist(Review review) throws Exception {
        Integer result = reviewRepository.isExist(review);

        if (result == null) {
            return "0";
        } else {
            return "1";
        }
    }

    // 리뷰 수정하기
    public int update(Review review) throws Exception {
        return reviewRepository.update(review);
    }

    // 리뷰 삭제하기
    public int delete(int reviewId) throws Exception {
        return reviewRepository.delete(reviewId);
    }

    // 리뷰 1개 찾기(고유번호 사용)
    public Review findById(int reviewId) throws Exception {
        return reviewRepository.findById(reviewId);
    }

    // 모든 상품의 모든 리뷰 가져오기
    public List<Review> findAll() throws Exception {
        return reviewRepository.findAll();
    }

    // 모든 상품의 모든 리뷰 찾기 + 페이징적용
    public List<Review> findAllPaging(Pagination pagination) throws Exception {
        return reviewRepository.findAllPaging(pagination);
    }

    // 특정 상품의 모든 리뷰 찾기
    public List<Review> findAllByProductId(int productId) throws Exception {
        return reviewRepository.findAllByProductId(productId);
    }

    // 특정 유저의 모든 리뷰 찾기
    public List<Review> findAllByMemberId(int memberId) throws Exception {
        return reviewRepository.findAllByMemberId(memberId);
    }

    // 특정 상품의 모든 리뷰 평점순으로 찾기
    public List<Review> findAllByGrade(int productId) throws Exception {
        return reviewRepository.findAllByGrade(productId);
    }

    // 특정 상품의 리뷰 평균 평점 구하기
    public double getAvgGrade(int productId) throws Exception {
        return reviewRepository.getAvgGrade(productId);
    }

    // 모든 상품의 모든 리뷰 개수
    public int productReviewCount(int productId) throws Exception {
        return reviewRepository.productReviewCount(productId);
    }

}
