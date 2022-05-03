<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래 게시판</title>
<style>
#content {
	width: 100%;
	height: 783px;
}

.left {
	height: inherit;
	width: 15%;
	float: left;
	width: 15%;
}

.center {
	height: inherit;
	width: 50%;
	float: left;
	margin-left: 200px;
}

h3 {
	color: #10412C;
}

.btn {
	border: 1px solid #10412C;
	background-color: #10412C;
	color: white;
	border-radius: 5px;
	padding: 5px 10px;
	font-size: 13px;
	font-weight: bold;
	margin-right: 5px;
}

/* .right {
	width: 20%;
	float: left;
} */
</style>
</head>

<body>
	<!-- header  -->
	<jsp:include page="../common/menuBar.jsp"></jsp:include>
	<!-- contents -->
	<div id="content">
		<!-- sidemenu -->
		<div class="left">
			<jsp:include page="../common/sideBMenu.jsp"></jsp:include>
		</div>
		<div class="center">
			<h3 id="b-title">중고거래 게시판</h3>
			<br>
			<div>
				<button class="btn" onclick="location.href='/market/registerView'">글쓰기</button>
			</div>
			<br>
			<table width="600px" border="1">
				<tr>
					<th>번호</th>
					<th>구분</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:forEach items="${mList }" var="market">
					<tr>
						<td>${market.marketNo }</td>
						<td align="center"><c:if test="${market.marketType eq 'S' }">팝니다</c:if>
							<c:if test="${market.marketType eq 'B'}">삽니다</c:if></td>
						<c:url var="mDetail" value="/market/detail">
							<c:param name="marketNo" value="${market.marketNo}"></c:param>
						</c:url>
						<td><a href="${mDetail}">${market.marketTitle }</a></td>
						<td>${market.marketWriter }</td>
						<td>${market.marketDate }</td>
						<td>${market.marketCount }</td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<!-- 게시글 검색 -->
			<div>
				<form action="/market/list" method="get">
					<select name="searchCondition">
						<option value="all">전체</option>
						<option value="title">제목</option>
						<option value="contents">내용</option>
						<option value="writer">작성자</option>
					</select> <input type="text" name="searchValue"> <input class="btn"
						type="submit" value="검색">
				</form>
			</div>
			<br>
			<!-- 페이지 -->
			<div>
				<c:if test="${pi.startNavi !=1 }">

					<a href="/market/list?page=${pi.startNavi-1}">
						<button>이전</button>
					</a>

				</c:if>


				<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
					<%-- <c:url var="pagination" value="/market/list">
					<c:param name="page" value="${p }"></c:param>
				</c:url> --%>

					<c:if test="${empty pageInfo.searchValue }">
						<c:url var="pagination" value="/market/list">
							<c:param name="page" value="${p }"></c:param>
						</c:url>
					</c:if>
					<c:if test="${not empty pageInfo.searchValue }">
						<c:url var="pagination"
							value="/market/list?searchCondition=${pageInfo.searchCondition}&searchValue=${pageInfo.searchValue}">
							<c:param name="page" value="${p }"></c:param>
						</c:url>
					</c:if>


					<a href="${pagination }">${p }</a>&nbsp;
			</c:forEach>
				<c:if test="${pi.next && pi.endNavi > 0}">

					<a href="/market/list?page=${pi.endNavi+1}">
						<button>다음</button>
					</a>

				</c:if>

			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>