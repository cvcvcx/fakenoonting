package com.fakenoonting.www.member.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public interface MemberControllerInterface {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;

}
