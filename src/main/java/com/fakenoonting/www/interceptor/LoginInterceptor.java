package com.fakenoonting.www.interceptor;


import com.fakenoonting.www.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

@Slf4j
public class LoginInterceptor implements HandlerInterceptor {

    //로그인이 되어있지 않을 때
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws IOException {
        log.info("preHandle 실행중...");
        HttpSession session = request.getSession();
        MemberVO member = (MemberVO)session.getAttribute("member");
        if(member == null){
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().write("<script>alert('로그인이 필요합니다'); location.replace('/member/loginForm.do');</script>");

            return false;
        }

        return true;
    }
}
