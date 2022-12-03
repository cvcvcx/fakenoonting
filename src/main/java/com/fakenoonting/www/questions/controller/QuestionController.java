package com.fakenoonting.www.questions.controller;

import com.fakenoonting.www.questions.domain.Question;
import com.fakenoonting.www.questions.service.QuestionService;
import com.fakenoonting.www.reviews.domain.Review;
import com.fakenoonting.www.util.paging.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class QuestionController {

    private final QuestionService questionService;

    @Autowired
    public QuestionController(QuestionService questionService) {
        this.questionService = questionService;
    }

    // 아작스로 추가전까지 임시페이지 만들어서 사용
    @RequestMapping(value = "/questionTest", method = RequestMethod.GET)
    public String questionTest(Model model
            , @RequestParam(required = false, defaultValue = "1") int page
            , @RequestParam(required = false, defaultValue = "1") int range) throws Exception {

        model.addAttribute("allQuestionCount", questionService.allQuestionCount());

        Pagination pagination = new Pagination();
        pagination.pageInfo(page, range, questionService.allQuestionCount());
        model.addAttribute("pagination", pagination);
        model.addAttribute("boardList", questionService.findAllPaging(pagination));

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
