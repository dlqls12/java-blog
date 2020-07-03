<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.CateItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	List<CateItem> cateItems = (List<CateItem>) request.getAttribute("cateItems");
%>
<div class="con list-box">
	<h1 class="mainment"></h1>
	<div class="frame">
		<div class="category-box">
			<%
				for (CateItem cateItem : cateItems) {
			%>

			<div class="inline"><a href="../article/list?cateItemId=<%=cateItem.getId()%>&page=1"><%=cateItem.getName()%></a></div>

			<%
				}
			%>
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
</div>
<%@ include file="/jsp/part/foot.jspf"%>