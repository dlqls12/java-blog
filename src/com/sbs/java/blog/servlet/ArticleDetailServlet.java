package com.sbs.java.blog.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.util.DBUtil;

@WebServlet("/s/home/detail")
public class ArticleDetailServlet extends HttpServlet {
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
			Article article = getArticle(connection, id);
			
			request.setAttribute("article", article);
			request.getRequestDispatcher("/jsp/home/detail.jsp").forward(request, response);
			
		} catch (SQLException e) {
			System.err.printf("[SQLException 예외, %s]%n", e.getMessage());
			return;
		}
	}

	private Article getArticle(Connection connection, int id) {
		String sql = "";
		
		sql += String.format("SELECT * ");
		sql += String.format("FROM article ");
		sql += String.format("WHERE id = %d ", id);
		
		Map<String,Object> row = DBUtil.selectRow(connection, sql);
		
		return new Article(row);
	}
}
