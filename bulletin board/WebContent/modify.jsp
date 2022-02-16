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
<%
String b_title = null; //�Խñ� ����
String b_writer = null; //�ۼ���
String b_content = null; //�Խñ� ����

String id = request.getParameter("id");
String type = request.getParameter("type");
String name = (String)session.getAttribute("Name");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	String jdbcUrl = "jdbc:mysql://localhost:3306/web_ref_db?useUnicode=yes&characterEncoding=UTF8";
	String dbId = "admin";
	String dbPass = "password";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	
	//sql������ db�� ��ȣ, ����, �ۼ���, ����, ��¥ �˻�
	String sql = "select title, writer, wrcontent from board where boardid=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	
	//������ ��� ���ڵ带 ������ �Է�
	while(rs.next()){
		b_title = rs.getString("title");
		b_writer = (String)rs.getString("writer");
		b_content = rs.getString("wrcontent");
	}

%>
<jsp:include page = "top2.jsp" flush = "false"/>
<form action="boardwrite.jsp" method="post">
	<fieldset>
	
	<table class="table">
	<tr><th>����</th><th><p rows= "1" style="font-weight:500"><%=b_title%></p>
</th></tr>
	<tr><td>�ۼ���</td><td><p><%=b_writer%></p></td></tr>
	 
    <tr><td>�� ����</td><td><p cols = "80" rows = "20" ><%=b_content%></p></td></tr>
  </table>
	<input type="hidden" value="<%=id%>" name="title">
  </fieldset>

	 <button type="submit" class="btn1">���� �� ����</button>
	 <button type="button" class="btn1" onclick="NewFile.jsp?kind=<%=type%>&chk=<%=id%>">���� �� ����</button>
	 <button type="button" class="btn1" onclick="javascript:history.back()">���� �� ���</button>
	 <%
}catch(SQLException ex){
	ex.printStackTrace();
} finally {
	if (pstmt != null)
	try {
		pstmt.close();
	} catch (SQLException sqle) {
	}

	if (conn != null)
	try {
		conn.close();
	} catch (SQLException sqle) {
	}
	}
  %>
</form>
</body>
</html>