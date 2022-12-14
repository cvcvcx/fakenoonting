package com.fakenoonting.www.questions.repository;

import com.fakenoonting.www.questions.domain.Question;
import com.fakenoonting.www.util.paging.Pagination;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class QuestionRepositoryImpl implements QuestionRepository {

    private String namespace = "com.fakenoonting.www.question.questionMapper";
    private final SqlSession sqlSession;

    @Autowired
    public QuestionRepositoryImpl(SqlSession sqlSession)  throws Exception {
        this.sqlSession = sqlSession;
    }

    // 문의글 등록하기
    @Override
    public int save(Question question) throws Exception {
        return sqlSession.insert(namespace + ".register", question);
    }

    // 문의글 수정하기
    @Override
    public int update(Question question) throws Exception {
        return sqlSession.update(namespace + ".update");
    }

    // 문의글 삭제하기
    @Override
    public int delete(int questionId) throws Exception {
        return sqlSession.delete(namespace + ".delete");
    }

    // 모든 상품의 모든 문의글 찾기
    @Override
    public List<Question> findAll() throws Exception {
        return sqlSession.selectList(namespace + ".findAll");
    }

    // 모든 상품의 모든 문의글 찾기 + 페이징적용
    @Override
    public List<Question> findAllPaging(Pagination pagination) throws Exception {
        return sqlSession.selectList(namespace + ".findAllPaging", pagination);
    }



    // 특정 유저의 모든 문의글 찾기
    @Override
    public List<Question> findAllByMemberId(int memberId) throws Exception {
        return sqlSession.selectList(namespace + ".findAllByMemberId");
    }

    // 카테고리별 모든 문의글 찾기
    @Override
    public List<Question> findAllByCategory(String questionCategory) throws Exception {
        return sqlSession.selectList(namespace + ".findAllByCategory");
    }

    // 모든 상품의 모든 문의글 개수
    @Override
    public int allQuestionCount() throws Exception {
        return sqlSession.selectOne(namespace + ".allQuestionCount");
    }



    // 특정 상품의 모든 문의글 개수
    @Override
    public int getProdQuesCnt(Map<String, Object> map) throws Exception {
        return sqlSession.selectOne(namespace + ".getProdQuesCnt", map);
    }

    // 특정 상품의 모든 문의글 찾기
    @Override
    public List<Question> findAllProdQuesByProductId(Map<String, Object> map) throws Exception {
        return sqlSession.selectList(namespace + ".findAllProdQuesByProductId", map);
    }
}
