package com.sbs.java.blog.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.util.DBUtil;

public class ArticleDao {
	private Connection dbConn;

	public ArticleDao(Connection dbConn) {
		this.dbConn = dbConn;
	}

	public List<CateItem> getForPrintListCateItems() {
		String sql = "";

		sql += String.format("SELECT * ");
		sql += String.format("FROM cateItem ");

		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, sql);
		List<CateItem> cateItems = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			cateItems.add(new CateItem(row));
		}

		return cateItems;
	}

	
	public List<Article> getForPrintListArticles(int page, int cateItemId, int itemsInAPage) {
		String sql = "";

		int limitFrom = (page - 1) * itemsInAPage;

		sql += String.format("SELECT * ");
		sql += String.format("FROM article ");
		sql += String.format("WHERE displayStatus = 1 ");
		if (cateItemId != 0) {
			sql += String.format("AND cateItemId = %d ", cateItemId);
		}
		sql += String.format("ORDER BY id DESC ");
		sql += String.format("LIMIT %d, %d ", limitFrom, itemsInAPage);

		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, sql);
		List<Article> articles = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			articles.add(new Article(row));
		}

		return articles;
	}

	public Article getForPrintArticle(int id) {
		String sql = "";

		sql += String.format("SELECT * ");
		sql += String.format("FROM article ");
		sql += String.format("WHERE id = %d ", id);
		
		Map<String, Object> row = DBUtil.selectRow(dbConn, sql);
		Article article = new Article(row);
		return article;
	}

	public CateItem getForPrintCateItem(int cateItemId) {
		String sql = "";

		sql += String.format("SELECT * ");
		sql += String.format("FROM cateItem ");
		sql += String.format("WHERE id = %d ", cateItemId);

		Map<String, Object> row = DBUtil.selectRow(dbConn, sql);

		return new CateItem(row);
	}

	public int getFullPage(int id) {
		String sql = "";
		sql += String.format("SELECT * ");
		sql += String.format("FROM article ");
		sql += String.format("WHERE cateItemId = %d ", id);
		
		List<Map<String,Object>> rows = DBUtil.selectRows(dbConn, sql);
		
		int fullPage = rows.size();
		return fullPage;
	}

	public int getRealFullPage() {
		String sql = "";

		sql += String.format("SELECT * ");
		sql += String.format("FROM article ");

		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, sql);
		List<Article> articles = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			articles.add(new Article(row));
		}

		return articles.size();
	}
}