<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="style.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Examen</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Examen:</h1>
	<br />
	<%
	jb.connect();
	String NumeElev, PrenumeElev, InitialaTataluiElev, AdresaElev, ScoalaElev, MaterieSubiect, DificultateSubiect,
			NumeExamen, DataExamen;
	int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
	ResultSet rs = jb.intoarceExamenId(aux);
	rs.first();
	
	int id1 = rs.getInt("idelev");
	int id2 = rs.getInt("idsubiect");
	
	NumeElev = rs.getString("NumeElev");
	PrenumeElev = rs.getString("PrenumeElev");
	InitialaTataluiElev = rs.getString("InitialaTataluiElev");
	AdresaElev = rs.getString("AdresaElev");
	ScoalaElev = rs.getString("ScoalaElev");
	int ClasaElev = rs.getInt("ClasaElev");
	MaterieSubiect = rs.getString("MaterieSubiect");
	DificultateSubiect = rs.getString("DificultateSubiect");
	int ClasaSubiect = rs.getInt("ClasaSubiect");

	NumeExamen = rs.getString("NumeExamen");
	double NotaExamen = rs.getDouble("NotaExamen");
	DataExamen = rs.getString("DataExamen");

	ResultSet rs1 = jb.vedeTabela("elevi");
	ResultSet rs2 = jb.vedeTabela("subiecte");
	int idsubiect, idelev;
	%>
	<form action="m2_Examen.jsp" method="post">
		<table align="center">
			<tr>
				<td align="right">IdExamen:</td>
				<td><input type="text" name="idexamen" size="30"
					value="<%=aux%>" readonly /></td>
			</tr>
			<tr>
				<td align="right">idelev:</td>
				<td><SELECT NAME="idelev">
						<%
						while (rs1.next()) {
							idelev = rs1.getInt("idelev");
							NumeElev = rs1.getString("Nume");
							PrenumeElev = rs1.getString("Prenume");
							InitialaTataluiElev = rs1.getString("InitialaTatalui");
							AdresaElev = rs1.getString("Adresa");
							ScoalaElev = rs1.getString("Scoala");
							ClasaElev = rs1.getInt("Clasa");
							if (idelev != id1) {
						%>
						<OPTION VALUE="<%=idelev%>"><%=idelev%>,
							<%=NumeElev%>,
							<%=PrenumeElev%>,
							<%=InitialaTataluiElev%>,
							<%=AdresaElev%>,
							<%=ScoalaElev%>,
							<%=ClasaElev%></OPTION>
						<%
						} else {
						%>
						<OPTION selected="yes" VALUE="<%=idelev%>"><%=idelev%>,
							<%=NumeElev%>,
							<%=PrenumeElev%>,
							<%=InitialaTataluiElev%>,
							<%=AdresaElev%>,
							<%=ScoalaElev%>,
							<%=ClasaElev%></OPTION>
						<%
						}
						}
						%>
				</SELECT></td>
			</tr>
			<tr>
				<td align="right">idsubiect:</td>
				<td><SELECT NAME="idsubiect">
						<%
						while (rs2.next()) {
							idsubiect = rs2.getInt("idsubiect");
							MaterieSubiect = rs2.getString("Materie");
							DificultateSubiect = rs2.getString("Dificultate");
							if (idsubiect != id2) {
						%>
						<OPTION VALUE="<%=idsubiect%>"><%=idsubiect%>,
							<%=MaterieSubiect%>,
							<%=DificultateSubiect%>,
							<%=ClasaSubiect%></OPTION>
						<%
						} else {
						%>
						<OPTION selected="yes" VALUE="<%=idsubiect%>"><%=idsubiect%>,
							<%=MaterieSubiect%>,
							<%=DificultateSubiect%>,
							<%=ClasaSubiect%>
							</OPTION>
						<%
						}
						}
						%>
				</SELECT></td>
			</tr>
			<tr>
				<td align="right">Nume Examen:</td>
				<td><input type="text" name="NumeExamen" size="30" value="<%=NumeExamen%>"/></td>
			</tr>
			<tr>
				<td align="right">Nota Examen:</td>
				<td><input type="text" name="NotaExamen" size="30" value="<%=NotaExamen%>"/></td>
			</tr>
			<tr>
				<td align="right">Data Examen:</td>
				<td><input type="text" name="DataExamen" size="30" value="<%=DataExamen%>"/></td>
			</tr>
		</table>
		<p align="center">
			<button> Modifica linia</button>
		</p>
	</form>
	<p align="center">
		<a href="index.html"><button> Home </button></a> <br />
</body>
<%
rs.close();
rs1.close();
rs2.close();
jb.disconnect();
%>
</html>