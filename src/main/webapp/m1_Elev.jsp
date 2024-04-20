<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="style.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Elevi</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Elevi:</h1>
	<br />
	
	<%
	jb.connect();
	int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
	ResultSet rs = jb.intoarceLinieDupaId("elevi", "idelev", aux);
	rs.first();
	String Nume = rs.getString("Nume");
	String Prenume = rs.getString("Prenume");
	String InitialaTatalui = rs.getString("InitialaTatalui");
	String Adresa = rs.getString("Adresa");
	String Scoala = rs.getString("Scoala");
	int Clasa = rs.getInt("Clasa");
	%>
	<form action="m2_Elev.jsp" method="post">
		<table align="center">
			<tr>
				<td align="right">IdElev:</td>
				<td><input type="text" name="idelev" size="30"
					value="<%=aux%>" readonly /></td>
			</tr>
			<tr>
				<td align="right">Nume:</td>
				<td><input type="text" name="Nume" size="30" value="<%=Nume%>" /></td>
			</tr>
			<tr>
				<td align="right">Prenume:</td>
				<td><input type="text" name="Prenume" size="30"
					value="<%=Prenume%>" /></td>
			</tr>
			<tr>
				<td align="right">Initiala Tatalui:</td>
				<td><input type="text" name="InitialaTatalui" size="30"
					value="<%=InitialaTatalui%>" /></td>
			</tr>
			<tr>
				<td align="right">Adresa:</td>
				<td><input type="text" name="Adresa" size="30"
					value="<%=Adresa%>" /></td>
			</tr>
			<tr>
				<td align="right">Scoala:</td>
				<td><input type="text" name="Scoala" size="30"
					value="<%=Scoala%>" /></td>
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