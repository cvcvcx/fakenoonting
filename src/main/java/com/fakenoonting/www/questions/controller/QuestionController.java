package com.fakenoonting.www.questions.controller;

import com.fakenoonting.www.member.vo.MemberVO;
import com.fakenoonting.www.product.vo.ProductVO;
import com.fakenoonting.www.questions.domain.Question;
import com.fakenoonting.www.questions.service.QuestionService;
import com.fakenoonting.www.util.paging.Pagination;
import com.fakenoonting.www.util.search.Search;
import com.fakenoonting.www.util.upload.vo.ImgItemVO;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class QuestionController {

    private static final Logger logger = LoggerFactory.getLogger(QuestionController.class);
    private final QuestionService questionService;

    @Autowired
    public QuestionController(QuestionService questionService) {
        this.questionService = questionService;
    }

    // 상품상세창의 문의 불러오기
    @RequestMapping(value = "/questionList", method = RequestMethod.GET)
    public String questionList(Model model
            , @RequestParam(required = false, defaultValue = "1") int page
            , @RequestParam(required = false, defaultValue = "1") int range
            , Question question
    ) throws Exception {

        Map<String, Object> result = new HashMap<>();
        result.put("productId", question.getProductId());
        result.put("contents", null);

        Pagination pagination = new Pagination();
        pagination.pageInfo(page, range, questionService.getProdQuesCnt(result));
        model.addAttribute("pagination", pagination);

        result.put("startList", pagination.getStartList());
        result.put("listSize", pagination.getListSize());
        model.addAttribute("prodQuesCnt", questionService.getProdQuesCnt(result));
        model.addAttribute("quesList", questionService.findAllProdQuesByProductId(result));

        return "question/questionList";
    }

    // 문의글 작성 폼으로 이동
    @RequestMapping(value = "/questionForm", method = RequestMethod.GET)
    public String questionForm(HttpServletRequest request, Model model) {

        HttpSession session = request.getSession();
        MemberVO memberVO = (MemberVO)session.getAttribute("member");
        Object isLoginOn = session.getAttribute("isLogOn");

        if (memberVO == null || isLoginOn == null) {
            return "redirect:/member/loginForm.do";
        } else {
            model.addAttribute("memberVO", memberVO);

            String productId = request.getParameter("productId");

            List<ImgItemVO> productImg = questionService.getProductImg(Long.parseLong(productId));
            model.addAttribute("productImg", productImg);

            List<ProductVO> productName = questionService.getProductName(Long.parseLong(productId));
            model.addAttribute("productName", productName);

            return "question/questionForm";
        }
    }

    // 문의글 등록하기
    @RequestMapping(value = "/registerQuestion", method = RequestMethod.POST)
    public String registerQuestion(
            Question question
            , HttpServletRequest request
            , RedirectAttributes rttr
            , Long productId
    ) throws Exception {

        HttpSession session = request.getSession();
        MemberVO memberVO = (MemberVO)session.getAttribute("member");

        question.setMemberId(memberVO.getId());
        question.setNickname(memberVO.getNick());

        questionService.register(question);
        rttr.addFlashAttribute("result", "ques register success");
        return "redirect:/product/detail?id=" + productId;
    }

    @RequestMapping(value = "/allQuestionList", method = RequestMethod.GET)
    public String allQuestionList(Model model
            , @RequestParam(required = false, defaultValue = "1") int page
            , @RequestParam(required = false, defaultValue = "1") int range
            , Question question
            , @RequestParam(defaultValue = "5") int sortNum
    ) throws Exception {

        List<ImgItemVO> productImg = questionService.getProductImg(null);
        model.addAttribute("productImg", productImg);

        Map<String, Object> result = new HashMap<>();
        result.put("contents", null);

        // 1:상품, 2:배송, 3:교환반취소 4:기타 5:전체
        model.addAttribute("sortNum", sortNum);
        result.put("category", sortNum);
        Search search = new Search();
        search.pageInfo(page, range, questionService.getProdQuesCnt(result));
        model.addAttribute("pagination", search);
        result.put("startList", search.getStartList());
        result.put("listSize", search.getListSize());
        model.addAttribute("prodQuesCnt", questionService.getProdQuesCnt(result));
        model.addAttribute("quesList", questionService.findAllProdQuesByProductId(result));

        return "question/allQuestionList";
    }
}
