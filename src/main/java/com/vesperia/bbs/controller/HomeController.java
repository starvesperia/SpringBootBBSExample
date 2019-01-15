package com.vesperia.bbs.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vesperia.bbs.member.MemberDetails;
import com.vesperia.bbs.security.ClientIPGetter;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping("/Home")
	public String Home(Model model, Locale locale, Authentication authentication, HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);
		logger.info("Server time is {}.", formattedDate);
		model.addAttribute("serverTime", formattedDate);

		String clientIP = ClientIPGetter.GetClientIp(request);
		logger.info("Client IP address is {}.", clientIP);
		model.addAttribute("clientIP", clientIP);
		
		//HttpSession session = request.getSession(true);
		//MemberDetails user = (MemberDetails) session.getAttribute("user");
		
		MemberDetails user = null;
		if(authentication != null) {
			user = (MemberDetails) authentication.getPrincipal();
			user.setIp(clientIP);
			
			String uid = user.getUsername();
			logger.info("User ID is {}.", uid);
			model.addAttribute("uid", uid);
		}
		model.addAttribute("user", user);

		return "home";
	}
}
