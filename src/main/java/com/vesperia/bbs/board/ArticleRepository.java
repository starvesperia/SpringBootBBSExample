package com.vesperia.bbs.board;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface ArticleRepository extends JpaRepository<Article, Long> {

	@Modifying
	@Query("update Article A set A.viewcount = A.viewcount+1 where A.id=?1")
	int setIncreasedViewcount(Long id);

}
