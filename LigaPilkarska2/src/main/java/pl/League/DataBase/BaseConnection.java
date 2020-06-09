package pl.League.DataBase;

import java.sql.Connection;
import java.sql.DriverManager;

public class BaseConnection {

	public static Connection getConnection() {

			try {
				Class.forName("com.mysql.jdbc.Driver");
				String SQLUser="root";
				String SQLPassword="root";
				Connection connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/football_leagues?autoReconnect=true&useSSL=false",SQLUser, SQLPassword);
				System.out.println("connected with datebase");
				return connect;
			}
			catch(Exception exc) {
				System.out.println(exc.getMessage());
				return null;
			}
		} 
}
