<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="style.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modificare elev</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<br />
	<%
	jb.connect();
	int aux = java.lang.Integer.parseInt(request.getParameter("idelev"));
	String Nume = request.getParameter("Nume");
	String Prenume = request.getParameter("Prenume");
	String InitialaTatalui = request.getParameter("InitialaTatalui");
	String Adresa = request.getParameter("Adresa");
	String Scoala = request.getParameter("Scoala");
	String Clasa = request.getParameter("Clasa");
	String[] valori = { Nume, Prenume, InitialaTatalui, Adresa, Scoala, Clasa};
	String[] campuri = { "Nume", "Prenume", "InitialaTatalui", "Adresa", "Scoala", "Clasa" };
	jb.modificaTabela("elevi", "idelev", aux, campuri, valori);
	jb.disconnect();
	%>
	<h1 align="center">Elevul a fost modificat cu succes !</h1>
	<p align="center">
		<a href="index.html"><button>Home</button></a>
		<a href="tabela_Elevi.jsp"><button>Tabela elevi</button></a>
	</p>
</html>