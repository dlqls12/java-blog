<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="com.sbs.java.blog.dto.CateItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	int paramPage = (int) request.getAttribute("page");
	int fullPage = (int) request.getAttribute("fullPage");
	int totalPage = (int) request.getAttribute("totalPage");
	List<Article> articles = (List<Article>) request.getAttribute("articles");
	CateItem cateItem = (CateItem) request.getAttribute("cateItem");
%>
<div class="con">
	<div class="body-box">
		<h1 class="list-title"><%=cateItem.getName()%>
			게시판<div>총 게시물 수 : <%=fullPage %></div>
		</h1>
		<div class="list-box articles">
			<%
				if (articles.size() == 0) {
			%>
			<h2>게시물이 존재하지 않습니다. 😞</h2>
			<%
				} else {
			%>
			<table class="con">
				<thead>
					<tr>
						<th>ID</th>
						<th>제목</th>
						<th>등록날짜</th>
						<th>갱신날짜</th>
						<th>카테고리</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (Article article : articles) {
					%>
					<tr>
						<td><%=article.getId()%></td>
						<td><a href="../article/detail?id=<%=article.getId()%>"><%=article.getTitle()%></a></td>
						<td><%=article.getRegDate()%></td>
						<td><%=article.getUpdateDate()%></td>
						<td><%=cateItem.getName()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<div class="paging">
				<ul>
					<%
						for (int i = 1; i <= totalPage + 1; i++) {
					%>
							<li class="<%=i == paramPage ? "current" : ""%>"><a href="./list?cateItemId=<%=cateItem.getId()%>&page=<%=i%>">[<%=i%>]</a></li>
					<%
						}
					%>
				</ul>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<div class="bottom">
		<div>
			<div class="yb">
				<img src="../../resource/img/yb.png" alt="로고입니다." />
			</div>
			<div class="ment">dlqls0190@naver.com</div>
		</div>
	</div>
</div>
<%@ include file="/jsp/part/foot.jspf"%>