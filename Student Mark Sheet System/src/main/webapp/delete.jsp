<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
String uname = (String) session.getAttribute("uname");
if (uname == null) {
    response.sendRedirect("alogin.html");
}
else{
	String sic = request.getParameter("sic");
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","projectiwt", "1234");
		
		String qry1 = "delete from std where sic='"+sic+"'";
		String qry2 = "delete from smarks where sic='"+sic+"'";
		Statement smt = con.createStatement();
		int i = smt.executeUpdate(qry2);
		if(i>0){
			int j = smt.executeUpdate(qry1);
			out.println("<script>alert('Record with SIC " + sic + " deleted successfully.'); window.location='atemp.jsp';</script>");
				
		}
		else{
			out.println("<script>alert('Deletion Failed.'); window.location='atemp.jsp';</script>");
		}
	}catch(Exception e){
		out.println(e);
	}
} %>