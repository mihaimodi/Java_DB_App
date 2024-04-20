<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<link rel="stylesheet" type="text/css" href="style.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Examene</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1>Tabela Examene</h1>

	<div class="action-buttons">
		<a href="nou_Examen.jsp"><button class="add-button">Adaugă
				Examen</button></a>
		<p></p>
		<form action="m1_Examen.jsp" method="post">
			<button class="edit-button">Modifică Examen Selectat</button>
			<table>
				<tr>
					<th>Mark:</th>
					<th>IdExamen:</th>
					<th>IdElev:</th>
					<th>NumeElev:</th>
					<th>PrenumeElev:</th>
					<th>InitialaTataluiElev:</th>
					<th>AdresaElev</th>
					<th>ScoalaElev:</th>
					<th>ClasaElev:</th>
					<th>IdSubiect:</th>
					<th>MaterieSubiect:</th>
					<th>DificultateSubiect:</th>
					<th>NumeExamen:</th>
					<th>NotaExamen:</th>
					<th>DataExamen:</th>
					<th>Actiune:</th>
				</tr>
				<%
				jb.connect();
				ResultSet rs = jb.vedeExamen();
				long x;
				while (rs.next()) {
					x = rs.getInt("idexamen");
				%>
				<tr>
					<td><input type="checkbox" name="primarykey" value="<%=x%>" /></td>
					<td><%=x%></td>
					<td><%=rs.getInt("idelev_examen")%></td>
					<td><%=rs.getString("NumeElev")%></td>
					<td><%=rs.getString("PrenumeElev")%></td>
					<td><%=rs.getString("InitialaTataluiElev")%></td>
					<td><%=rs.getString("AdresaElev")%></td>
					<td><%=rs.getString("ScoalaElev")%></td>
					<td><%=rs.getInt("ClasaElev")%></td>
					<td><%=rs.getInt("idsubiect_examen")%></td>
					<td><%=rs.getString("MaterieSubiect")%></td>
					<td><%=rs.getString("DificultateSubiect")%></td>
					<td><%=rs.getString("NumeExamen")%></td>
					<td><%=rs.getDouble("NotaExamen")%></td>
					<td><%=rs.getDate("DataExamen")%></td>
					<td><a href="sterge_Examen.jsp?primarykey=<%=x%>"><button
								class="delete-button" type="button" name="primarykey"
								value="<%=x%>">Șterge Examen</button></a></td>
					<%
					}
					%>
				</tr>
				<%
				rs.close();
				jb.disconnect();
				%>
			</table>
		</form>
	</div>

	<br />
	<div style="text-align: center;">
		<a href="index.html"><button>Home</button></a>
	</div>
</body>
</html>