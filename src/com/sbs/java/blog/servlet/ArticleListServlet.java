package com.sbs.java.blog.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.util.DBUtil;

@WebServlet("/s/home/list")
public class ArticleListServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");

		String driverName = "com.mysql.cj.jdbc.Driver";

		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			System.err.printf("[ClassNotFoundException 예외, %s]%n", e.getMessage());
			return;
		}

		String url = "jdbc:mysql://site30.iu.gy:3306/site30?serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true";
		String user = "site30";
		String password = "sbs123414";

		try (Connection connection = DriverManager.getConnection(url, user, password)) {
			int id = Integer.parseInt(request.getParameter("id"));
			int page = Integer.parseInt(request.getParameter("page"));
			int itemsInAPage = 10;
			List<Article> articles = getArticles(connection, id, page, itemsInAPage);
			CateItem cateItem = getCateItem(connection, id);

			int totalPage = getFullPage(connection, id);
			int limitFrom = totalPage/itemsInAPage;
			request.setAttribute("limitFrom", limitFrom);
			request.setAttribute("articles", articles);
			request.setAttribute("cateItem", cateItem);
			request.getRequestDispatcher("/jsp/home/list.jsp").forward(request, response);

		} catch (SQLException e) {
			System.err.printf("[SQLException 예외, %s]%n", e.getMessage());
			return;
		}
	}

	private int getFullPage(Connection connection, int id) {
		String sql = "";
		sql += String.format("SELECT * ");
		sql += String.format("FROM article ");
		sql += String.format("WHERE cateItemId = %d ", id);
		
		List<Map<String,Object>> rows = DBUtil.selectRows(connection, sql);
		
		int fullPage = rows.size();
		return fullPage;
	}
	
	private List<Article> getArticles(Connection connection, int id, int page, int itemsInAPage) {
		
		String sql = "";
		sql += String.format("SELECT * ");
		sql += String.format("FROM article ");
		sql += String.format("WHERE displayStatus = 1 ");
		sql += String.format("AND cateItemId = %d ", id);
		sql += String.format("ORDER BY id DESC ");
		sql += String.format("LIMIT %d, %d", (page-1)*itemsInAPage, itemsInAPage);

		List<Map<String,Object>> rows = DBUtil.selectRows(connection, sql);
		List<Article> articles = new ArrayList<>();
		for ( Map<String, Object> row : rows ) {
			articles.add(new Article(row));
		}
		return articles;
	}
	
	private CateItem getCateItem(Connection connection, int id) {

		String sql = "";
		sql += String.format("SELECT * ");
		sql += String.format("FROM cateItem ");
		sql += String.format("WHERE id = %d ", id);

		Map<String,Object> row = DBUtil.selectRow(connection, sql);
		
		CateItem cateItem = new CateItem(row);
		
		return cateItem;
	}
}