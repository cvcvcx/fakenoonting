package com.fakenoonting.www.reviews.controller;

import com.fakenoonting.www.member.vo.MemberVO;
import com.fakenoonting.www.reviews.domain.Review;
import com.fakenoonting.www.reviews.service.ReviewService;
import com.fakenoonting.www.util.search.Search;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

    // 상품상세창의 리뷰 불러오기
    @RequestMapping(value = "/reviewList", method = RequestMethod.GET)
    public String reviewList(Model model
            , @RequestParam(defaultValue = "1") int page
            , @RequestParam(defaultValue = "1") int range
            , Review review
            , @RequestParam(defaultValue = "2") int sortNum
            , @RequestParam(required = false) String keyword
    ) throws Exception {

        double avgGrade = reviewService.getProdRvAvgGrade(review.getProductId());
        String format = String.format("%.1f", avgGrade);
        double v = Double.parseDouble(format);
        model.addAttribute("avgGrade", v);

        Map<String, Object> result = new HashMap<>();
        result.put("productId", review.getProductId());
        model.addAttribute("productReviewCount", reviewService.getProdRvCnt(result));

        List<Integer> gradeCountList = new ArrayList<>();
        List<Double> gradeList = new ArrayList<>();
        for (int i = 0; i <= 4; ++i) {
            result.put("grade", 5-i);
            gradeCountList.add(i, reviewService.getProdRvCntByGrade(result));
            gradeList.add(i, ((double) (reviewService.getProdRvCntByGrade(result))
                    / (double) reviewService.getProdRvCnt(result) * 100));
        }
        model.addAttribute("getReviewCountListByGrade", gradeCountList);
        model.addAttribute("gradeRate", gradeCountList);
        logger.info(gradeCountList.toString());

        double peopleLikeCount = ((double)(gradeCountList.get(0) + gradeCountList.get(1))
                / (double)reviewService.getProdRvCnt(result) * 100.00);
        model.addAttribute("peopleLikeCount", String.format("%.0f", peopleLikeCount));


        model.addAttribute("keyword", keyword);

        Search search = new Search();
        search.setKeyword(keyword);

        result.put("contents", search.getKeyword());
        model.addAttribute("productReviewCount2", reviewService.getProdRvCnt(result));

        search.pageInfo(page, range, reviewService.getProdRvCnt(result));
        model.addAttribute("pagination", search);

        result.put("startList", search.getStartList());
        result.put("listSize", search.getListSize());

        model.addAttribute("sortNum", sortNum);

        // 1:추천, 2:최신, 3:평점
        if (sortNum == 1) {
            model.addAttribute("dataList", reviewService.findAllProdRvByProductId(result));
        } else if (sortNum == 2) {
            model.addAttribute("dataList", reviewService.findAllProdRvByProductId(result));
        } else if (sortNum == 3) {
            model.addAttribute("dataList", reviewService.findAllProdRvByGrade(result));
        } else {
            model.addAttribute("dataList", reviewService.findAllProdRvByProductId(result));
        }

        return "review/reviewList";
    }

    // 리뷰 작성 폼으로 이동
    @RequestMapping(value = "/reviewForm", method = RequestMethod.GET)
    public String reviewForm(HttpServletRequest request) throws Exception {

        HttpSession session = request.getSession();
        MemberVO memberVO = (MemberVO)session.getAttribute("member");
        Object isLoginOn = session.getAttribute("isLogOn");


        if (memberVO == null || isLoginOn == null) {
            logger.info("로그인해라 알림창 띄워줘야할듯");
            return "redirect:/member/loginForm.do";
        } else {
            logger.info(memberVO.toString());
            logger.info(isLoginOn.toString());

            return "review/reviewForm";
        }
    }

    // 리뷰 등록하기
    @RequestMapping(value = "/registerReview", method = RequestMethod.POST)
    public String registerReview(Review review, RedirectAttributes rttr, int productId, HttpServletRequest request) throws Exception {

        HttpSession session = request.getSession();
        MemberVO memberVO = (MemberVO)session.getAttribute("member");

        review.setMemberId(memberVO.getId());
        review.setNickname(memberVO.getNick());

        reviewService.register(review);
        logger.info(review.toString());

        rttr.addFlashAttribute("result", "register success");
        return "redirect:/product/detail?id=" + productId;
    }

    // 전체 상품 리뷰 보기
    @RequestMapping(value = "/allReviewList", method = RequestMethod.GET)
    public String allReviewList() throws Exception {
        return "review/allReviewList";
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