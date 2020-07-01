<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="com.sbs.java.blog.dto.CateItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	int limitFrom = (int) request.getAttribute("limitFrom");
	List<Article> articles = (List<Article>) request.getAttribute("articles");
	CateItem cateItem = (CateItem) request.getAttribute("cateItem");
%>
<div class="con list-box">
	<h1><%=cateItem.getName()%>
		게시판
	</h1>
	<div class="table-box">
		<%
			if (articles.size() == 0) {
		%>
		<h2>게시물이 존재하지 않습니다. 😞</h2>
		<%
			} else {
		%>
		<table>
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
					<td><a href="./detail?id=<%=article.getId()%>"><%=article.getTitle()%></a></td>
					<td><%=article.getRegDate()%></td>
					<td><%=article.getUpdateDate()%></td>
					<td><%=cateItem.getName()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<div class="paging">
		<%
			for (int i = 0; i <= limitFrom; i++) {
		%>
		<a href="./list?id=<%=cateItem.getId()%>&page=<%=i + 1%>">[<%=i + 1%>]</a>
		<%
			}
		%>
	</div>
	<%
		}
	%>
</div>
<%@ include file="/jsp/part/foot.jspf"%>
