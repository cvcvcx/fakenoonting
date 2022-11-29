package com.fakenoonting.www.product.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("product")
@Controller
public class ProductController {

    @RequestMapping("/list")
    public ModelAndView productList(){



    }
    @RequestMapping("/detail")
    public ModelAndView productDetail(){
        ModelAndView mav = new ModelAndView();

        mav.setViewName("/product/productDetails");
        return mav;
    }
    @RequestMapping("/upload")
    public ModelAndView productUpload(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/util/upload/uploadAjax");
        return mav;
    }
}
