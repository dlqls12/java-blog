<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="com.sbs.java.blog.dto.CateItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	int totalPage = (int) request.getAttribute("totalPage");
List<Article> articles = (List<Article>) request.getAttribute("articles");
CateItem cateItem = (CateItem) request.getAttribute("cateItem");
%>
<!-- 하이라이트 라이브러리 추가, 토스트 UI 에디터에서 사용됨 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/highlight.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/styles/default.min.css">

<!-- 하이라이트 라이브러리, 언어 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/css.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/javascript.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/xml.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/php.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/php-template.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/sql.min.js"></script>

<!-- 코드 미러 라이브러리 추가, 토스트 UI 에디터에서 사용됨 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />

<!-- 토스트 UI 에디터, 자바스크립트 코어 -->
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.js"></script>

<!-- 토스트 UI 에디터, 신택스 하이라이트 플러그인 추가 -->
<script
	src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>

<!-- 토스트 UI 에디터, CSS 코어 -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

<div class="con list-box">
	<h1 class="mainment"><%=cateItem.getName()%>
		게시판
	</h1>
	<div class="frame">
		<div class="table-box article-list">
			<%
				if (articles.size() == 0) {
			%>
			<h2 class="noArticle">게시물이 존재하지 않습니다. 😞</h2>
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
				<%
					for (int i = 1; i <= totalPage + 1; i++) {
				%>
				<a href="./list?cateItemId=<%=cateItem.getId()%>&page=<%=i%>">[<%=i%>]
				</a>
				<%
					}
				%>
			</div>
		</div>
		<%
			}
		%>
		<div class="bottom">
			<div>
				<div class="yb">
					<img src="../../resource/img/yb.png" alt="로고입니다." />
				</div>
				<div class="ment">
					새싹 개발자 yb<br>웹 개발자가 되기 위해 공부중입니다.
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/jsp/part/foot.jspf"%>