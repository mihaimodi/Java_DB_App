<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="style.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Subiecte</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Subiecte:</h1>
	<br />
	
	<%
	jb.connect();
	int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
	ResultSet rs = jb.intoarceLinieDupaId("subiecte", "idsubiect", aux);
	rs.first();
	String Materie = rs.getString("Materie");
	String Dificultate = rs.getString("Dificultate");
	int Clasa = rs.getInt("Clasa");
	%>
	<form action="m2_Subiect.jsp" method="post">
		<table align="center">
			<tr>
				<td align="right">IdSubiect:</td>
				<td><input type="text" name="idsubiect" size="30"
					value="<%=aux%>" readonly /></td>
			</tr>
			<tr>
				<td align="right">Materie:</td>
				<td><input type="text" name="Materie" size="30" value="<%=Materie%>" /></td>
			</tr>
			<tr>
				<td align="right">Dificultate:</td>
				<td><input type="text" name="Dificultate" size="30"
					value="<%=Dificultate%>" /></td>
			</tr>
			<tr>
				<td align="right">Clasa:</td>
				<td><input type="text" name="Clasa" size="30"
					value="<%=Clasa%>" /></td>
			</tr>
			
		</table>
		<p align="center">
			<button> Modifica linia</button>
		</p>
	</form>
	<p align="center">
		<a href="index.html"><button> Home </button></a> <br />
</body>
</html>