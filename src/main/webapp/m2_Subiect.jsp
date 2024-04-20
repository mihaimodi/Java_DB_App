<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="style.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modificare subiect</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<br />
	<%
	jb.connect();
	int aux = java.lang.Integer.parseInt(request.getParameter("idsubiect"));
	String Materie = request.getParameter("Nume");
	String Dificultate = request.getParameter("Prenume");
	String Clasa = request.getParameter("Clasa");
	String[] valori = { Materie, Dificultate, Clasa };
	String[] campuri = { "Materie", "Dificultate", "Clasa" };
	jb.modificaTabela("subiecte", "idsubiect", aux, campuri, valori);
	jb.disconnect();
	%>
	<h1 align="center">Subiectul a fost modificat cu succes !</h1>
	<p align="center">
		<a href="index.html"><button>Home</button></a> <a
			href="tabela_Subiecte.jsp"><button>Tabela subiecte</button></a>
	</p>
</html>