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
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<%
		String[] s = request.getParameterValues("primarykey");
		jb.connect();
		jb.stergeDateTabela(s, "examen", "idexamen");
		jb.disconnect();
	%>
	<h1 align="center">Examenul a fost sters cu succes !</h1>
	<p align="center">
		<a href="index.html"><button>Home</button></a>
		<a href="tabela_Examene.jsp"><button>Tabela examene</button></a>
	</p>
</body>
</html>