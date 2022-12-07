package com.fakenoonting.www.reviews.controller;

import com.fakenoonting.www.product.vo.ProductVO;
import com.fakenoonting.www.reviews.domain.Review;
import com.fakenoonting.www.reviews.service.ReviewService;
import com.fakenoonting.www.util.paging.Pagination;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.Map;


@Controller
public class ReviewController {

    private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
    private final ReviewService reviewService;

    @Autowired
    public ReviewController(ReviewService reviewService) {
        this.reviewService = reviewService;
    }

    // 리뷰 리스트
    @RequestMapping(value = "/reviewList", method = RequestMethod.GET)
    public String reviewList(Model model
            , @RequestParam(required = false, defaultValue = "1") int page
            , @RequestParam(required = false, defaultValue = "1") int range) throws Exception {

        ProductVO productId = new ProductVO();
        model.addAttribute("productReviewCount", reviewService.productReviewCount(productId.getId().intValue()));
        model.addAttribute("avgGrade", reviewService.getAvgGrade(productId.getId().intValue()));

        Pagination pagination = new Pagination();
        pagination.pageInfo(page, range, reviewService.productReviewCount(productId.getId().intValue()));
        model.addAttribute("pagination", pagination);

        Map<String, Object> result = new HashMap<String, Object>();
        result.put("productId", productId.getId().intValue());
        result.put("startList", pagination.getStartList());
        result.put("listSize", pagination.getListSize());
        model.addAttribute("boardList", reviewService.findAllByProductId(result));

        return "review/reviewList";
    }

    // 리뷰 작성 폼으로 이동
    @RequestMapping(value = "/reviewForm", method = RequestMethod.GET)
    public String reviewForm() throws Exception {
        return "review/reviewForm";
    }

    // 리뷰 등록하기
    @RequestMapping(value = "/registerReview", method = RequestMethod.POST)
    public String registerReview(Review review, RedirectAttributes rttr, int productId) throws Exception {
        reviewService.register(review);
        rttr.addFlashAttribute("result", "success");
        return "redirect:/product/detail?id=" + productId;
    }





//
//    // 리뷰 존재 여부 확인
//    @RequestMapping(value = "/isExist", method = RequestMethod.POST)
//    public String isExist(Review review) throws Exception {
//        return reviewService.isExist(review);
//    }
//
//    // 리뷰 수정하기
//    @RequestMapping(value = "/update", method = RequestMethod.POST)
//    public void updateReview(Review review) throws Exception {
//        reviewService.update(review);
//    }
//
//    // 리뷰 삭제하기
//    @RequestMapping(value = "/delete", method = RequestMethod.POST)
//    public void deleteReview(Review review) throws Exception {
//        int result = reviewService.delete(review.getReviewId());
//    }
//
//    // 특정 상품의 모든 리뷰 찾기
//    @RequestMapping(value = "/reviewList", method = RequestMethod.GET)
//    public void findAllByProductId(HttpServletRequest request, Model model) throws Exception {
//        List<Review> reviewList = reviewService.findAllByProductId(
//                Integer.parseInt(request.getParameter("reviewId")));
//        model.addAttribute("reviewList", reviewList);
//    }

}