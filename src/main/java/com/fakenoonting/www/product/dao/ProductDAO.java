package com.fakenoonting.www.product.dao;

import com.fakenoonting.www.product.vo.ProductImgItemVO;
import com.fakenoonting.www.product.vo.ProductVO;

import java.util.List;

public interface ProductDAO {
    public int save(ProductVO productVO);
    public ProductVO findById(ProductVO productId);

    public List<ProductVO> findAll();

    public int deleteProduct(ProductVO productId);
    public int deleteImg(ProductVO productId);
    public int imageEnroll(ProductImgItemVO img);
    public List<ProductImgItemVO> findImagesByProductId(ProductVO productVO);
}
