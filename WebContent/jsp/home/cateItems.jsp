<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.CateItem"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	int totalPage = (int) request.getAttribute("totalPage");
	List<CateItem> cateItems = (List<CateItem>) request.getAttribute("cateItems");
	List<Article> articles = (List<Article>) request.getAttribute("articles");
%>
<div class="con">
	<div class="body-box">
		<div class="cateItems">
			<ul>
				<li><a href="../home/cateItems">전체</a></li>
				<%
					for (CateItem cateItem : cateItems) {
				%>
				<li>
					<a href="../article/list?cateItemId=<%=cateItem.getId()%>&page=1"><%=cateItem.getName()%></a>
				</li>
				<%
					}
				%>
			</ul>
		</div>
		<div class="list-box category">
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
						<td>
							<%
								for (int i = 0; i < cateItems.size(); i++) {
							%> 
							<%
							if (cateItems.get(i).getId() == article.getCateItemId()) {
							%>
							<%=cateItems.get(i).getName()%>
							<%
							}
							%>
							<%
							}
							%>
						</td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
				}
			%>
		</div>
		<div class="paging">
			<ul>
				<%
					for (int i = 1; i <= totalPage + 1; i++) {
				%>
				<li> 
				<a href="./cateItems?page=<%=i%>">[<%=i%>]</a>
				</li> 
				<%
				}
				%>
			</ul>
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