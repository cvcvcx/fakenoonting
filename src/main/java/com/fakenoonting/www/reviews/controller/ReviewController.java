package com.fakenoonting.www.reviews.controller;

import com.fakenoonting.www.member.vo.MemberVO;
import com.fakenoonting.www.product.vo.ProductVO;
import com.fakenoonting.www.questions.service.QuestionService;
import com.fakenoonting.www.reviews.domain.Review;
import com.fakenoonting.www.reviews.service.ReviewService;
import com.fakenoonting.www.util.search.Search;
import com.fakenoonting.www.util.upload.vo.ImgItemVO;
import com.fakenoonting.www.util.upload.vo.ImgReviewItemVo;
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
    private final QuestionService questionService;

    @Autowired
    public ReviewController(ReviewService reviewService, QuestionService questionService) {
        this.reviewService = reviewService;
        this.questionService = questionService;
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

        int reviewImgCnt = reviewService.getRvImgCnt(review.getProductId());
        model.addAttribute("reviewImgCnt", reviewImgCnt);

        List<ImgReviewItemVo> reviewImg = reviewService.getReviewImg(review.getProductId());
        model.addAttribute("reviewImg", reviewImg);

        List<ImgReviewItemVo> allReviewImg = reviewService.getAllReviewImg(review.getProductId());
        model.addAttribute("allReviewImg", allReviewImg);

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


        // 1:추천, 2:최신, 3:평점
        model.addAttribute("sortNum", sortNum);
        if (sortNum == 1) {
            model.addAttribute("dataList", reviewService.findAllProdRvByProductId(result));
        } else if (sortNum == 2) {
            model.addAttribute("dataList", reviewService.findAllProdRvByProductId(result));
        } else if (sortNum == 3) {
            model.addAttribute("dataList", reviewService.findAllProdRvByGrade(result));
        } else {
            model.addAttribute("dataList", reviewService.findAllProdRvByProductId(result));
        }

        model.addAttribute("prodQuesCnt", questionService.getProdQuesCnt(result));

        return "review/reviewList";
    }

    // 리뷰 작성 폼으로 이동
    @RequestMapping(value = "/reviewForm", method = RequestMethod.GET)
    public String reviewForm(HttpServletRequest request, Model model) throws Exception {

        HttpSession session = request.getSession();
        MemberVO memberVO = (MemberVO)session.getAttribute("member");
        Object isLoginOn = session.getAttribute("isLogOn");

        if (memberVO == null || isLoginOn == null) {
            return "redirect:/member/loginForm.do";
        } else {
            model.addAttribute("memberVO", memberVO);

            String productId = request.getParameter("productId");
            logger.info("prodId " + productId);

            List<ImgItemVO> productImg = reviewService.getProductImg(Long.parseLong(productId));
            logger.info(productImg.toString());
            model.addAttribute("productImg", productImg);

            List<ProductVO> productName = reviewService.getProductName(Long.parseLong(productId));
            logger.info(productName.toString());
            model.addAttribute("productName", productName);

            return "review/reviewForm";
        }
    }

    // 리뷰 등록하기
    @RequestMapping(value = "/registerReview", method = RequestMethod.POST)
    public String registerReview(
            Review review
            , RedirectAttributes rttr
            , Long productId
            , HttpServletRequest request
    ) throws Exception {

        HttpSession session = request.getSession();
        MemberVO memberVO = (MemberVO)session.getAttribute("member");

        review.setMemberId(memberVO.getId());
        review.setNickname(memberVO.getNick());

        logger.info(review.toString());

        reviewService.register(review);
        reviewService.uploadRvImg(review);

        rttr.addFlashAttribute("result", "register success");
        return "redirect:/product/detail?id=" + productId;
    }

    // 전체 상품 리뷰 보기
    @RequestMapping(value = "/allReviewList", method = RequestMethod.GET)
    public String allReviewList(Model model
            , @RequestParam(defaultValue = "1") int page
            , @RequestParam(defaultValue = "1") int range
            , @RequestParam(defaultValue = "2") int sortNum
            , @RequestParam(required = false) String keyword
    ) throws Exception {

        List<ImgReviewItemVo> reviewImg = reviewService.getReviewImg(null);
        model.addAttribute("reviewImg", reviewImg);

        List<ImgItemVO> productImg = reviewService.getProductImg(null);
        model.addAttribute("productImg", productImg);

        List<ProductVO> productName = reviewService.getProductName(null);
        model.addAttribute("productName", productName);


        Map<String, Object> result = new HashMap<>();
        model.addAttribute("keyword", keyword);

        Search search = new Search();
        search.setKeyword(keyword);
        result.put("contents", search.getKeyword());

        search.pageInfo(page, range, reviewService.getProdRvCnt(result));
        model.addAttribute("pagination", search);

        result.put("startList", search.getStartList());
        result.put("listSize", search.getListSize());


        // 1:추천, 2:최신, 3:평점
        model.addAttribute("sortNum", sortNum);
        if (sortNum == 1) {
            model.addAttribute("dataList", reviewService.findAllProdRvByProductId(result));
        } else if (sortNum == 2) {
            model.addAttribute("dataList", reviewService.findAllProdRvByProductId(result));
        } else if (sortNum == 3) {
            model.addAttribute("dataList", reviewService.findAllProdRvByGrade(result));
        } else {
            model.addAttribute("dataList", reviewService.findAllProdRvByProductId(result));
        }

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