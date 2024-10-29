<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validating...</title>
</head>
<body>
<%
String uid = request.getParameter("uid");
String pass = request.getParameter("pass");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","projectiwt", "1234");
	
	String qry = "select * from admin where uname = ? and password = ?";
	PreparedStatement psmt = con.prepareStatement(qry);
	psmt.setString(1, uid);
    psmt.setString(2, pass);
    ResultSet rs = psmt.executeQuery();
	if(rs.next()){
			session.setAttribute("uname",uid);
			response.sendRedirect("atemp.jsp");
			out.print("Matched");
		}
	else{
		out.println("<script>alert('Invalid credentials. Please try again.'); window.location='alogin.html';</script>");
	}
	rs.close();
	psmt.close();
	con.close();
	
	}catch(Exception e){
		System.out.println(e);
	} %>
</body>
</html>