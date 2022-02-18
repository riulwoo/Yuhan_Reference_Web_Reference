<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<%-- info.jsp는 bootstrap.min.css 와 table.css를 사용한다. --%>
<link href="css/bootstrap.min.css" type="text/css" rel = "stylesheet">
<link href="css/table.css" type="text/css" rel = "stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.asd {
	max-width: 100px;
	min-width: 300px;
	}
	
	.col-lg-3 {
		max-width:300px;
	}
</style>
</head>
<body>
<% 
String master = (String)session.getAttribute("MLoginID");
String student = (String)session.getAttribute("LoginID");
if(master==null && student==null)
{
%>
   <div class="container asd">
   <div class="column">
      <div class="col-lg-3">
         <div class="list-group mb-4">
            <a class="list-group-item list-group-item-info text-center font-weight-bold"></a>
               <a class="list-group-item list-group-item-action text-center font-weight-bold">
               <br><br><button onclick="location.href='login.jsp'">로그인</button>
               <br><br><br></a>
         </div>
      </div>
     </div> 
<jsp:include page = "category.jsp" flush = "false"/>
</div>       


<%}
else if(master==null)
{ 
%>
   <div class="container" margin-right=20px>
      <div class="column">
         <div class="col-lg-3">
            <div class="list-group mb-4">
               <a class="list-group-item list-group-item-info text-center font-weight-bold">개인 정보</a>
               <a class="list-group-item list-group-item-action text-center font-weight-bold">
               
               학번 : <%= session.getAttribute("StdID") %><br>
               <%= session.getAttribute("Name") %>(<%= session.getAttribute("LoginID") %>)  <br>
               <button onclick="location.href='logout.jsp'">로그아웃</button></a>   
               </a>
            </div>
         </div>
         </div>
<jsp:include page = "category.jsp" flush = "false"/>
</div>
<% 
}
else
{ 
%>
   <div class="container" margin-right=20px>
      <div class="column">
         <div class="col-lg-3">
            <div class="list-group mb-4">
               <a class="list-group-item list-group-item-info text-center font-weight-bold">개인 정보</a>
               <a class="list-group-item list-group-item-action text-center font-weight-bold">
               
               
               <%= session.getAttribute("MName") %>(<%= session.getAttribute("MLoginID") %>)<br>
               <button onclick="location.href='manageform.jsp'">설정</button>   <br>
               <button onclick="location.href='logout.jsp'">로그아웃</button></a>      
            </div>
         </div>      
</div>
<jsp:include page = "category.jsp" flush = "false"/>
</div>
<% 
}
%>
</body>
</html>