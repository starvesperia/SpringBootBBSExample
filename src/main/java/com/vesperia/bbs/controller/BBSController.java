package com.vesperia.bbs.controller;

import java.util.Date;
//import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vesperia.bbs.board.Article;
import com.vesperia.bbs.board.ArticleRepository;
import com.vesperia.bbs.board.PageManager;
import com.vesperia.bbs.member.MemberDetails;

@Controller
public class BBSController {

	private final String strRoleAdmin = "ROLE_ADMIN";
	private final int PAGES_PER_SECTION = 5;
	private final int ARTICLES_PER_PAGE = 10;
	@Autowired
	private ArticleRepository articleRepo; // dao
	
	private boolean CheckModifyAuthentication(Authentication authentication, Article article, boolean delete)
	{
		MemberDetails user = (MemberDetails) authentication.getPrincipal();
		boolean editable = user.getUsername().equals(article.getAuthor());
		boolean isAdmin = user.getAuthorities().toString().contains(strRoleAdmin);
		if(delete && (editable || isAdmin)) {
			return true;
		}
		else if(!delete && editable) {
			return true;
		}
		else {
			return false;
		}
	}

	@RequestMapping("bbs")
	public String BBSMain(Model model, // id 역순으로 정렬. 한 페이지당 게시글 10개씩
			@PageableDefault(sort = {"id"}, direction = Direction.DESC, size = ARTICLES_PER_PAGE) Pageable pageable) {
		// List<Article> articleList = articleRepo.findAll();
		Page<Article> articlePage = articleRepo.findAll(pageable);
		PageManager pageManager = new PageManager(articlePage, PAGES_PER_SECTION);
		model.addAttribute("articlePage", articlePage);
		model.addAttribute("pageManager", pageManager);
		model.addAttribute("pagesPerSection", PAGES_PER_SECTION);
		return "bbs";
	}

	@GetMapping("bbs/Write")
	public String WriteArticle(Model model, Authentication authentication) {
		return "writearticle";
	}

	@PostMapping("bbs/Write")
	public String SaveArticle(Model model, Article article, HttpServletRequest request, Authentication authentication) {
		MemberDetails user = (MemberDetails) authentication.getPrincipal();
		article.setAuthor(user.getUsername());
		article.setRegdate(new Date());
		article.setTitle(request.getParameter("title"));
		article.setContent(request.getParameter("content"));
		article.setViewcount(0L);
		return "redirect:/bbs/Article_" + articleRepo.save(article).getId();
	}
	
	@GetMapping("bbs/Article_{id}/Edit")
	public String EditArticle(Authentication authentication, Model model, @PathVariable Long id) {
		Article article = articleRepo.findById(id).get();
		if( CheckModifyAuthentication(authentication, article, false) == false ) {
			return "redirect:/bbs/Article_{id}";
		}
		model.addAttribute("article", article);
		return "editarticle";
	}
	
	@PostMapping("bbs/Article_{id}/Edit")
	public String SaveEditedArticle(Authentication authentication, Model model, HttpServletRequest request, @PathVariable Long id) {
		Article article = articleRepo.findById(id).get();
		article.setContent(request.getParameter("content"));
		article.setUpdatedate(new Date());
		return "redirect:/bbs/Article_" + articleRepo.save(article).getId();
	}

	@Transactional
	@RequestMapping("bbs/Article_{id}")
	public String ViewArticle(Authentication authentication, Model model, @PathVariable Long id) {
		MemberDetails user = (MemberDetails) authentication.getPrincipal();
		Article article = articleRepo.findById(id).get();
		boolean isAdmin = user.getAuthorities().toString().contains(strRoleAdmin);
		boolean editable = user.getUsername().equals(article.getAuthor());
		model.addAttribute("article", article);
		model.addAttribute("editable", editable);
		model.addAttribute("isAdmin", isAdmin);
		
		articleRepo.setIncreasedViewcount(id); // 조회수 증가
		return "article";
	}
	
	@RequestMapping("bbs/Article_{id}/Delete")
	public String DeleteArticle(Authentication authentication, @PathVariable Long id) {
		if( CheckModifyAuthentication(authentication, articleRepo.getOne(id), true) ) {
			articleRepo.deleteById(id);
			return "redirect:/bbs";
		}
		else {
			return "redirect:/bbs/Article_{id}";
		}
	}
}
