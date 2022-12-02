package com.fakenoonting.www.product.dao;

import com.fakenoonting.www.product.vo.ProductImgItemVO;
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
    SqlSession sqlSession;

    String nameSpace = "com.fakenoonting.product";

    @Override
    public int save(ProductVO productVO) {

        return sqlSession.insert(nameSpace+".saveProduct",productVO);
    }

    @Override
    public ProductVO findById(ProductVO productId) {
        return sqlSession.selectOne(nameSpace+".findById",productId);
    }

    @Override
    public List<ProductVO> findAll(){
        log.info("ProductRepo findAll 실행...");
        return sqlSession.selectList(nameSpace+".findAll");
    }

    @Override
    public int deleteProduct(ProductVO productId){
        log.info("deleteProduct 실행중..");
        return sqlSession.delete(nameSpace+".deleteProduct",productId);
    }

    @Override
    public int deleteImg(ProductVO productId){
        log.info("deleteImg 실행중...");
        return sqlSession.delete(nameSpace+".deleteImg",productId);
    }


    @Override
    public int imageEnroll(ProductImgItemVO img) {
        return sqlSession.insert(nameSpace+".uploadImg",img);
    }
    public List<ProductImgItemVO> findImagesByProductId(ProductVO productVO){
        return sqlSession.selectList(nameSpace+".findImagesByProductId",productVO);
    }

}
