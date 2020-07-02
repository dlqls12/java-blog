<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.CateItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	List<CateItem> cateItems = (List<CateItem>) request.getAttribute("cateItems");
%>
<div class="con list-box">
	<h1 class="mainment">카테고리 리스트</h1>
	<div class="frame">
		<div class="table-box category">
			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>등록날짜</th>
						<th>이름</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (CateItem cateItem : cateItems) {
					%>
					<tr>
						<td><%=cateItem.getId()%></td>
						<td><%=cateItem.getRegDate()%></td>
						<td><a
							href="../article/list?cateItemId=<%=cateItem.getId()%>&page=1"><%=cateItem.getName()%></a></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
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
</div>
<%@ include file="/jsp/part/foot.jspf"%>
