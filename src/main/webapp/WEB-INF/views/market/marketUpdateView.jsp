<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래 게시판</title>
<script src="https://cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script>
<style>
.left {
	width: 32%;
	float: left;
}

.center {
	width: 50%;
	float: left;
}

.c-main {
	border: 1px solid #ccc;
	border-radius: 5px;
	width: 600px;
	padding: 30px 30px 30px 30px;
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
	<div class="left">1</div>
	<div class="center">
		<form action="/market/update" method="POST"
			enctype="multipart/form-data">
			<input type="hidden" name="marketNo" value="${market.marketNo }">


			<h3 id="b-title">중고거래 게시판</h3>
			<br>
			<div class="c-main">
				<div class="selectBox" style="padding: 10px;">
					<select id="marketType" name="marketType"
						style="border: none; width: 250px;">
						<option value="S">팝니다</option>
						<option value="B">삽니다</option>
					</select>
				</div>
				<div class="title">
					<input type="text" size="50" name="marketTitle"
						style="border: none; padding: 10px;"
						value="${market.marketTitle }">

				</div>
				<hr style="width: 585px; text-align: center;">

				<div>
					상품명 &emsp;<input type="text" size="35" name="marketGoods"
						value="${market.marketGoods }" style="border: none; padding: 10px;">
				</div>
				<div>
					판매가격 <input type="text" size="35" name="marketPrice"
						value="${market.marketPrice }" style="border: none; padding: 10px;">
					원
				</div>


				<div class="content" style="padding: 10px;">
					<textarea rows="20" cols="75" id="marketContent"
						name="marketContent">	${market.marketContent }</textarea>
				</div>


				<hr style="width: 585px; text-align: center;">
				<div align="center" style="padding: 15px;">
					<button class="btn" type="submit">수정</button>
					<button class="btn" type="reset">취소</button>
				</div>
			</div>
		</form>
	</div>


	<script>
	CKEDITOR.replace('marketContent',
			{filebrowserUploadUrl:'/market/imageUpload.kh'
			});
			
			CKEDITOR.on('dialogDefinition', function (ev) {
	            var dialogName = ev.data.name;
	            var dialog = ev.data.definition.dialog;
	            var dialogDefinition = ev.data.definition;
	            if (dialogName == 'image') {
	                dialog.on('show', function (obj) {
	                    this.selectPage('Upload'); //업로드텝으로 시작
	                });
	                dialogDefinition.removeContents('Link'); // 링크탭 제거
	            }
	        });
	</script>
</body>
</html>