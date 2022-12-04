package com.fakenoonting.www.product.dao;

import com.fakenoonting.www.util.upload.vo.ImgItemVO;
import com.fakenoonting.www.product.vo.ProductVO;

import java.util.List;

public interface ProductDAO {
    public int save(ProductVO productVO);
    public ProductVO findById(ProductVO productId);

    public List<ProductVO> findAll();

    public int deleteProduct(ProductVO productId);
    public int deleteImg(ProductVO productId);
    public int imageEnroll(ImgItemVO img);
    public List<ImgItemVO> findImagesByProductId(ProductVO productVO);
}
