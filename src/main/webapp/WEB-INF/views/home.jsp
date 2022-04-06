<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>

<div id="nav">
 <%@ include file="./include/nav.jsp" %>
</div>

<c:if test="${member == null}">
<form role="form" method="post" autocomplete="off" action="/member/login">
	<p>
		<label for="userId">아이디</label>
		<input type="text" id="userId" name="userId"/>
	</p>
	<p>
		<label for="userPwd">패스워드</label>
		<input type="password" id="userPass" name="userPass"/>
	</p>
	<p><button type="submit">로그인</button></p>
	<p><a href="/member/register">회원가입</a></p>
</form>
</c:if>


<c:if test="${msg==false}">
	<p style="color:#f00;">로그인에 실패하셨습니다. 다시 입력하세요.</p>
</c:if>

<c:if test="${member != null}">
	<p>${member.userId}님 환영합니다.</p>
	<a href="member/modify">회원정보 수정</a>, <a href="member/withdrawal">회원탈퇴</a>
	<a href="member/logout">로그아웃</a>	
</c:if>

<hr/>
<p><a href="/board/list">게시물 목록</a></p>
<p><a href="/board/write">게시물 작성</a></p>
<a href="/board/listPage?num=1">글 목록(페이징)</a> 
<a href="/board/listPageSearch?num=1">글 목록(페이징+검색)</a> 

</body>
</html>
