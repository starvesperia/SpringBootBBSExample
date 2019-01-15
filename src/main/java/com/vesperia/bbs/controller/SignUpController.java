package com.vesperia.bbs.controller;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vesperia.bbs.member.Member;
import com.vesperia.bbs.member.MemberRepository;
import com.vesperia.bbs.member.MemberRole;

@Controller
public class SignUpController {
	@Autowired
	MemberRepository memberRepo;
	
	@RequestMapping("/SignUp")
	public String SignUpPage() {
		return "signup";
	}
	
	@PostMapping("/SignUp/Result")
	public String create(Member member) {
		MemberRole role = new MemberRole();
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		member.setUpw(passwordEncoder.encode(member.getUpw()));
		role.setRoleName("BASIC");
		member.setRoles(Arrays.asList(role));
		memberRepo.save(member);
		return "signupresult";
	}
}
