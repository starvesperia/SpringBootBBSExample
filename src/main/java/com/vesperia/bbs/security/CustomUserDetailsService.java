package com.vesperia.bbs.security;

import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.vesperia.bbs.member.Member;
import com.vesperia.bbs.member.MemberDetails;
import com.vesperia.bbs.member.MemberRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	MemberRepository memberRepo;
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException, NoSuchElementException {
		Member member = memberRepo.findByUemail(email).get();
		return new MemberDetails(member);
	}

}
