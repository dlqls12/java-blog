package com.sbs.java.blog.controller;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.service.ArticleService;
import com.sbs.java.blog.util.Util;

public class ArticleController extends Controller {
	private ArticleService articleService;

	public ArticleController(Connection dbConn) {
		articleService = new ArticleService(dbConn);
	}

	public String doAction(String actionMethodName, HttpServletRequest req, HttpServletResponse resp) {
		switch (actionMethodName) {
		case "list":
			return doActionList(req, resp);
		case "detail":
			return doActionDetail(req, resp);
		}

		return "";
	}

	private String doActionDetail(HttpServletRequest req, HttpServletResponse resp) {
		if (Util.empty(req, "id")) {
			return "plain:id를 입력해주세요.";
		}

		if (Util.isNum(req, "id") == false) {
			return "plain:id를 정수로 입력해주세요.";
		}

		int id = Util.getInt(req, "id");
		
		if (req.getParameter("id") != null) {
			id = Integer.parseInt(req.getParameter("id"));
		}
		
		Article article = articleService.getForPrintArticle(id);
		int fullPage = articleService.getRealFullPage();
		CateItem cateItem = articleService.getForPrintCateItem(article.getCateItemId());
		req.setAttribute("fullPage", fullPage);
		req.setAttribute("article", article);
		req.setAttribute("cateItem", cateItem);
		
		return "article/detail.jsp";
	}

	private String doActionList(HttpServletRequest req, HttpServletResponse resp) {
		int cateItemId = 0;
		if (req.getParameter("cateItemId") != null) {
			cateItemId = Integer.parseInt(req.getParameter("cateItemId"));
		}
		
		int page = 1;
		if (req.getParameter("page") != null) {
			page = Integer.parseInt(req.getParameter("page"));
		}
		
		int itemsInAPage = 10;
		int fullPage = articleService.getFullPage(cateItemId);
		int totalPage = fullPage/itemsInAPage;
		CateItem cateItem = articleService.getForPrintCateItem(cateItemId);
		List<Article> articles = articleService.getForPrintListArticles(page, cateItemId, itemsInAPage);
		req.setAttribute("fullPage", fullPage);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("cateItem", cateItem);
		req.setAttribute("articles", articles);
		return "article/list.jsp";
	}
}