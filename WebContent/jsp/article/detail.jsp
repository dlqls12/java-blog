<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="com.sbs.java.blog.dto.CateItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	int fullPage = (int) request.getAttribute("fullPage");
Article article = (Article) request.getAttribute("article");
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

<div class="con">
	<div class="body-box">
		<section class="detail-title">
			<h1><%=article.getId()%>
				|
				<%=article.getTitle()%></h1>
			<h3>
				카테고리 :
				<%=cateItem.getName()%> | 작성날짜 :<%=article.getRegDate()%></h3>
		</section>
		<section class="detail-box">
			<div id="origin1" style="display: none;"><%=article.getBody()%></div>
			<div id="viewer1"></div>
			<script>
				var editor1__initialValue = $('#origin1').html();
				var editor1 = new toastui.Editor({
					el : document.querySelector('#viewer1'),
					height : '600px',
					initialValue : editor1__initialValue,
					viewer : true,
					plugins : [ toastui.Editor.plugin.codeSyntaxHighlight ]
				});
			</script>
		</section>
		<div class="next-or-prev-button">
			<%
				if (article.getId() > 1) {
			%>
			<a href="detail?id=<%=article.getId() - 1%>">[이전글]</a>
			<%
				}
			%>
			<%
				if (article.getId() < fullPage) {
			%>
			<a href="detail?id=<%=article.getId() + 1%>">[다음글]</a>
			<%
				}
			%>
		</div>
		<h3 class="return-button">
			<a href="./list?cateItemId=<%=cateItem.getId()%>&page=1">⬅리스트로
				돌아가기</a>
		</h3>
	</div>
	<div class="bottom">
		<div>
			<div class="yb">
				<img src="../../resource/img/yb.png" alt="로고입니다." />
			</div>
			<div class="ment">
				dlqls0190@naver.com
			</div>
		</div>
	</div>
</div>
<%@ include file="/jsp/part/foot.jspf"%>