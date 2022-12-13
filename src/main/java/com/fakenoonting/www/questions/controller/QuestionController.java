package com.fakenoonting.www.questions.controller;

import com.fakenoonting.www.questions.domain.Question;
import com.fakenoonting.www.questions.service.QuestionService;
import com.fakenoonting.www.reviews.controller.ReviewController;
import com.fakenoonting.www.reviews.domain.Review;
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

        Pagination pagination = new Pagination();
        pagination.pageInfo(page, range, questionService.getProdQuesCnt(question.getProductId()));
        model.addAttribute("pagination", pagination);

        Map<String, Object> result4 = new HashMap<>();
        result4.put("productId", question.getProductId());
        result4.put("startList", pagination.getStartList());
        result4.put("listSize", pagination.getListSize());
        model.addAttribute("prodQuesCnt", questionService.getProdQuesCnt(question.getProductId()));
        model.addAttribute("quesList", questionService.findAllProdQuesByProductId(result4));


        return "question/questionList";
    }

    // 문의글 작성 폼으로 이동
    @RequestMapping(value = "/questionForm", method = RequestMethod.GET)
    public String questionForm() {
        return "question/questionForm";
    }

    // 문의글 등록하기
    @RequestMapping(value = "/registerQuestion", method = RequestMethod.POST)
    public String registerQuestion(Question question, RedirectAttributes rttr) throws Exception {
        questionService.register(question);
        rttr.addFlashAttribute("result", "success");
        return "redirect:questionTest";
    }
}
