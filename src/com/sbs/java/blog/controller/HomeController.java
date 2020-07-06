package com.sbs.java.blog.controller;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.service.ArticleService;

public class HomeController extends Controller {
	private ArticleService articleService;

	public HomeController(Connection dbConn) {
		articleService = new ArticleService(dbConn);
	}
	
	public String doAction(String actionMethodName, HttpServletRequest req, HttpServletResponse resp) {
		switch (actionMethodName) {
		case "main":
			return moveToMain(req, resp);
		case "cateItems":
			return moveToCatelist(req, resp);
		case "aboutMe":
			return moveToAboutMe(req, resp);
		}

		return "";
	}

	private String moveToAboutMe(HttpServletRequest req, HttpServletResponse resp) {
		return "home/aboutMe.jsp";
	}

	private String moveToCatelist(HttpServletRequest req, HttpServletResponse resp) {
		int page = 1;
		if (req.getParameter("page") != null) {
			page = Integer.parseInt(req.getParameter("page"));
		}
		int itemsInAPage = 10;
		int fullPage = articleService.getRealFullPage();
		int totalPage = fullPage/itemsInAPage;
		List<CateItem> cateItems = articleService.getForPrintListCateItems();
		List<Article> articles = articleService.getForPrintListArticles(page, 0, itemsInAPage);
		req.setAttribute("page", page);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("articles", articles);
		req.setAttribute("cateItems", cateItems);
		return "home/cateItems.jsp";
	}

	private String moveToMain(HttpServletRequest req, HttpServletResponse resp) {
		return "home/main.jsp";
	}
}
