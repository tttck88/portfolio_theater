<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%
	// 경로 /biz 부터 시작  [http://localhost:8080/biz/ @@.do 요청 하기 위해]
	String contextPath = request.getContextPath();
	// theme 까지 들어온 경로 
	String KPath = contextPath + "/resources";
	
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	Object principal = auth.getPrincipal();
	
	String name = "";
	if(principal != null) {
		name = auth.getName();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 - 택택극장</title>
<!-- Bootstrap core CSS -->
<%-- <link href="<%=KPath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> --%>
<!-- Custom styles for this template -->
<link href="<%=KPath%>/css/small-business.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript"></script>
<style>
	body {background-color: #e9e7e8;}	
	a:link { color: white; text-decoration: none;}	
	a:visited { color: white; text-decoration: none;}
	a:hover { color: white; text-decoration: none; font-weight: bold;}
	
	ul{
   list-style:none;
   padding-left:0px;
   }
   
.btn-primary {
	color: #fff;
	background-color: #e50914;
	border-color: #e50914
}

.btn-primary:hover {
	color: #fff;
	background-color: #f40612;
	border-color: #f40612
}

.btn-primary.focus, .btn-primary:focus {
	box-shadow: 0 0 0 .2rem rgba(38, 143, 255, .5)
}

#bigDiv {
box-shadow: 0 0 5px rgba(0,0,0,.2);
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
<!-- Modal -->
<!-- <div class="modal fade" id="exampleModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div> -->
	<div class="container" style="background-color: white;padding-top: 20px;margin-top: 40px;margin-bottom: 40px;padding-bottom: 20px; height: 745px;" id="bigDiv">
			<div style="width: 50%; float:none; margin:0 auto; padding-top: 30px;">
				<h4 style="font-weight: 700; padding-top: 35px;">
					로그인 후 이용하세요.
				</h4><br>
				<label>회원 가입 시 정하신 아이디와 패스워드를 입력하세요.</label><br>
				<label>택택극장이 여러분과 함께 우리 영상 문화의 새로운 패러다임을 만들어 나가겠습니다.</label>
				<h5 style="color: red;">테스트 아이디/패스워드 - test/test</h5>
			</div><br>
		<div style="width: 50%; float:none; margin:0 auto">
			<div>
				<form role="form" method="post" action="/login">
					<div class="form-group">
						<label for="id" style="font-weight: bold;"> 아이디 </label> <input type="text"
							class="form-control" id="id" name="username" placeholder="Enter ID"
							required="required">
					</div>
					<div class="form-group">
						<label for="pw" style="font-weight: bold;"> 패스워드 </label> <input type="password"
							class="form-control" id="pw" name="password"
							placeholder="Enter Password" required="required">
					</div>
					<div>
						<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
						    <font color="red">
						        <p>
						        	<!-- Your login attempt was not successful due to <br/> -->
						            ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
						        </p>
						        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
						    </font>
						</c:if>
					</div>
					<br>
					<button type="submit" class="btn btn-primary btn-block" style="cursor:pointer">
						로그인
					</button>
				</form>		
			<br>	
			<!-- <div>
				<a href="#" class="btn btn-primary btn-block">구글 로그인</a>
			</div> -->
			<br>
			<div>
				<a style="color: black; font-weight: bold;" href="/user/findPassword_view">아이디, 패스워드를 잊으셨나요?</a>
				<!-- <button type="button" class="btn btn-primary" id="modal_show">
			        JQUERY를 이용한 모달 열기
			    </button> -->
			</div>
			<br>
			<div>
				<a href="/user/register2" style="color: black; font-weight: bold;">아직 회원이 아니신가요? 지금 가입하세요.</a>
			</div>
			</div>
		</div>
	</div>
	
    <!-- Modal -->
<%--     <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">아이디,비밀번호 찾기</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
	                <div>
	                	아이디, 패스워드가 기억나지 않거나 로그인에 문제가 있나요?
						아래 입력란에 회원 정보에 기재하신 이메일 주소를 적어주시면 문제 해결 방법을 메일로 보내 드립니다.
	                </div>
					<spring:hasBindErrors name="customUserDetails"/>
					<form:form method="post" commandName="customUserDetails" action="/user/findPassword">
						 <br>
						 <input type="text" name="email" placeholder="이메일을 작성해주세요" value="${customUserDetails.email}">
						 <input type="submit" value="비밀번호찾기" class="btn btn-primary" style="cursor:pointer">
					</form:form>
					
					<div><form:errors path="customUserDetails.email"/><form:errors/></div>
					<div><form:errors path="customUserDetails"/></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="close_modal">닫기</button>
                </div>
            </div>
        </div>
    </div> --%>
    
<%@ include file="/WEB-INF/views/main/footer.jsp"%>
<!-- <script>
    $(document).ready(function() {
        $("#modal_show").click(function() {
            $("#exampleModal").modal("show");
        });

        $("#close_modal").click(function() {
            $("#exampleModal").modal("hide");
        });
    });
</script> -->
<!-- Bootstrap core JavaScript -->
<%-- <script src="<%=KPath%>/vendor/jquery/jquery.slim.min.js"></script> --%>
<script src="<%=KPath%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
