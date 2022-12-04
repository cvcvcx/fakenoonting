package com.fakenoonting.www.product.service;


import com.fakenoonting.www.product.dao.ProductDAO;
import com.fakenoonting.www.util.upload.vo.ImgItemVO;
import com.fakenoonting.www.product.vo.ProductVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class ProductService {

    @Autowired
    private ProductDAO productRepo;

    public List<ProductVO> productList(){
        log.info("ProductService 상품 리스트 조회...");
        List<ProductVO> products = productRepo.findAll();
        products.forEach(productVO -> {
            productVO.setProductImgItems(productRepo.findImagesByProductId(productVO));
        });
        return products;
    }

    public void productUpload(ProductVO productVO){
        int save = productRepo.save(productVO);
        log.info(productVO.getId()+"");
        if(productVO.getProductImgItems()==null||productVO.getProductImgItems().size()<=0){
            return;
        }
        List<ImgItemVO> productImgItems = productVO.getProductImgItems();
        productImgItems.forEach(imgItem->{
            imgItem.setProductId(productVO.getId());
            productRepo.imageEnroll(imgItem);
        });
    }

    public int productDelete(ProductVO productVO){
        log.info("productService delete진행중...");

        productRepo.deleteImg(productVO);


        return productRepo.deleteProduct(productVO);
    }

    public ProductVO productDetail(ProductVO productVO){
        log.info("productDetail 실행...");
        return productRepo.findById(productVO);
    }


}
