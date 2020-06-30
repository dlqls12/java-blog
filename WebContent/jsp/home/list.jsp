<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	List<Article> articles = (List<Article>) request.getAttribute("articles");
%>
<div class="con list-box">
	<h1>게시물 리스트</h1>
	<div class="table-box">
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>등록날짜</th>
					<th>갱신날짜</th>
					<th>제목</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (Article article : articles) {
				%>
				<tr>
					<td><%=article.getId()%></td>
					<td><%=article.getRegDate()%></td>
					<td><%=article.getUpdateDate()%></td>
					<td><a href="./detail?id=<%=article.getId()%>"><%=article.getTitle()%></a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</div>
<%@ include file="/jsp/part/foot.jspf"%>
