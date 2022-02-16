<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//boardwrite.jsp에서 POST로 받아온 값
String kind = request.getParameter("kind");
String title = request.getParameter("title");
String content = request.getParameter("content");
String name = (String)session.getAttribute("Name");
Timestamp register = new Timestamp(System.currentTimeMillis());

//DB연결
Connection conn = null;
PreparedStatement pstmt = null;
String str = "";
String prnM = null;
try{
	String jdbcUrl = "jdbc:mysql://localhost:3306/web_ref_db?useUnicode=yes&characterEncoding=UTF8";
	String dbId = "admin";
	String dbPass="password";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	
	//SQL문으로 게시글 내용 및 날짜 등 DB에 입력
	String sql = "insert into board(title,boardtype,writer,wrdate,wrcontent) values(?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,title);
	pstmt.setString(2,kind);
	pstmt.setString(3,name);
	pstmt.setTimestamp(4, register);
	pstmt.setString(5,content);
	pstmt.executeUpdate();
	%>
	<script>
	location.href="AI.jsp?kind=<%=kind%>";
	</script>
<%
}finally{
    if(pstmt !=null)
        try{pstmt.close();}catch(SQLException sqle){}

    if(conn !=null)
        try{conn.close();}catch(SQLException sqle){}
}
%>
</body>
</html>