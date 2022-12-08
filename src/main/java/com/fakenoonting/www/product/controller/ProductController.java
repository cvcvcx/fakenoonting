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

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RequestMapping("product")
@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ReviewService reviewService;

    @GetMapping("/list")
    public ModelAndView productList(Model model){
        ModelAndView mav = new ModelAndView("/product/productList");
        List<ProductVO> list = productService.productList();
        model.addAttribute("list",list);

        return mav;
    }
    @RequestMapping("/adminList")
    public ModelAndView productAdminList(Model model) {
        ModelAndView mav = new ModelAndView();
        // 뷰 네임 설정
        mav.setViewName("/product/productAdminList");
        List<ProductVO> list = productService.productList();
        model.addAttribute("list", list);

        return mav;
    }

    @RequestMapping("/detail")
    public ModelAndView productDetail(long id,Model model
            , @RequestParam(defaultValue = "1") int page
            , @RequestParam(defaultValue = "1") int range
            , @RequestParam(defaultValue = "1") Integer sort) throws Exception {
        ModelAndView mav = new ModelAndView();

        ProductVO productId = new ProductVO();
        productId.setId(id);
        ProductVO product = productService.productDetail(productId);
        log.info("productDetail => "+product.getProductContentImgItems());

        model.addAttribute("productReviewCount", reviewService.productReviewCount(productId.getId().intValue()));
        model.addAttribute("avgGrade", reviewService.getAvgGrade(productId.getId().intValue()));

        Pagination pagination = new Pagination();
        pagination.pageInfo(page, range, reviewService.productReviewCount(productId.getId().intValue()));
        model.addAttribute("pagination", pagination);

        Map<String, Object> result = new HashMap<String, Object>();
        result.put("productId", productId.getId().intValue());
        result.put("startList", pagination.getStartList());
        result.put("listSize", pagination.getListSize());

        log.info("sortNum : " + sort);
        model.addAttribute("sort", sort);
        if (sort == 1) {
            log.info("날짜순정렬1");
            model.addAttribute("boardList", reviewService.findAllByProductId(result));
        } else if (sort == 2) {
            log.info("평점순정렬");
            model.addAttribute("boardList", reviewService.findAllByGrade(result));
        } else {
            log.info("날짜순정렬else");
            model.addAttribute("boardList", reviewService.findAllByProductId(result));
        }


        model.addAttribute("product",product);
        mav.setViewName("/product/productDetails");
        return mav;
    }

    @GetMapping(value = "/upload")
    public ModelAndView productUpload() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/product/productUpload");
        return mav;
    }
    @PostMapping("/upload")
    public ModelAndView uploadProduct(ProductVO productVO){
        log.info("uploadPost요청 진행중 productVO=>" +productVO);
        ModelAndView mav = new ModelAndView();
        productService.productUpload(productVO);
        mav.setViewName("redirect:list");
        return mav;
    }

    @GetMapping("/delete")
    public String deleteProduct(ProductVO productVO){
        log.info("deleteProduct 요청 진행중");
        productService.productDelete(productVO);
        return "redirect:adminList";
    }
}
