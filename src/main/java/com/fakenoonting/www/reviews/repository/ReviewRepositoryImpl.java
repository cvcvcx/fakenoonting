package com.fakenoonting.www.reviews.repository;

import com.fakenoonting.www.reviews.domain.Review;
import com.fakenoonting.www.util.paging.Pagination;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ReviewRepositoryImpl implements ReviewRepository {

    private	static String namespace = "com.fakenoonting.www.review.reviewMapper";

    private final SqlSession sqlSession;

    @Autowired
    public ReviewRepositoryImpl(SqlSession sqlSession) throws Exception {
        this.sqlSession = sqlSession;
    }

    // 리뷰 등록하기
    @Override
    public int register(Review review) throws Exception {
        return sqlSession.insert(namespace + ".register", review);
    }

    // 리뷰 존재 여부 확인
    @Override
    public Integer isExist(Review review) throws Exception {
        return sqlSession.selectOne(namespace + ".isExist", review);
    }

    // 리뷰 수정하기
    @Override
    public int update(Review review) throws Exception {
        return sqlSession.update(namespace + ".update", review);
    }

    // 리뷰 삭제하기
    @Override
    public int delete(int reviewId) throws Exception {
        return sqlSession.delete(namespace + ".delete", reviewId);
    }

    // 리뷰 1개 찾기(고유번호 사용)
    @Override
    public Review findById(int reviewId) throws Exception {
        return sqlSession.selectOne(namespace + ".findById", reviewId);
    }

    // 모든 상품의 모든 리뷰 찾기
    @Override
    public List<Review> findAll() throws Exception {
        return sqlSession.selectList(namespace + ".findAll");
    }

    // 모든 상품의 모든 리뷰 찾기 + 페이징적용
    @Override
    public List<Review> findAllPaging(Pagination pagination) throws Exception {
        return sqlSession.selectList(namespace + ".findAllPaging", pagination);
    }

    // 특정 상품의 모든 리뷰 찾기
    @Override
    public List<Review> findAllByProductId(Map<String, Object> map) throws Exception {
        return sqlSession.selectList(namespace + ".findAllByProductId", map);
    }

    // 특정 상품의 모든 리뷰 평점순으로 찾기
    @Override
    public List<Review> findAllByGrade(Map<String, Object> map) throws Exception {
        return sqlSession.selectList(namespace + ".findAllByGrade", map);
    }

    // 특정 상품의 리뷰 평균 평점 구하기
    @Override
    public double getAvgGrade(int productId) throws Exception {
        return sqlSession.selectOne(namespace + ".getAvgGrade", productId);
    }

    // 특정 상품의 모든 리뷰 개수
    @Override
    public int productReviewCount(int productId) throws Exception {
        return sqlSession.selectOne(namespace + ".productReviewCount", productId);
    }

    // 특정 유저의 모든 리뷰 찾기
    @Override
    public List<Review> findAllByMemberId(int memberId) throws Exception {
        return sqlSession.selectList(namespace + ".findAllReviewsByMemberId");
    }
}
