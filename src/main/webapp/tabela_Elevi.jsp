<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<link rel="stylesheet" type="text/css" href="style.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Elevi</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1>Tabela Elevi</h1>


	<div class="action-buttons">
		<a href="nou_Elev.jsp"><button class="add-button">Adaugă Elev</button></a>
		<p></p>
		<form action="m1_Elev.jsp" method="post">
			<button class="edit-button">Modifică Elev Selectat</button>
			<table>
				<thead>
					<tr>
						<th>Mark</th>
						<th>IdElev</th>
						<th>Nume</th>
						<th>Prenume</th>
						<th>Initiala Tatalui</th>
						<th>Adresa</th>
						<th>Scoala</th>
						<th>Clasa</th>
						<th>Acțiuni</th>
					</tr>
				</thead>
				<tbody>
					<%
					jb.connect();
					ResultSet rs = jb.vedeTabela("elevi");
					long x;
					while (rs.next()) {
						x = rs.getInt("idelev");
					%>
					<tr>
						<td><input type="checkbox" name="primarykey" value="<%=x%>" /></td>
						<td><%=x%></td>
						<td><%=rs.getString("Nume")%></td>
						<td><%=rs.getString("Prenume")%></td>
						<td><%=rs.getString("InitialaTatalui")%></td>
						<td><%=rs.getString("Adresa")%></td>
						<td><%=rs.getString("Scoala")%></td>
						<td><%=rs.getString("Clasa")%></td>
						<td><a href="sterge_Elev.jsp?primarykey=<%=x%>"><button class="delete-button" type="button" name="primarykey" value="<%=x%>">Șterge Elev</button></a></td>
					</tr>
					<%
					}
					rs.close();
					jb.disconnect();
					%>
				</tbody>
			</table>
		</form>
	</div>



	<div style="text-align: center;">
		<a href="index.html"><button>Home</button></a>
	</div>

</body>
</html>