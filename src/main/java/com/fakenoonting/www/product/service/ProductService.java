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

    
    
    // 물품의 모든 데이터 등록
    public void productUpload(ProductVO productVO) {
        log.info("productService productUpload 실행 중... productId : " + productVO.getId() + "");
        
        if (productVO.getProductImgItems() == null || productVO.getProductImgItems().size() <= 0) {
            return;
        }

        // 물품 등록
        int save = productDAO.save(productVO);
        
        // 썸네일 사진 등록(디테일 왼쪽 위 사진) + 썸네일 별로 id 등록
        List<ImgItemVO> productImgItems = productVO.getProductImgItems();
        productImgItems.forEach(imgItem -> {
            imgItem.setForeignId(productVO.getId());
            productDAO.imageEnroll(imgItem);
        });
     
        // 상세 본문 사진 등록
        List<ImgItemVO> productContentItems = productVO.getProductContentImgItems();
        productContentItems.forEach(imgItem -> {
            imgItem.setForeignId(productVO.getId());
            productDAO.contentImageEnroll(imgItem);
        });

        // 제품 사이즈 등록
        List<ProductSizeVO> productSizeList = productVO.getProductSizeList();
        productSizeList.forEach(sizeItem -> {
            sizeItem.setProductId(productVO.getId());
            productDAO.sizeEnroll(sizeItem);
        });
    }

    
    
    // DB에 등록되어 있는 물품의 정보 추출
    public ProductVO productDetail(ProductVO productVO) {
        log.info("productService productDetail 실행 중...");
        
        ProductVO result = productDAO.findById(productVO);
        result.setProductImgItems(productDAO.findImagesByProductId(productVO));
        result.setProductContentImgItems(productDAO.findContentImgByProductId(productVO));
        result.setProductSizeList(productDAO.findSizeByProductId(productVO));
        return result;
    }
    
    
    
    // 물품 전체 리스트 추출
    public List<ProductVO> productList() {
        log.info("ProductService 상품 리스트 조회 중...");
        
        List<ProductVO> products = productDAO.findAll();
        
        // Product의 썸네일 이미지를 전부 추출
        products.forEach(productVO -> {
            productVO.setProductImgItems(productDAO.findImagesByProductId(productVO));
        });
        
        return products;
    }

    
    
    // 물품 모든 데이터 삭제 - 물품 삭제 갯수를 반환
    public int productDelete(ProductVO productVO) {
        log.info("productService delete 실행 중...");

        productDAO.deleteImg(productVO);
        productDAO.deleteContentImg(productVO);
        productDAO.deleteSize(productVO);
        
        return productDAO.deleteProduct(productVO);
    }

}
