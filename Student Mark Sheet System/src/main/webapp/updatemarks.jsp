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
		
		String qry = "update smarks set cn=?,dmdw=?,flat=?,ml=?,mc=?,uhvpe=? where sic=?";
		PreparedStatement psmt = con.prepareStatement(qry);
		psmt.setInt(1, cn);
		psmt.setInt(2, dmdw);
		psmt.setInt(3, flat);
		psmt.setInt(4, ml);
		psmt.setInt(5, mc);
		psmt.setInt(6, uhvpe);
		psmt.setString(7, sic);
		int i = psmt.executeUpdate();
		if(i>0){
			out.println("<script>alert('Marks updated successfully.'); window.location='smarks.jsp?sic="+sic+"';</script>");
		}
		else{
			out.println("<script>alert('Update failed.'); window.location='smarks.jsp';</script>");
		}
	}catch(Exception e){
		out.println(e);
	}
} %>