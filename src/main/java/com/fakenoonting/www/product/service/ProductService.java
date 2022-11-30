package com.fakenoonting.www.product.service;


import com.fakenoonting.www.product.dao.ProductRepositoryInterface;
import com.fakenoonting.www.product.vo.ProductVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class ProductService {

    @Autowired
    private ProductRepositoryInterface productRepo;

    public List<ProductVO> productList(){
        log.info("ProductService 상품 리스트 조회...");
        List<ProductVO> products = productRepo.findAll();
        return products;
    }

}
