package com.fakenoonting.www.product.dao;

import com.fakenoonting.www.product.vo.ProductVO;

public interface ProductRepositoryInterface {
    public int save(ProductVO productVO);
    public ProductVO findById(ProductVO productId);
}
