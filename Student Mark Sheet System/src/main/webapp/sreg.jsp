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
String name = request.getParameter("name");
String sic = request.getParameter("sic");
String email = request.getParameter("email");
String pass = request.getParameter("password");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","projectiwt", "1234");
	
	String qry = "select * from std where sic ='"+sic+"'";
	String qry1 = "insert into std values('"+name+"','"+sic+"','"+email+"','"+pass+"')";
	Statement smt = con.createStatement();
	ResultSet rs = smt.executeQuery(qry);
	if(rs.next()){
		out.println("<script>alert('SIC is already taken.Plese enter a valid sic.'); window.location='sreg.html';</script>");
	}
	else{
		int i = smt.executeUpdate(qry1);
		if(i>0){
			out.println("<script>alert('Registration successful.'); window.location='slogin.html';</script>");
		}
		else{
		out.println("<script>alert('Registration failed. Please try again.'); window.location='sreg.html';</script>");
		}
	}
	rs.close();
	smt.close();
	con.close();
	
	}catch(Exception e){
		out.println(e);
	} %>
</body>
</html>