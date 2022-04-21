<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강개설목록</title>
</head>
<body>
	<h1 align="center">수강개설목록</h1>
	<br><br>
	<table align="center" width="600" border="1">
		<tr>
			<th>과목코드</th>
			<th>교수코드</th>
			<th>단과대학</th>
			<th>개설학과</th>
			<th>강의명</th>
			<th>교수명</th>
			<th>이수구분</th>
			<th>학점</th>
			<th>강의실</th>
			<th>강의인원</th>
			<th>강의시간</th>
		</tr>
		<c:forEach items="${lList }" var="lecture">
			<tr>
				<td>${lecture.lectureNo }</td>
				<td>${lecture.professorNo }</td>
				<td>${lecture.universityCollege }</td>
				<td>${lecture.lectureDepartment }</td>
				<td>${lecture.lectureName }</td>
				<td>${lecture.professorName }</td>
				<td>${lecture.lectureDivision }</td>
				<td>${lecture.lectureGrade }</td>
				<td>${lecture.lectureRoom }</td>
				<td>${lecture.lecturePeople }</td>
				<td>${lecture.lectureTime }</td>
			</tr>		
		</c:forEach>
	</table>
</body>
</html>