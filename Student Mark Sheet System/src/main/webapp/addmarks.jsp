<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
String uname = (String) session.getAttribute("uname");
if (uname == null) {
    response.sendRedirect("alogin.html");
}
else{
	String sic = request.getParameter("sic");
	int cn = Integer.parseInt(request.getParameter("cn"));
	int dmdw = Integer.parseInt(request.getParameter("dmdw"));
	int flat = Integer.parseInt(request.getParameter("flat"));
	int ml = Integer.parseInt(request.getParameter("ml"));
	int mc = Integer.parseInt(request.getParameter("mc"));
	int uhvpe = Integer.parseInt(request.getParameter("uhvpe"));
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","projectiwt", "1234");
		
		String qry = "insert into smarks values('"+sic+"',"+cn+","+dmdw+","+flat+","+ml+","+mc+","+uhvpe+")";
		Statement smt = con.createStatement();
		int i = smt.executeUpdate(qry);
		if(i>0){
			out.println("<script>alert('Marks added successfully.'); window.location='smarks.jsp?sic="+sic+"';</script>");
		}
		else{
			out.println("<script>alert('Marks could not added.'); window.location='atemp.jsp';</script>");
		}
	}catch(Exception e){
		out.println(e);
	}
} %>