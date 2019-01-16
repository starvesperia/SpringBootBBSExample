package com.vesperia.bbs.board;

import org.springframework.data.domain.Page;

public class PageManager {
	
	private Page<Article> articlePage;
	private final int pagesPerSection;
	private int totalSections;
	private int currentSection;
	private int firstPageInSection;
	private int lastPageInSection;
	private boolean isFirstSection;
	private boolean isLastSection;
	
	public PageManager(Page<Article> articlePage, int pagesPerSection) {
		this.articlePage = articlePage;
		this.pagesPerSection = pagesPerSection;
		setInfo();
	}

	private void setInfo() {
		int curPage = articlePage.getNumber();
		int totalPages = articlePage.getTotalPages();
		totalSections = (totalPages / pagesPerSection) + ( (totalPages % pagesPerSection) == 0 ? 0 : 1 );
		currentSection = curPage / pagesPerSection;
		
		firstPageInSection = currentSection * pagesPerSection;
		lastPageInSection = firstPageInSection + pagesPerSection - 1;
		
		isLastSection = false;
		if(lastPageInSection > totalPages - 1) {
			lastPageInSection = totalPages - 1;
			isLastSection = true;
		}
		isFirstSection = currentSection == 0 ? true : false;
	}

	public int getTotalSections() {
		return totalSections;
	}

	public int getCurrentSection() {
		return currentSection;
	}

	public int getFirstPageInSection() {
		return firstPageInSection;
	}

	public int getLastPageInSection() {
		return lastPageInSection;
	}
	
	public boolean getIsFirstSection() {
		return isFirstSection;
	}

	public boolean getIsLastSection() {
		return isLastSection;
	}
}
