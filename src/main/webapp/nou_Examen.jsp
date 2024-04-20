<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="style.css">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Adauga examen</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
    <%
    String errorMessage = null;
    
    int idelev, idsubiect;
    String id1, id2, NumeElev, PrenumeElev, InitialaTataluiElev, AdresaElev, ScoalaElev, MaterieSubiect, DificultateSubiect, NumeExamen; 
    int ClasaElev;
    id1 = request.getParameter("idelev");
    id2 = request.getParameter("idsubiect");
    NumeExamen = request.getParameter("NumeExamen");
    if(NumeExamen == null || NumeExamen.isEmpty() || !NumeExamen.matches("[a-zA-Z 0-9]+\\.?")){
        errorMessage = "Introduceti un nume valid pentru examen";
    }
    double NotaExamen = -1;
    if (request.getParameter("NotaExamen") != null) {
        try {
            NotaExamen = Double.parseDouble(request.getParameter("NotaExamen"));
            if (NotaExamen < 0 || NotaExamen > 10) {
                errorMessage = "Nota trebuie să fie între 0 și 10.";
            }
        } catch (NumberFormatException e) {
            errorMessage = "Introduceți un număr valid pentru nota.";
        }
    }
    
    if (id1 != null && errorMessage == null) {
        jb.connect();
        jb.adaugaExamen(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), NumeExamen, NotaExamen);
        jb.disconnect();
    %>
    <br />
    <h1 align="center">Examenul a fost adaugat cu succes !</h1>
    <p align="center">
        <a href="index.html"><button>Home</button></a> <a
            href="tabela_Examene.jsp"><button>Tabela examene</button></a>
    </p>
    <br />
    <%
    } else {
    jb.connect();
    ResultSet rs1 = jb.vedeTabela("elevi");
    ResultSet rs2 = jb.vedeTabela("subiecte");
    %>
    <h1>Suntem in tabela Examen.</h1>
    
    <%
    if(errorMessage != null) {
    %>
    <p style="color: red;"><%= errorMessage %></p>
    <%
    }
    %>
    
    <form action="nou_Examen.jsp" method="post">
        <table>
            <tr>
                <td align="right">IdElev:</td>
                <td>Selectati elevul: <SELECT NAME="idelev">
                        <%
                        while (rs1.next()) {
                            idelev = rs1.getInt("idelev");
                            NumeElev = rs1.getString("Nume");
                            PrenumeElev = rs1.getString("Prenume");
                            InitialaTataluiElev = rs1.getString("InitialaTatalui");
                            AdresaElev = rs1.getString("Adresa");
                            ScoalaElev = rs1.getString("Scoala");
                            ClasaElev = rs1.getInt("Clasa");
                        %>
                        <OPTION VALUE="<%=idelev%>"><%=idelev%>,
                            <%=NumeElev%>,
                            <%=PrenumeElev%>,
                            <%=InitialaTataluiElev%>,
                            <%=AdresaElev%>,
                            <%=ScoalaElev%>,
                            <%=ClasaElev%></OPTION>
                        <%
                        }
                        %>
                </SELECT>
                </td>
            </tr>
            <tr>
                <td align="right">IdSubiect:</td>
                <td>Selectati subiectul: <SELECT NAME="idsubiect">
                        <!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                        <%
                        while (rs2.next()) {
                            idsubiect = rs2.getInt("idsubiect");
                            MaterieSubiect = rs2.getString("Materie");
                            DificultateSubiect = rs2.getString("Dificultate");
                        %>
                        <OPTION VALUE="<%=idsubiect%>"><%=idsubiect%>,
                            <%=MaterieSubiect%>,
                            <%=DificultateSubiect%></OPTION>
                        <%
                        }
                        %>
                </SELECT>
                </td>
            </tr>
            <tr>
                <td align="right">Nume Examen:</td>
                <td><input type="text" name="NumeExamen" size="30" /></td>
            </tr>
            <tr>
                <td align="right">Nota Examen:</td>
                <td><input type="text" name="NotaExamen" size="30" /></td>
            </tr>
        </table>
        <center>
            <button>Adauga Examen</button>
        </center>
    </form>
    <%
    }
    %>
    <br />
    <center>
        <a href=index.html><button>Home</button></a>
    </center>
    <br />
</body>
</html>