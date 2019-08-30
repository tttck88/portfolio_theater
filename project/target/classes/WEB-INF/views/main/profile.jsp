<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>프로필 - 택택극장</title>
<!-- Bootstrap core CSS -->
<%-- <link href="<%=KPath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> --%>
<!-- Custom styles for this template -->
<link href="<%=KPath%>/css/small-business.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	body {background-color: #e9e7e8;}	
	a:link { color: black; text-decoration: none;}	
	a:visited { color: black; text-decoration: none;}
	a:hover { color: black; text-decoration: none; font-weight: bold;}
	
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
<!-- Page Content -->
<div class="container" style="background-color: white;padding-top: 20px;margin-top: 40px;margin-bottom: 40px;padding-bottom: 20px;" id="bigDiv">
  <!-- Heading Row -->
  <div class="row">
    <div class="col-lg-5" style="height: 140%">
      <img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/img/프로필2.jpg"
										alt="service thumb" style="height:100%; width:100%">
    </div>
    <!-- /.col-lg-8 -->
    <div class="col-lg-6">
      <h1 style="font-weight: 700;">프로필</h1>
      <br>
      <ul>
      	<li><strong>이름</strong> 한정택</li>
      	<li><strong>전화번호</strong> 010 8884 0249</li>
      	<li><strong>Email</strong> tttck88@gmail.com</li>
      	<li><strong>개인블로그</strong> https://tttck88.tistory.com</li>
      </ul><br>
    	<div style="height:329px">
    		스물여덟 늦은 나이에 시작해 어린 동기들과 전공자 친구들에게 뒤처지는 것에 대한 걱정이 컸습니다.<br>
    		이에 매일 새벽 두 시까지 공부하고 일곱 시에 일어나 인천과 신촌을 오가는 길에 유튜브와 책을 보며 공부하였고 세 번에 프로젝트 동안 어려운 역할을 자처해 하나라도 더 경험하고 배우기 위해 노력하였습니다.<br>
    		이런 노력 때문인지 프로그래밍 분야에서의 자신감과 흥미는 점점 커졌고 수료 후에는 기본적인 네트워크 지식을 위한 네트워크 관리사 자격증 필기를 준비하며 공부했고 현재는 실기시험을 준비하고 있습니다.<br>
    		또한, VMware를 통한 가상운영체제 생성을 통해 리눅스 서버에 관한 공부를 하며 운영체제에 관한 공부를 하였고 내년 방통대 3학년 편입을 위한 학점은행제를 진행 중입니다.<br>
    		스물아흡이라는 늦은 나이까지 유의미한 결과를 보지 못했다 생각했던 이십 대였지만 그 경험들로 인해 저 자신에게 엄격한 사람이 되게 하였고 이는 개발자로 일하는 데에 큰 자산이 될 것입니다.<br>
    		믿고 채용해주신다면 최선을 다해 제 업무를 수행하겠습니다.
    	</div><br>
    </div>
    <!-- /.col-md-4 -->
  </div>
  <!-- /.row -->
  <!-- Content Row -->
  <div class="my-5">
	<ul class="nav nav-tabs">
	  <li class="nav-item">
	    <a class="nav-link active" data-toggle="tab" href="#qwe">포트폴리오 소개</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" data-toggle="tab" href="#asd">스킬셋</a>
	  </li>
	</ul>
	
	<div class="tab-content border border-top-0">
	  <div class="tab-pane fade show active" id="qwe">
	  <br>
	    <div style="padding-left: 20px;">
			제목 - 택택극장 <br>
			기간 - 19.06~19.08 <br>
			인원 - 개인프로젝트 <br>
			기획의도 - 실제에서 서비스가 가능한 수준의 영화예매를 목적으로 한 극장사이트 <br> <br>
			
			0. 웹호스팅 <br>
			- AWS(아마존 웹서비스)의 EC2를 활용한 Ubuntu 인스턴스 생성 <br>
			- 윈도우에서 ssh접근을 위해 Xshell 그리고 Putty를 사용했으며 WinSCP를 통해 파일전송을 하였습니다. <br>
			- 오라클, Jdk, 아파치톰캣 설치 후 Git을 통한 프로젝트 배포 <br>
			- Route53을 통한 도메인 연결 <br> <br>
			
			1. 회원가입 및 로그인 <br>
			- 스프링 시큐리티를 이용 경로에 따른 권한 설정(비회원, 회원, 관리자)과 회원가입, 로그인에서의 암호화 및 복호화를 사용 <br>
			- Validatior 인터페이스를 구현한 클래스를 이용 프론트엔드에서 뿐만이 아니라 백엔드에서도 유효성 검사를 하여 보안수준을 높였습니다. <br>
			- 백엔드에서 유효성 검사에 통과하지 못할 경우 message.properties에 설정해둔 에러코드를 화면에 출력하도록 하였습니다 <br>
			- 비밀번호 찾기를 위해 이메일 인증이 통과된 경우 해당 계정에 임의로 패스워드를 설정하여 구글 SMTP를 통한 이메일전송이 가능하게 하였습니다. <br> <br>
			
			2. 게시판 <br>
			- CRUD가 기본적으로 가능하고 페이징 처리 및 검색을 할 수 있는 게시판 구축 <br>
			- 썸머노트 에디터API 사용을 통한 내용 작성 및 이미지 업로드가 가능하게 하였습니다. <br>
			- REST 방식을통해 댓글 자원에 대한 접근이 가능하게 하였습니다. <br>
			- 계층형 설계를 통해서 대댓글이 가능하도록 하였습니다. <br>
			- 댓글수와 조회수에서 트랜잭션 처리를 했습니다. <br> <br>
			
			3. 예매시스템 <br>
			- 현재 내가 선택한 항목에 따른 페이지 구성을 위해 Ajax를 적극적으로 활용 <br>
			- 각 테이블(영화, 극장, 상영관, 스케줄, 예매, 사용자)관계에 따른 예매 데이터의 생성과 예매현황 파악을 위한 다중서브쿼리를 활용 <br> <br>
			
			4. 결제 <br>
			- 아임포트 결제 API를 사용하여 카드와 카카오페이가 가능한 결제시스템 구축(사업자 번호가 없는 포트폴리오 용도이기에 자정 12시에 자동결제 취소가 됩니다.) <br> <br>
			
			어려웠던 점<br>
			- 배포를 하니 한글데이터들이 깨지는 현상을 발견하였습니다. <br>
			기존개발환경에서는 깨지는 현상이 발생하지 않았기에 우분투 개발환경에서의 문제라고 파악되어 locale을 통한 언어 확인 후 KO_KR.EUC-KR로 바꾸었지만 계속해서 문제가 발생하는 것을 확인하였습니다. <br>
			그래서 우분투 오라클 내에 데이터를 출력해보니 한글 문자가 깨진 채 출력되는 것을 확인하여 sys.props$ 문자 셋을 확인해보았는데 AL32UTF8로 이상이 없다는 것을 확인 후 <br>
			데이터 import 부분에서 문제가 생긴다 파악되어 관련 정보 확인 후 ALTER DATABASE CHARACTER SET AL32UTF8; 명령어를 통해 DB문자셋을 변경 후에 다시 import를 하고 DB를 재구동하니 한글출력이 제대로 되는 것을 확인할 수 있었습니다. <br>
			이는 기존개발환경에서의 DB문자셋과 우분투 서버에서의 문자셋의 차이로 인해 임포트시 문자가 깨지는 현상이 발생한 거였습니다. <br>
			이클립스 개발환경에서 뿐만이 아닌 DB에서의 문자셋에 대한 관심도 가져야겠다는 생각을 하게 됐습니다. <br> <br>
			
			아쉬웠던 점  <br>
			- 로그인 및 회원가입에서는 프론트엔드뿐만이 아닌 Validatior 인터페이스를 통한 백엔드에서의 유효성 검사를 구축하였지만, 게시판 및 예매 부분 백엔드에서는 유효성 검사 부분을 진행하지 못했습니다. <br>
			단순 스크립트 내에서의 유효성 검사는 개발자 도구값 변조를 통한 검증코드 회피가 가능하기에 해당 부분이 아쉽고 앞으로 프로젝트 진행 시에는 서버에서 유효성 검사를 하고 프론트엔드에서는 단순 오류 코드 출력만을 하는 방향으로 진행할 것입니다.
		</div>
	  <br><br><br>
	  </div>
	  <div class="tab-pane fade" id="asd">
	  <br>
	  	<div style="padding-left: 20px;">
	  		언어	- Java, JavaScript HTML, CSS<br>
			플랫폼 - Linux, Ubuntu<br>
			서버/프레임워크 - Apache, Spring<br>
			웹 라이브러리 - Bootstrap<br>
			API - Iamport API(결제), Kakao Pay API(결제), Summer note API(에디터), Kakao Map API(지도), Google Login API(로그인)<br>
			DB - OracleDB, MariaDB<br>
			프로토콜 - TCP/IP, Web Socket<br>
			웹 표준 기술 - HTML5, CSS, Javascript, JQuery, Ajax<br><br>
			
			기타 <br>
			- AWS(아마존 웹서비스) EC2 그리고 Route53을 활용한 웹호스팅<br>
			- Git bash 및 Git hub을 통한 버전 관리<br>
			- Fiddler를 통한 디버깅<br>
			- VMware를 활용한 가상운영체제 생성<br>
			- WinSCP를 통한 파일전송<br>
			- Xshell및 Putty 사용을 통한 SSH접근
		</div>
		<br><br><br>
	  </div>
	</div>
  </div>
<script>

</script>
</div>
<%@ include file="/WEB-INF/views/main/footer.jsp"%>
<!-- Bootstrap core JavaScript -->
<script src="<%=KPath%>/vendor/jquery/jquery.slim.min.js"></script>
<script src="<%=KPath%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>