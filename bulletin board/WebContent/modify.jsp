<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="./css/boradwrite_css.css" type="text/css" rel = "stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<meta charset="EUC-KR">
<title>�� ����</title>
</head>
<body>
<jsp:include page = "top.jsp" flush = "false"/>
<form action="writeOK.jsp" method="post" onsubmit="return ContentCheck()" name="write">
	<fieldset>
	</div>
	
	<table class="table">
	<tr><th>����</th><th><p class = "title" id = "title" name = "title" rows= "1" style="font-weight:500">saaaaaa </p>
</th></tr>
	<tr><td>�ۼ���</td><td><p name = "content" >wasd</p></td></tr>
	 
    <tr><td>�� ����</td><td><p name = "content" cols = "80" rows = "20" >jsp �Խ��� ���� ����ý��ϴ�</p></td></tr>
  </table> 
  
 
  </fieldset>
	<button type="submit" class="btn1">���� �� ����</button>
	<button type="button" class="btn1" onclick="javascript:history.back()">���� �� ����</button>
	 <button type="submit" class="btn1">���� �� ���</button>
  </form>
</body>
</html>