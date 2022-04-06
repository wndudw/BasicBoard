<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
 <title>회원가입</title> 
 
 <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>
<body>

<form role="form" method="post" autocomplete="off">
 <p>
  <label for="userId">아이디</label>
  <input type="text" id="userId" name="userId" />
 
  <button type="button" class="idCheck">아아디 확인</button>
 </p>
 
 <p class="result">
 	<span class="msg">아이디를 확인해주세요.</span>
 </p>  
 <p>
  <label for="userPass">패스워드</label>
  <input type="password" id="userPass" name="userPass" />
 </p>
 <p>
  <label for="userName">닉네임</label>
  <input type="text" id="userName" name="userName" />
 </p>
 <p>
   <button type="submit" id="submit" disabled="disabled">가입</button>  
 </p>
 <p>
  <a href="/">처음으로</a>
 </p>
 
</form>

<script type="text/javascript">
	$(".idCheck").click(function(){
		var query = {userId : $("#userId").val()};

		$.ajax({
			url: "/member/idCheck",
			type: "post",
			data: query,
			success: function(data){
				if(data == 1){
					$(".result .msg").text("사용불가");
					$(".result .msg").attr("style", "color:#f00");

					$("#submit").attr("disabled", true);
					} else{
						$(".result .msg").text("사용가능");
						$(".result .msg").attr("style", "color:#00f");

						$("#submit").attr("disabled", false);
						}
				}
			});
		});

	//아이디확인버튼 누르고 다시 입력할 경우를 대비해 비활성화 해놓음.
	$("#userId").keyup(function(){
		$(".result .msg").text("아이디를 확인해주십시오");
		$(".result .msg").attr("style", "color:#000");

		$("#submit").attr("disabled", true);
		});
</script>
</body>
</html>