package com.vesperia.bbs.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vesperia.bbs.board.Article;
import com.vesperia.bbs.board.ArticleRepository;
import com.vesperia.bbs.member.MemberDetails;

@Controller
public class BBSController {

	@Autowired
	private ArticleRepository articleRepo; // dao

	@RequestMapping("bbs")
	public String BBSMain(Model model) {
		List<Article> articleList = articleRepo.findAll();
		model.addAttribute("articleList", articleList);
		return "bbs";
	}

	@GetMapping("bbs/Write")
	public String WriteArticle(Model model/*, Article article*/, Authentication authentication) {
		MemberDetails user = (MemberDetails) authentication.getPrincipal();
		model.addAttribute("author", user.getUsername());
		//article.setAuthor(user.getUsername());
		//article.setRegdate(new Date());
		//model.addAttribute("article", article);
		return "writearticle";
		//return "redirect:/Article/" + articleRepo.save(article).getId();
	}

	@PostMapping("bbs/Write")
	public String SaveArticle(Model model, Article article, HttpServletRequest request, Authentication authentication)
	{
		MemberDetails user = (MemberDetails) authentication.getPrincipal();
		article.setAuthor(user.getUsername());
		article.setRegdate(new Date());
		article.setTitle(request.getParameter("title"));
		article.setContent(request.getParameter("content"));
		article.setViewcount(0L);
		return "redirect:/bbs/Article_" + articleRepo.save(article).getId();
	}

	@RequestMapping("bbs/Article_{id}")
	public String ViewArticle(Model model, @PathVariable Long id) {
		Article article = articleRepo.findById(id).get();
		model.addAttribute("article", article);
		return "article";
	}
	
	@RequestMapping("bbs/Article_{id}/delete")
	public String DeleteArticle(@PathVariable Long id) {
		articleRepo.deleteById(id);
		return "redirect:/bbs";
	}
}
