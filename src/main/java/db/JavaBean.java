/*
 * Proiect PIBD - Mihai Modi
 */
package db;

import java.sql.*;

/**
 *
 * @author Mihai
 */
public class JavaBean {

    String error;
    Connection con;

    public JavaBean() {
    }

    public void connect() throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ministerul_educatiei?useSSL=false", "root", "1234");
        } catch (ClassNotFoundException cnfe) {
            error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
            throw new ClassNotFoundException(error);
        } catch (SQLException cnfe) {
            error = "SQLException: Nu se poate conecta la baza de date.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
            throw new Exception(error);
        }
    } // connect()

    public void connect(String bd) throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + bd, "root", "1234");
        } catch (ClassNotFoundException cnfe) {
            error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
            throw new ClassNotFoundException(error);
        } catch (SQLException cnfe) {
            error = "SQLException: Nu se poate conecta la baza de date.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
            throw new Exception(error);
        }
    } // connect(String bd)

    public void connect(String bd, String ip) throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://" + ip + ":3306/" + bd, "root", "1234");
        } catch (ClassNotFoundException cnfe) {
            error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
            throw new ClassNotFoundException(error);
        } catch (SQLException cnfe) {
            error = "SQLException: Nu se poate conecta la baza de date.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
            throw new Exception(error);
        }
    } // connect(String bd, String ip)

    public void disconnect() throws SQLException {
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException sqle) {
            error = ("SQLException: Nu se poate inchide conexiunea la baza de date.");
            throw new SQLException(error);
        }
    } // disconnect()

    public void adaugaElev(String Nume, String Prenume,String InitialaTatalui, String Adresa, String Scoala, int Clasa)
            throws SQLException, Exception {
        if (con != null) {
            try {
// creaza un "prepared SQL statement"
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate("insert into elevi(Nume, Prenume, InitialaTatalui, Adresa, Scoala, Clasa) values('" + Nume + "'  , '" + Prenume + "', '" + InitialaTatalui + "', '" + Adresa + "', '" + Scoala + "', '" + Clasa + "');");

            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of adaugaElev()

    public void adaugaSubiect(String Materie, String Dificultate, int Clasa)
            throws SQLException, Exception {
        if (con != null) {
            try {
// creaza un "prepared SQL statement"
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate("insert into subiecte(Materie, Dificultate, Clasa) values('" + Materie + "'  , '" + Dificultate + "'  , '" + Clasa + "');");

            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of adaugaSubiect()

        public void adaugaExamen(int idelev, int idsubiect, String Nume, double Nota)
            throws SQLException, Exception {
        if (con != null) {
            try {
// creaza un "prepared SQL statement"
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate("insert into examen(idelev, idsubiect, Nume, Nota, Data) values('" + idelev + "'  , '" + idsubiect  + "', '" + Nume + "', '" + Nota + "', CURDATE() );");

            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of adaugaExamen()

    public ResultSet vedeTabela(String tabel) throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String queryString = ("select * from `ministerul_educatiei`.`" + tabel + "`;");
            Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // vedeTabela()

    public ResultSet vedeExamen() throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String queryString = ("select a.Nume NumeElev, a.Prenume PrenumeElev, a.InitialaTatalui InitialaTataluiElev, a.Adresa AdresaElev, a.Scoala ScoalaElev, a.Clasa ClasaElev, b.Materie MaterieSubiect, b.Dificultate DificultateSubiect,b.Clasa ClasaSubiect, c.idexamen, c.idelev idelev_examen, c.idsubiect idsubiect_examen, c.Nume NumeExamen, c.Nota NotaExamen, c.Data DataExamen from elevi a, subiecte b, examen c where a.idelev = c.idelev and b.idsubiect = c.idsubiect;");
            Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // vedeExamen()

    public void stergeDateTabela(String[] primaryKeys, String tabela, String dupaID) throws SQLException, Exception {
        if (con != null) {
            try {
// creaza un "prepared SQL statement"
                long aux;
                PreparedStatement delete;
                delete = con.prepareStatement("DELETE FROM " + tabela + " WHERE " + dupaID + "=?;");
                for (int i = 0; i < primaryKeys.length; i++) {
                    aux = java.lang.Long.parseLong(primaryKeys[i]);
                    delete.setLong(1, aux);
                    delete.execute();
                }
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            } catch (Exception e) {
                error = "A aparut o exceptie in timp ce erau sterse inregistrarile.";
                throw new Exception(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of stergeDateTabela()

    public void stergeTabela(String tabela) throws SQLException, Exception {
        if (con != null) {
            try {
// creaza un "prepared SQL statement"
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate("delete from " + tabela + ";");
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Stergere nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of stergeTabela()

    public void modificaTabela(String tabela, String IDTabela, int ID, String[] campuri, String[] valori) throws SQLException, Exception {
        String update = "update " + tabela + " set ";
        String temp = "";
        if (con != null) {
            try {
                for (int i = 0; i < campuri.length; i++) {
                    if (i != (campuri.length - 1)) {
                        temp = temp + campuri[i] + "='" + valori[i] + "', ";
                    } else {
                        temp = temp + campuri[i] + "='" + valori[i] + "' where " + IDTabela + " = '" + ID + "';";
                    }
                }
                update = update + temp;
// creaza un "prepared SQL statement"
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate(update);
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of modificaTabela()

    public ResultSet intoarceLinie(String tabela, int ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
// Executa interogarea
            String queryString = ("SELECT * FROM " + tabela + " where idsubiect=" + ID + ";");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString); //sql exception
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // end of intoarceLinie()

    public ResultSet intoarceLinieDupaId(String tabela, String denumireId, int ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
// Executa interogarea
            String queryString = ("SELECT * FROM " + tabela + " where " + denumireId + "=" + ID + ";");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString); //sql exception
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // end of intoarceLinieDupaId()

    public ResultSet intoarceExamenId(int ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
// Executa interogarea
        	String queryString = ("select a.Nume NumeElev, a.Prenume PrenumeElev, a.InitialaTatalui InitialaTataluiElev, a.Adresa AdresaElev, a.Scoala ScoalaElev, a.Clasa ClasaElev, b.Materie MaterieSubiect, b.Dificultate DificultateSubiect,b.Clasa ClasaSubiect, c.idexamen, c.idelev, c.idsubiect, c.Nume NumeExamen, c.Nota NotaExamen, c.Data DataExamen from elevi a, subiecte b, examen c where a.idelev = c.idelev and b.idsubiect = c.idsubiect;");
        	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString); //sql exception
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // end of intoarceLinieDupaId()
}

