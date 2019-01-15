package com.vesperia.bbs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SignInController {
	@RequestMapping("/SignIn")
	public String SignInForm(HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		
		if(referer != null && !referer.contains("/SignIn")) {
			request.getSession().setAttribute("prevPage", referer);
		}
		return "signin";
	}
	
	@RequestMapping("/SignOut")
	public String SignOut(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
			HttpSession session = request.getSession(true);
			session.removeAttribute("user");
		}
		return "redirect:/Home";
	}
}
