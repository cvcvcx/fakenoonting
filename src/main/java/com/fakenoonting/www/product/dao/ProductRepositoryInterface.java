package com.fakenoonting.www.product.dao;

import com.fakenoonting.www.product.vo.ProductImgItemVO;
import com.fakenoonting.www.product.vo.ProductVO;

import java.util.List;

public interface ProductRepositoryInterface {
    public int save(ProductVO productVO);
    public ProductVO findById(ProductVO productId);

    public List<ProductVO> findAll();

    public int imageEnroll(ProductImgItemVO img);
}
