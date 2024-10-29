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
String sic = request.getParameter("sic");
String pass = request.getParameter("pass");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","projectiwt", "1234");
	
	String qry = "select * from std where sic = ? and password = ?";
	PreparedStatement psmt = con.prepareStatement(qry);
	psmt.setString(1, sic);
    psmt.setString(2, pass);
    ResultSet rs = psmt.executeQuery();
	if(rs.next()){
			session.setAttribute("sic", sic);
			response.sendRedirect("shome.jsp");
			out.print("Matched");
		}
	else{
		out.println("<script>alert('Invalid credentials. Please try again.'); window.location='slogin.html';</script>");
	}
	rs.close();
	psmt.close();
	con.close();
	
	}catch(Exception e){
		System.out.println(e);
	} %>
</body>
</html>