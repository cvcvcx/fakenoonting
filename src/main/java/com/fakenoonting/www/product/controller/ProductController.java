package com.fakenoonting.www.product.controller;

import com.fakenoonting.www.product.service.ProductService;
import com.fakenoonting.www.product.vo.ProductVO;
import com.fakenoonting.www.reviews.service.ReviewService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ReviewService reviewService;

    // =============================================================================//
    // 페이지 이동 //
    // =============================================================================//

    // 물품 등록 페이지로 이동
    @GetMapping(value = "/upload")
    public ModelAndView productUpload() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/product/productUpload");
        return mav;
    }

    // 물품 상세 페이지 이동
    @GetMapping("/detail")
    public ModelAndView productDetail(long id, Model model) {
        ModelAndView mav = new ModelAndView();
        ProductVO productId = new ProductVO();
        productId.setId(id);
        ProductVO product = productService.productDetail(productId);

        model.addAttribute("product", product);
        mav.setViewName("/product/productDetails");

        return mav;
    }

    // 물품 수정 페이지로 이동
    @GetMapping(value = "/update")
    public ModelAndView productUpdate(long id, Model model) {

        ProductVO productId = new ProductVO();
        productId.setId(id);
        ProductVO productVO = productService.productDetail(productId);

        log.info("ProductController 물품 정보 추출 productVO ==> " + productVO);

        // 찾아온 데이터를 가지고 물품 수정화면으로 넘어간다.
        ModelAndView mav = new ModelAndView("/product/productUpdate");
        mav.addObject("product", productVO);

        return mav;
    }

    // =============================================================================//
    // 물품 등록 //
    // =============================================================================//

    // 물품 등록 처리
    @PostMapping("/upload")
    public ModelAndView uploadProduct(ProductVO productVO) {
        log.info("uploadPost요청 진행중 productVO=>" + productVO);
        ModelAndView mav = new ModelAndView();
        productService.productUpload(productVO);
        mav.setViewName("redirect:list");
        return mav;
    }

    // =============================================================================//
    // 물품 추출 //
    // =============================================================================//

    // 특정 카테고리(TOP) 물품 전체 리스트 추출
    @GetMapping("/list")
    public ModelAndView productList(Model model) {
        List<ProductVO> list = productService.productList();

        ModelAndView mav = new ModelAndView("/product/productList");
        model.addAttribute("list", list);

        return mav;
    }

    // 관리자(admin) 물품 전체 리스트 추출
    @GetMapping("/adminList")
    public ModelAndView productAdminList(Model model) {
        List<ProductVO> list = productService.productList();

        ModelAndView mav = new ModelAndView();
        // 뷰 경로 설정
        mav.setViewName("/product/productAdminList");
        model.addAttribute("list", list);

        return mav;
    }

    // =============================================================================//
    // 물품 수정 //
    // =============================================================================//

    // =============================================================================//
    // 물품 삭제 //
    // =============================================================================//

    // 등록된 물품 삭제
    @GetMapping("/delete")
    public String deleteProduct(ProductVO productVO) {
        log.info("deleteProduct 요청 진행중");
        productService.productDelete(productVO);
        return "redirect:adminList";
    }
}
