<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질의응답게시판 상세페이지</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="/resources/contents.css">
<style>
.c-main {
	border: 1px solid #ccc;
	border-radius: 5px;
	width: 600px;
	padding: 30px 30px 30px 30px;
}

/* 댓글 */
#rQuestionWriter {
	width: 80%;
	float: left;
}

#rQuestionDate {
	width: 20%;
	float: left;
}

#rQuestionContent {
	width: 80%;
	float: left;
}
</style>
</head>

<body>
	<!-- header  -->
	<jsp:include page="../common/menuBar.jsp"></jsp:include>
	<!-- contents -->
	<div id="content">
		<div id="left">
			<jsp:include page="../common/sideBMenu.jsp"></jsp:include>
		</div>
		<!-- contents-main -->
		<div id="center">
			<h3 id="b-title">질의응답 게시판</h3>
			<br>
			<div>
				<c:url var="qModify" value="/question/modifyView">
					<c:param name="questionNo" value="${question.questionNo }"></c:param>
				</c:url>
				<button class="btn" onclick="location.href='${qModify }'">수정</button>
				<c:url var="qDelete" value="/question/delete">
					<c:param name="questionNo" value="${question.questionNo }"></c:param>
				</c:url>
				<button class="btn" onclick="location.href='${qDelete }'">삭제</button>
				<button class="btn" onclick="location.href='/question/list'">목록</button>
			</div>
			<br>
			<div class="c-main">
				<div class="title">[${question.professorName }교수 _
					${question.lectureName }] ${question.questionTitle }</div>
				<br>
				<div>${question.questionWriter }${question.questionDate }</div>

				<hr style="width: 585px; text-align: center;">
				<div class="content" style="padding: 10px;">
					${question.questionContent }
					<c:if test="${not empty question.questionFileReNeme }">
						<br>
						<span> <img
							src="/resources/questionUploadFiles/${question.questionFileReNeme }"
							style="width: 500px;">
						</span>
					</c:if>
				</div>
				<br> 댓글
				<hr style="width: 585px; text-align: center;">
				<!-- 댓글 입력 -->
				<div>
					<input type="hidden" id="questionNo"
						value="${question.questionNo }">
					<textarea rows="3" cols="70" id="rContents"></textarea>
					<button class="btn" id="rbtn">등록</button>
				</div>
				<hr style="width: 585px; text-align: center;">
				<!-- 댓글 조회 -->
				<div id="replyArea">
					<table align="center" width="600px" id="rtb">
						<thead>
						</thead>
						<tbody>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>


	<!-- 댓글동작  -->
	<script>
		getQuestionReplyList(); //페이지가 로드 시 함수 동작
		$("#rbtn").on("click", function() {
			var questionNo = $("#questionNo").val(); /* 어떤 게시글에 대한 댓글인지 알기 위함 */
			var rContents = $("#rContents").val();
			$.ajax({
				url : "/question/replyAdd",
				type : "post",
				data : {
					"questionNo" : questionNo,
					"questionReplyContent" : rContents
				}, //json형태
				success : function(data) {
					getQuestionReplyList();
					//성공시 작성된 내용 초기화
					$("#rContents").val("");
				},
				error : function(data) {
					alert("ajax 실패")
				}
			});
		})

		//댓글 불러오는 함수
		function getQuestionReplyList() {
			var questionNo = $("#questionNo").val();
			$.ajax({
				url : "/question/replyList",
				type : "get",
				data : {
					"questionNo" : questionNo
				},
				success : function(data) {
					var $tableBody = $("#rtb tbody");
					$tableBody.html("");
					for (var i = 0; i < data.length; i++) {
						var $tr = $("<tr>");
						var $rWriter = $("<td width='100'>").text(
								data[i].questionReplyWriter);
						var $rContent = $("<td>").text(
								data[i].questionReplyContent);
						var $rDate = $("<td width='100'>").text(
								data[i].questionReplyDate);
						var $btnArea = $("<td width='80'>").append(
								"<a href='javascript:void(0)' onclick='modifyReplyView(this,"
										+ data[i].questionNo + ", "
										+ data[i].questionReplyNo + ", \""
										+ data[i].questionReplyContent
										+ "\");'>수정</a> ").append(
								"<a href='javascript:void(0)' onclick='removeReply("
										+ data[i].questionNo + ","
										+ data[i].questionReplyNo
										+ ");'>삭제</a>");
						$tr.append($rWriter);
						$tr.append($rContent);
						$tr.append($rDate);
						$tr.append($btnArea);
						$tableBody.append($tr);
					}
				},
				error : function() {
					var $tableBody = $("#rtb tbody");
					$tableBody.html(""); //기존댓글 내용 비우기
				}
			});
		}

		/* 댓글 삭제 */
		function removeReply(questionNo, questionReplyNo) {
			$.ajax({
				url : "/question/replyDelete",
				type : "get",
				data : {
					"questionNo" : questionNo,
					"questionReplyNo" : questionReplyNo
				},
				success : function(data) {
					if (data == "success") {
						getQuestionReplyList();
					} else {
						alert("댓글 삭제 실패")
					}
				},
				error : function(data) {
					alert("ajax 실패")
				}
			});
		}

		/* 댓글 수정 */
		function modifyReplyView(obj, questionNo, questionReplyNo,
				questionReplyContent) {
			var $trModify = $("<tr>");
			var $tdModify = $("<td colspan='3'>");
			var $tdModifyBtn = $("<td>");
			$tdModify
					.append("<input type='text' size='50' value='"+questionReplyContent+"' id='modifyData'>");
			$tdModifyBtn.append("<button onclick='modifyReply(" + questionNo
					+ "," + questionReplyNo + ");'>수정완료</button>");
			$trModify.append($tdModify);
			$trModify.append($tdModifyBtn);
			$(obj).parent().parent().after($trModify);
		}

		function modifyReply(questionNo, questionReplyNo) {
			var modifyData = $("#modifyData").val();
			$.ajax({
				url : "/question/replyModify",
				type : "post",
				data : {
					"questionNo" : questionNo,
					"questionReplyNo" : questionReplyNo,
					"questionReplyContent" : modifyData
				},
				success : function(data) {
					if (data == "success") {
						getQuestionReplyList();
					} else {
						alert("댓글 수정 실패")
					}
				},
				error : function(data) {
					alert("ajax 실패")
				}
			});
		}
	</script>
</body>
</html>













