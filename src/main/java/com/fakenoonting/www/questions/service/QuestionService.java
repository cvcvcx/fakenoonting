package com.fakenoonting.www.questions.service;

import com.fakenoonting.www.product.vo.ProductVO;
import com.fakenoonting.www.questions.domain.Question;
import com.fakenoonting.www.questions.repository.QuestionRepository;
import com.fakenoonting.www.util.paging.Pagination;
import com.fakenoonting.www.util.upload.vo.ImgItemVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class QuestionService {

    private final QuestionRepository questionRepository;

    @Autowired
    public QuestionService(QuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
    }

    // 문의글 등록하기
    public int register(Question question) throws Exception {
        return questionRepository.save(question);
    }

    // 문의글 수정하기
    public int update(Question question) throws Exception {
        return questionRepository.update(question);
    }

    // 문의글 삭제하기
    public int delete(int questionId) throws Exception {
        return questionRepository.delete(questionId);
    }

    // 모든 상품의 모든 문의글 찾기
    public List<Question> findAll() throws Exception {
        return questionRepository.findAll();
    }

    // 모든 상품의 모든 문의글 찾기 + 페이징적용
    public List<Question> findAllPaging(Pagination pagination) throws Exception {
        return questionRepository.findAllPaging(pagination);
    }

    // 특정 유저의 모든 문의글 찾기
    public List<Question> findAllByMemberId(int memberId) throws Exception {
        return questionRepository.findAllByMemberId(memberId);
    }

    // 카테고리별 모든 문의글 찾기
    public List<Question> findAllByCategory(String inquiryCategory) throws Exception {
        return questionRepository.findAllByCategory(inquiryCategory);
    }

    // 모든 상품의 모든 문의글 개수
    public int allQuestionCount() throws Exception {
        return questionRepository.allQuestionCount();
    }

    // 특정 상품의 모든 문의글 개수
    public int getProdQuesCnt(Map<String, Object> map) throws Exception {
        return questionRepository.getProdQuesCnt(map);
    }

    // 특정 상품의 모든 문의글 찾기
    public List<Question> findAllProdQuesByProductId(Map<String, Object> map) throws Exception {
        return questionRepository.findAllProdQuesByProductId(map);
    }

    public List<ImgItemVO> getProductImg(Long productId) {
        return questionRepository.getProductImg(productId);
    }

    public List<ProductVO> getProductName(Long productId) {
        return questionRepository.getProductName(productId);
    }

}
