package model;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Classe modelo - conexão com o banco
 * @author joao.vssouza42
 *
 */

public class Dao {

	//Parametros de conex�o
		private String driver = "com.mysql.cj.jdbc.Driver";
		private String url = "jdbc:mysql://localhost:3306/agendajoao";
		private String user = "root";
		private String password = "123@Senac";
		
		/**
		 * Método responsável pela conexão
		 * @return con /null
		 */
		public Connection conectar() {
			// objeto usado para conex�o
			Connection con = null;
			// tratamento de exce��es
			try {
				Class.forName(driver);
				// Estabelecer a conex�o
				con = DriverManager.getConnection(url, user, password);
				return con;
			} catch (Exception e) {
				System.out.println(e);
				return null;
			}
		}
}
