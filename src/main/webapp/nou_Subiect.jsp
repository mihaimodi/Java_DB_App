<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="style.css">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Adauga Subiect</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
    <%
    String errorMessage = null;
    
    String Materie = request.getParameter("Materie");
    if(Materie == null || Materie.isEmpty() || !Materie.matches("[a-zA-Z 0-9]+\\.?")){
        errorMessage = "Introduceti o materie valida";
    }
    String Dificultate = request.getParameter("Dificultate");
    if(Dificultate == null || Dificultate.isEmpty() || !Dificultate.matches("[a-zA-Z 0-9]+\\.?")){
        errorMessage = "Introduceti o dificultate valida";
    }
    int Clasa = 0;
    if (request.getParameter("Clasa") != null) {
        try {
            Clasa = Integer.parseInt(request.getParameter("Clasa"));
            if (Clasa < 1 || Clasa > 12) {
                errorMessage = "Clasa trebuie să fie între 1 și 12.";
            }
        } catch (NumberFormatException e) {
            errorMessage = "Introduceți un număr valid pentru clasa.";
        }
    }
    
    if (errorMessage==null) {
        jb.connect();
        jb.adaugaSubiect(Materie, Dificultate, Clasa);
        jb.disconnect();
    %>
    <br />
    <h1 align="center">Subiectul a fost adaugat cu succes !</h1>
    <p align="center">
        <a href="index.html"><button>Home</button></a>
        <a href="tabela_Subiecte.jsp"><button>Tabela subiecte</button></a>
    </p>
    <br />
    <%
    } else {
    %>
    <h1>Suntem in tabela Subiecte.</h1>
    <%
    if(errorMessage != null) {
    %>
    <p style="color: red;"><%= errorMessage %></p>
    <%
    }
    %>
    
    <form action="nou_Subiect.jsp" method="post">
        <table>
            <tr>
                <td align="right">Materie Subiect:</td>
                <td><input type="text" name="Materie" size="40" /></td>
            </tr>
            <tr>
                <td align="right">Dificultate Subiect:</td>
                <td><input type="text" name="Dificultate" size="30" /></td>
            </tr>
            <tr>
                <td align="right">Clasa:</td>
                <td><input type="text" name="Clasa" size="30" /></td>
            </tr>
        </table>
        <center>
            <button> Adauga Subiect </button>
        </center>
    </form>
    
    <br />
    
    <center> <a href = index.html><button> Home </button></a> </center>
   <%
    }
    %>
</body>
</html>