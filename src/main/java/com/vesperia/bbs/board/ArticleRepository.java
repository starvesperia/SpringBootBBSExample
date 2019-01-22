package com.vesperia.bbs.board;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface ArticleRepository extends JpaRepository<Article, Long> {

	@Modifying
	@Query("update Article A set A.viewcount = A.viewcount+1 where A.id=?1")
	int setIncreasedViewcount(Long id);

	public List<Article> findByTitleIgnoreCaseContaining(String title);
	public Page<Article> findByTitleIgnoreCaseContaining(String title, Pageable pageable);
	public Page<Article> findByAuthorIgnoreCaseContaining(String Author, Pageable pageable);
	public Page<Article> findByContentIgnoreCaseContaining(String content, Pageable pageable);
}
