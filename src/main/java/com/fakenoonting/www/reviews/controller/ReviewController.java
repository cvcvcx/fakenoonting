package com.fakenoonting.www.reviews.controller;

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

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class ReviewController {

    private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
    private final ReviewService reviewService;

    @Autowired
    public ReviewController(ReviewService reviewService) {
        this.reviewService = reviewService;
    }

    // 리뷰 리스트 불러오기
    @RequestMapping(value = "/reviewList", method = RequestMethod.GET)
    public String reviewList(Model model
            , @RequestParam(defaultValue = "1") int page
            , @RequestParam(defaultValue = "1") int range
            , Review review
            , @RequestParam(defaultValue = "2") int sortNum
    ) throws Exception {

        model.addAttribute("productReviewCount", reviewService.productReviewCount(review.getProductId()));
        model.addAttribute("avgGrade", reviewService.getAvgGrade(review.getProductId()));

        Pagination pagination = new Pagination();
        pagination.pageInfo(page, range, reviewService.productReviewCount(review.getProductId()));
        model.addAttribute("pagination", pagination);

        Map<String, Object> result = new HashMap<>();
        result.put("productId", review.getProductId());
        result.put("startList", pagination.getStartList());
        result.put("listSize", pagination.getListSize());

        // 추천1, 최신2, 평점3순으로 정렬
        if (sortNum == 1) {
            model.addAttribute("dataList", reviewService.findAllByProductId(result));
        } else if (sortNum == 2) {
            model.addAttribute("dataList", reviewService.findAllByProductId(result));
        } else if (sortNum == 3) {
            model.addAttribute("dataList", reviewService.findAllByGrade(result));
        } else {
            model.addAttribute("dataList", reviewService.findAllByProductId(result));
        }

        // 평점별 리뷰수
        Map<String, Object> result2 = new HashMap<>();

        List<Integer> gradeCountList = new ArrayList<>();
        List<Double> gradeList = new ArrayList<>();

        for (int i = 0; i <= 4; ++i) {
            result2.put("productId", review.getProductId());
            result2.put("grade", 5-i);
            gradeCountList.add(i, reviewService.getReviewCountListByGrade(result2));
            gradeList.add(i, ((double) (reviewService.getReviewCountListByGrade(result2))
                    / (double) reviewService.productReviewCount(review.getProductId())) * 100);
        }

        model.addAttribute("getReviewCountListByGrade", gradeCountList);
        model.addAttribute("gradeRate", gradeList);

        double peopleLikeCount = ((double)(gradeCountList.get(0) + gradeCountList.get(1))
                / (double)reviewService.productReviewCount(review.getProductId()) * 100.00);
        model.addAttribute("peopleLikeCount", String.format("%.0f", peopleLikeCount));

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