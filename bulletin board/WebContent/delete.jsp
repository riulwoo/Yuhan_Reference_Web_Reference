<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%    
	String[] chk = request.getParameterValues("chk");
    String writer = (String)session.getAttribute("Name"); //로그인 한 사람의 이름
    String type = request.getParameter("kind"); //게시판 종류
    
    if(writer == null){
    	%>
    	<script>
    	alert("로그인 후 이용 가능합니다.");
    	location.href="AI.jsp?kind=type";
    	</script>
    	<%
    }
    else{
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    String sql = null;
    try{
    	String jdbcUrl = "jdbc:mysql://localhost:3306/web_ref_db?useUnicode=yes&characterEncoding=UTF8";
		String dbId = "admin";
		String dbPass = "password";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		for(int i = 0; i < chk.length-1; i++){
		//sql문으로 db에 번호, 제목, 작성자, 종류, 날짜 검색
		sql = "delete from board where title=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, chk[i]);
		pstmt.executeUpdate();
		}

		%>
		<script>
    	location.href="AI.jsp?kind=type";
    	</script>
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
    }
    %>
</body>
</html>