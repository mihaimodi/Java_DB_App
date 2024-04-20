<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<link rel="stylesheet" type="text/css" href="style.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Subiecte</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1>Tabela Subiecte</h1>


	<div class="action-buttons">
		<a href="nou_Subiect.jsp"><button class="add-button">Adaugă
				Subiect</button></a>
		<p></p>
		<form action="m1_Subiect.jsp" method="post">
			<button class="edit-button">Modifică Subiect Selectat</button>
			<table>
				<thead>
					<tr>
						<th>Mark</th>
						<th>IdSubiect</th>
						<th>Materie</th>
						<th>Dificultate</th>
						<th>Clasa</th>
						<th>Acțiuni</th>
					</tr>
				</thead>
				<tbody>
					<%
					jb.connect();
					ResultSet rs = jb.vedeTabela("subiecte");
					long x;
					while (rs.next()) {
						x = rs.getInt("idsubiect");
					%>
					<tr>
						<td><input type="checkbox" name="primarykey" value="<%=x%>" /></td>
						<td><%=x%></td>
						<td><%=rs.getString("Materie")%></td>
						<td><%=rs.getString("Dificultate")%></td>
						<td><%=rs.getString("Clasa")%></td>
						<td><a href="sterge_Subiect.jsp?primarykey=<%=x%>"><button class="delete-button" type="button" name="primarykey" value="<%=x%>">Șterge Subiect</button></a></td>
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