package com.fakenoonting.www.product.controller;

import com.fakenoonting.www.product.service.ProductService;
import com.fakenoonting.www.product.vo.ProductVO;
import com.fakenoonting.www.reviews.service.ReviewService;
import com.fakenoonting.www.util.paging.Pagination;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    
    
    // 물품 등록 페이지로 이동
    @GetMapping(value = "/upload")
    public ModelAndView productUpload() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/product/productUpload");
        return mav;
    }
    
    
    
    // 물품 등록 처리
    @PostMapping("/upload")
    public ModelAndView uploadProduct(ProductVO productVO){
        log.info("uploadPost요청 진행중 productVO=>" +productVO);
        ModelAndView mav = new ModelAndView();
        productService.productUpload(productVO);
        mav.setViewName("redirect:list");
        return mav;
    }
    
    
    
    // 특정 카테고리(TOP) 물품 전체 리스트 추출
    @GetMapping("/list")
    public ModelAndView productList(Model model){
        List<ProductVO> list = productService.productList();

        ModelAndView mav = new ModelAndView("/product/productList");
        model.addAttribute("list",list);

        return mav;
    }
    
    
    
    // 관리자 물품 전체 리스트 추출
    @GetMapping("/adminList")
    public ModelAndView productAdminList(Model model) {
        List<ProductVO> list = productService.productList();

        ModelAndView mav = new ModelAndView();
        // 뷰 경로 설정
        mav.setViewName("/product/productAdminList");
        model.addAttribute("list", list);

        return mav;
    }

    
    
    // 추가 주석 달아야 함.
    // 상세 페이지 
    @GetMapping("/detail")
    public ModelAndView productDetail(long id, Model model
            , @RequestParam(defaultValue = "1") int page
            , @RequestParam(defaultValue = "1") int range) throws Exception {

        ProductVO productId = new ProductVO();
        productId.setId(id);
    	ProductVO product = productService.productDetail(productId);

        ModelAndView mav = new ModelAndView();

        model.addAttribute("allReviewCount", reviewService.allReviewCount());
        model.addAttribute("avgGrade", reviewService.getAvgGrade(46)); // product_id랑 연동될때까지 10 넣어둠 , 영진은 46

        Pagination pagination = new Pagination();
        pagination.pageInfo(page, range, reviewService.allReviewCount());
        model.addAttribute("pagination", pagination);
        model.addAttribute("boardList", reviewService.findAllPaging(pagination));
        model.addAttribute("product",product);
        
        mav.setViewName("/product/productDetails");
        return mav;
    }

    
    
    // 등록된 물품 삭제
    @GetMapping("/delete")
    public String deleteProduct(ProductVO productVO){
        log.info("deleteProduct 요청 진행중");
        productService.productDelete(productVO);
        return "redirect:adminList";
    }
}
