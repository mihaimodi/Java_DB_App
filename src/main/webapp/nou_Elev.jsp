<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="style.css">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Adauga Elev</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
    <%
    String errorMessage = null;
    String Nume = request.getParameter("Nume");
    if(Nume == null || Nume.isEmpty() || !Nume.matches("[a-zA-Z ]+\\.?")){
    	errorMessage = "Introduceti un nume valid";
    }
    String Prenume = request.getParameter("Prenume");
    if(Prenume == null || Prenume.isEmpty() || !Prenume.matches("[a-zA-Z ]+\\.?")){
    	errorMessage = "Introduceti un prenume valid";
    }
    String InitialaTatalui = request.getParameter("InitialaTatalui");
    if(InitialaTatalui == null || InitialaTatalui.isEmpty() || !InitialaTatalui.matches("[a-zA-Z ]+\\.?")){
    	errorMessage = "Introduceti initialele tatalui care sa fie valide";
    }
    String Adresa = request.getParameter("Adresa");
    if(Adresa == null || Adresa.isEmpty()){
    	errorMessage = "Introduceti o adresa valida";
    }
    String Scoala = request.getParameter("Scoala");
    if(Scoala == null || Scoala.isEmpty()){
    	errorMessage = "Introduceti un nume de scoala valid";
    }
    int Clasa = 0;

    if (request.getParameter("Clasa") != null) {
        try {
            Clasa = Integer.parseInt(request.getParameter("Clasa"));
            if (Clasa < 1 || Clasa > 12) {
                errorMessage = "Clasa trebuie să fie între 1 și 12.";
                Clasa = 0; // Setăm clasa la 0 pentru a arăta că a fost o eroare.
            }
        } catch (NumberFormatException e) {
            errorMessage = "Introduceți un număr valid pentru clasa.";
        }
    }

    if (errorMessage == null) {
        jb.connect();
        jb.adaugaElev(Nume, Prenume, InitialaTatalui, Adresa, Scoala, Clasa);
        jb.disconnect();
    %>
    <br />
    <h1 align="center">Elevul a fost adaugat cu succes!</h1>
    <p align="center">
        <a href="index.html"><button>Home</button></a>
        <a href="tabela_Elevi.jsp"><button>Tabela elevi</button></a>
    </p>
    <br />
    <%
    } else {
    %>
    <h1>Suntem în tabela Elevi.</h1>
    <% if (errorMessage != null) { %>
        <p style="color: red;"><%= errorMessage %></p>
    <% } %>
    <form action="nou_Elev.jsp" method="post">
        <table>
            <tr>
                <td align="right">Nume Elev:</td>
                <td><input type="text" name="Nume" size="40" /></td>
            </tr>
            <tr>
                <td align="right">Prenume Elev:</td>
                <td><input type="text" name="Prenume" size="30" /></td>
            </tr>
            <tr>
                <td align="right">Initiala Tatalui Elev:</td>
                <td><input type="text" name="InitialaTatalui" size="30" /></td>
            </tr>
            <tr>
                <td align="right">Adresa:</td>
                <td><input type="text" name="Adresa" size="30" /></td>
            </tr>
            <tr>
                <td align="right">Scoala:</td>
                <td><input type="text" name="Scoala" size="30" /></td>
            </tr>
            <tr>
                <td align="right">Clasa:</td>
                <td><input type="text" name="Clasa" size="30" /></td>
            </tr>
        </table>
        <center>
            <button>Adauga Elev</button>
        </center>
    </form>
    
    <br />
    
    <center> <a href="index.html"><button>Home</button></a> </center>
    <%
    }
    %>
</body>
</html>