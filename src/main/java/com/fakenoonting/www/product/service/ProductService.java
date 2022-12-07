package com.fakenoonting.www.product.service;

import com.fakenoonting.www.product.dao.ProductDAO;
import com.fakenoonting.www.product.vo.ProductSizeVO;
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
    private ProductDAO productDAO;

    public List<ProductVO> productList() {
        log.info("ProductService 상품 리스트 조회...");
        List<ProductVO> products = productDAO.findAll();
        products.forEach(productVO -> {
            productVO.setProductImgItems(productDAO.findImagesByProductId(productVO));
        });
        return products;
    }

    public void productUpload(ProductVO productVO) {
        int save = productDAO.save(productVO);
        log.info(productVO.getId() + "");
        if (productVO.getProductImgItems() == null || productVO.getProductImgItems().size() <= 0) {
            return;
        }
        // 썸네일 사진(디테일 왼쪽 위 사진)
        List<ImgItemVO> productImgItems = productVO.getProductImgItems();
        productImgItems.forEach(imgItem -> {
            imgItem.setForeignId(productVO.getId());
            productDAO.imageEnroll(imgItem);
        });
        // 본문 사진 DB에 저장
        List<ImgItemVO> productContentItems = productVO.getProductContentImgItems();
        productContentItems.forEach(imgItem -> {
            imgItem.setForeignId(productVO.getId());
            productDAO.contentImageEnroll(imgItem);
        });

        List<ProductSizeVO> productSizeList = productVO.getProductSizeList();
        productSizeList.forEach(sizeItem -> {
            sizeItem.setProductId(productVO.getId());
            productDAO.sizeEnroll(sizeItem);
        });
    }

    public int productDelete(ProductVO productVO) {
        log.info("productService delete진행중...");

        productDAO.deleteImg(productVO);
        productDAO.deleteSize(productVO);

        return productDAO.deleteProduct(productVO);
    }

    public ProductVO productDetail(ProductVO productVO) {
        log.info("productDetail 실행...");
        ProductVO result = productDAO.findById(productVO);
        result.setProductSizeList(productDAO.findSizeByProductId(productVO));
        result.setProductImgItems(productDAO.findImagesByProductId(productVO));
        result.setProductContentImgItems(productDAO.findContentImgByProductId(productVO));
        return result;
    }

}
