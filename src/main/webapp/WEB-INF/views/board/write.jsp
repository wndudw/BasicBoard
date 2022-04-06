<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 작성</title>
</head>
<body>
<div id="nav">
 <%@ include file="../include/nav.jsp" %>
</div>

<c:if test="${msg!='로그인 실패'}">
<form method="post">

<label>제목</label>
<input type="text" name="title" /><br />

<label>작성자</label>
<input type="text" name="writer" value="${member.userId}" readonly="readonly"/><br />

<label>내용</label>
<textarea cols="50" rows="5" name="content"></textarea><br />

<button type="submit">작성</button>

</form>
</c:if>

<c:if test="${msg=='로그인 실패'}">
	<p>로그인을 하셔야 글을 작성할 수 있습니다.</p>
	
	<p><a href="/">홈으로</a></p>
</c:if>
</body>
</html>