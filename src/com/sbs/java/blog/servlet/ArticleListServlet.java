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
import com.sbs.java.blog.util.DBUtil;

@WebServlet("/s/home/list")
public class ArticleListServlet extends HttpServlet {
	private List<Article> getArticles() {
		String url = "jdbc:mysql://localhost:3306/blog?serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true";
		String user = "root";
		String password = "";
		String driverName = "com.mysql.cj.jdbc.Driver";

		String sql = "";
		sql += String.format("SELECT * ");
		sql += String.format("FROM article ");
		sql += String.format("ORDER BY id DESC ");

		List<Article> articles = new ArrayList<>();

		Connection connection = null;
		Statement stmt = null;

		try {
			Class.forName(driverName);
			connection = DriverManager.getConnection(url, user, password);

			List<Map<String, Object>> rows = DBUtil.selectRows(connection, sql);

			for ( Map<String, Object> row : rows ) {
				articles.add(new Article(row));
			}

		} catch (ClassNotFoundException e) {
			System.err.printf("[ClassNotFoundException 예외]");
			System.err.printf("msg : " + e.getMessage());
		} catch (SQLException e) {
			System.err.printf("[SQLException 예외]");
			System.err.printf("msg : " + e.getMessage());
		}
		finally {
			if ( connection != null ) {
				try {
					connection.close();
				} catch (SQLException e) {
					System.err.printf("[SQL 예외, connection 닫기] : %s\n", e.getMessage());
				}
			}
			
			if ( stmt != null ) {
				try {
					stmt.close();
				} catch (SQLException e) {
					System.err.printf("[SQL 예외, stmt 닫기] : %s\n", e.getMessage());
				}
			}
		}

		return articles;
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");

		List<Article> articles = getArticles();
		
		request.setAttribute("articles", articles);
		request.getRequestDispatcher("/jsp/home/list.jsp").forward(request, response);
	}
}
