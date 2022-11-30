package com.fakenoonting.www.product.controller;

import com.fakenoonting.www.product.service.ProductService;
import com.fakenoonting.www.product.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RequestMapping("product")
@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping("/list")
    public ModelAndView productList(Model model) {
        ModelAndView mav = new ModelAndView();
        // 뷰 네임 설정
        mav.setViewName("/product/productList");
        List<ProductVO> list = productService.productList();
        model.addAttribute("list", list);

        return mav;
    }

    @RequestMapping("/detail")
    public ModelAndView productDetail() {
        ModelAndView mav = new ModelAndView();

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
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/product/productList");
        return mav;
    }
}
