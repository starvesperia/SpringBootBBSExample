package com.vesperia.bbs.member;

import org.springframework.data.repository.CrudRepository;

import com.vesperia.bbs.member.Member;

import java.lang.String;
import java.util.Optional;

public interface MemberRepository extends CrudRepository<Member, Long> {
	public Optional<Member> findByUemail(String uemail);
}
