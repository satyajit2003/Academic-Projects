<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="shome.css">
<style type="text/css">
button:hover {
	background-color: lightblue;
	color: black;
}
#tbl{
	text-align: center;
}
#atbl{
    border: 1px solid black;
    padding: 10px;
    border-collapse: collapse;
    margin: 10px auto;
    width: 70%;
}
th,td{
	border: 1px solid black;
    padding: 10px;
}
</style>
</head>
<body>
    <header>
        <h1>Admin Dashboard</h1>
    </header>

    <section>
        <div style="text-align: right;">
        	<a href="atemp.jsp">
                <button>Dashboard</button>
            </a>
            <a href="logouttemp.jsp">
                <button id="hb">Log out</button>
            </a>
        </div>

        <div>
            <%
        String uname = (String) session.getAttribute("uname");
        if (uname == null) {
            response.sendRedirect("alogin.html");
        }
        try{
        	Class.forName("oracle.jdbc.driver.OracleDriver");
        	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","projectiwt", "1234");
        	
        	String qry = "select * from std";
        	Statement smt = con.createStatement();
        	ResultSet rs = smt.executeQuery(qry);
    %>
    
    <h1>Welcome, <%= uname %></h1>
        </div>
        <div id="tbl">
        	<h2>All Student Details</h2>
            <table id="atbl">
                <tr>
                    <th>SIC</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Marks</th>
                </tr>
<%while (rs.next()){%>
                <tr>
                    <td><%= rs.getString("sic") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><a href="smarks.jsp?sic=<%= rs.getString("sic") %>">View</a></td>
                </tr><%} %>
            </table>
        </div>
    </section>

    <footer>
        &copy; 2023 Student Marksheet System
    </footer>
</body>
</html>
<%
rs.close();
smt.close();
con.close();
}catch(Exception e){
	out.print(e);
}
%>