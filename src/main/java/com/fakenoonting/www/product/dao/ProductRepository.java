package com.fakenoonting.www.product.dao;

import com.fakenoonting.www.product.vo.ProductVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class ProductRepository implements ProductRepositoryInterface{

    @Autowired
    SqlSession sqlSession;

    String nameSpace = "com.fakenoonting.product";

    @Override
    public int save(ProductVO productVO) {
        sqlSession.insert(nameSpace+".saveProduct",productVO);
        return 0;
    }

    @Override
    public ProductVO findById(ProductVO productId) {
        return null;
    }
}
