<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <%
String uname = (String) session.getAttribute("uname");
if (uname == null) {
    response.sendRedirect("alogin.html");
}
else{
	String sic = request.getParameter("sic");
	int cn,dmdw,flat,ml,mc,uhvpe;
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","projectiwt", "1234");
		
		String qry = "select * from smarks where sic ='"+sic+"'";
		Statement smt = con.createStatement();
		ResultSet rs = smt.executeQuery(qry);
		if(rs.next()){
			cn = rs.getInt("cn");
			dmdw = rs.getInt("dmdw");
			flat = rs.getInt("flat");
			ml = rs.getInt("ml");
			mc = rs.getInt("mc");
			uhvpe = rs.getInt("uhvpe");
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Marks</title>
<link rel="stylesheet" href="shome.css">
<style type="text/css">
button:hover ,#hb:hover{
	background-color: lightblue;
	color: black;
}
.container{
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px black;
    width: 80%; 
    max-width: 400px;
    margin: 50px auto;
}
label{
    display: block;
    margin-bottom: 8px;
}
input{
    width: 100%;
    padding: 8px;
    margin-bottom: 16px;
    box-sizing: border-box;
}
#hb{
    background-color: darkcyan;
    padding: 10px;
    margin: 5px;
    width: 100%;
    font-size: large;
}
</style>
</head>
<body>
    <header>
        <h1>Update Marks</h1>
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
        <div class="container">
            <form method="post" action="updatemarks.jsp">
            	<label for="sic">SIC:</label>
                <input type="text" name="sic" id="sic" value="<%= sic%>" readonly>
                
                <label for="cn">Computer Networks:</label>
                <input type="number" name="cn" id="cn" value="<%= cn %>">
        
                <label for="dmdw">Data Mining and Data Warehousing:</label>
                <input type="number" name="dmdw" id="dmdw" value="<%= dmdw %>">
        
                <label for="flat">Formal Language and Automata Theory:</label>
                <input type="number" name="flat" id="flat" value="<%= flat %>">
        
                <label for="ml">Machine Learning:</label>
                <input type="number" name="ml" id="ml" value="<%= ml %>">
        
                <label for="mc">Mobile Computing:</label>
                <input type="number" name="mc" id="mc" value="<%= mc %>">
        
                <label for="uhvpe">Universal Human Values and Professional Ethics:</label>
                <input type="number" name="uhvpe" id="uhvpe" value="<%= uhvpe %>">
        
                <button type="submit" id="hb">Update</button>
            </form>
        </div>
    </section>
    <footer>
        &copy; 2023 Student Marksheet System
    </footer>
   
</body>
</html>
<%}
		else{
			out.println("<script>alert('Something went wrong.'); window.location='atemp.jsp';</script>");
		}
	}catch(Exception e){
		out.println(e);
	}
}%>