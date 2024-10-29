<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
String uname = (String) session.getAttribute("uname");
if (uname == null) {
    response.sendRedirect("alogin.html");
}
String sic = request.getParameter("sic");
String name,email;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","projectiwt", "1234");
	
	String qry1 = "select * from std where sic='"+sic+"'";
	String qry2 = "select * from smarks where sic='"+sic+"'";
	Statement smt = con.createStatement();
	ResultSet rs1 = smt.executeQuery(qry1);
	
%>
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
                <button>Log out</button>
            </a>
        </div>
<%
if(rs1.next()){
	name = rs1.getString("name");
	email = rs1.getString("email"); %>
        <div>
    		<h2>Name: <%=name %></h2>
    		<h2>SIC: <%=sic %></h2>
    		<h2>Email: <%=email %></h2>
        </div>
        <%}
else{
	%>
		<div>
			<h2>Student not found.</h2>
		</div>    
	<%
}

ResultSet rs2 = smt.executeQuery(qry2);
if(rs2.next()){
	%>
	<div id="tbl">
        	<h2>Mark Sheet</h2>
            <table id="atbl">
                <tr>
                    <th>Subject</th>
                    <th>Marks</th>
                </tr>
                <tr>
                    <td>Computer Networks</td>
                    <td><%= rs2.getInt("cn") %></td>
                </tr>
                <tr>
                    <td>Data Mining and Data Warehousing</td>
                    <td><%= rs2.getInt("dmdw") %></td>
                </tr>
                <tr>
                    <td>Formal Language and Automata Theory</td>
                    <td><%= rs2.getInt("flat") %></td>
                </tr>
                <tr>
                    <td>Machine Learning</td>
                    <td><%= rs2.getInt("ml") %></td>
                </tr>
                <tr>
                    <td>Mobile Computing</td>
                    <td><%= rs2.getInt("mc") %></td>
                </tr>
                <tr>
                    <td>Universal Human Values and Professional Ethics</td>
                    <td><%= rs2.getInt("uhvpe") %></td>
                </tr>
            </table>
            <a href="updateform.jsp?sic=<%= sic%>">
                <button>Update</button>
            </a>
            <button onclick="deleteConfirm()">Delete</button>
        </div>   
<%
}else{
	%>
	<div>
		<h2>Marks not assigned.</h2>
		<a href="addform.jsp?sic=<%= sic%>"><button>Add Marks</button></a>
	</div>    
<%}
%>
    </section>

    <footer>
        &copy; 2023 Student Marksheet System
    </footer>
    <script>
        function deleteConfirm() {
            if (confirm("Are you sure you want to delete?")) {
                window.location.href = "delete.jsp?sic=<%= sic%>";
            }
        }
    </script>
</body>
</html> 
<%
	
}catch(Exception e){
	out.print(e);
}
%>