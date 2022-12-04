package com.fakenoonting.www.product.controller;

import com.fakenoonting.www.product.service.ProductService;
import com.fakenoonting.www.product.vo.ProductVO;
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
@RequestMapping("product")
@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

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
    public ModelAndView productDetail(long id,Model model) {
        ModelAndView mav = new ModelAndView();
        ProductVO productVO = new ProductVO();
        productVO.setId(id);
        ProductVO modelProductVO = productService.productDetail(productVO);
        model.addAttribute("product",modelProductVO);
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
        log.info("uploadPost요청 진행중");
        ModelAndView mav = new ModelAndView();
        productService.productUpload(productVO);
        mav.setViewName("redirect:list");
        return mav;
    }

    @GetMapping("/delete")
    public String deleteProduct(ProductVO productVO){
        log.info("deleteProduct 요청 진행중");
        productService.productDelete(productVO);
        return "redirect:list";
    }
}
