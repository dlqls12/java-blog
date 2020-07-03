package com.sbs.java.blog.service;

import java.sql.Connection;
import java.util.List;

import com.sbs.java.blog.dao.ArticleDao;
import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.dto.CateItem;

public class ArticleService {

	private ArticleDao articleDao;
	
	public ArticleService(Connection dbConn) {
		articleDao = new ArticleDao(dbConn);
	}

	public List<CateItem> getForPrintListCateItems() {
		return articleDao.getForPrintListCateItems();
	}
	
	public List<Article> getForPrintListArticles(int page, int cateItemId, int itemsInAPage) {
		return articleDao.getForPrintListArticles(page, cateItemId, itemsInAPage);
	}
	
	public int getFullPage(int id) {
		return articleDao.getFullPage(id);
	}
	
	public Article getForPrintArticle(int id) {
		return articleDao.getForPrintArticle(id);
	}

	public CateItem getForPrintCateItem(int cateItemId) {
		return articleDao.getForPrintCateItem(cateItemId);
	}

	public int getRealFullPage() {
		return articleDao.getRealFullPage();
	}
}