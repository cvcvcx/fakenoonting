package com.fakenoonting.www.questions.repository;

import com.fakenoonting.www.product.vo.ProductVO;
import com.fakenoonting.www.questions.domain.Question;
import com.fakenoonting.www.util.paging.Pagination;
import com.fakenoonting.www.util.upload.vo.ImgItemVO;

import java.util.List;
import java.util.Map;

public interface QuestionRepository {

    // 문의글 등록하기
    public int save(Question question) throws Exception;

    // 문의글 수정하기
    public int update(Question question) throws Exception;

    // 문의글 삭제하기
    public int delete(int questionId) throws Exception;

    // 모든 상품의 모든 문의글 찾기
    public List<Question> findAll() throws Exception;

    // 모든 상품의 모든 문의글 찾기 + 페이징적용
    public List<Question> findAllPaging(Pagination pagination) throws Exception;

    // 특정 유저의 모든 문의글 찾기
    public List<Question> findAllByMemberId(int memberId) throws Exception;

    // 카테고리별 모든 문의글 찾기
    public List<Question> findAllByCategory(String questionCategory) throws Exception;

    // 모든 상품의 모든 문의글 개수
    public int allQuestionCount() throws Exception;

    // 특정 상품의 모든 문의글 개수
    public int getProdQuesCnt(Map<String, Object> map) throws Exception;

    // 특정 상품의 모든 문의글 찾기
    public List<Question> findAllProdQuesByProductId(Map<String, Object> map) throws Exception;

    public List<ImgItemVO> getProductImg(Long productId);

    public List<ProductVO> getProductName(Long productId);
}
