package kr.co.itwill.book;

import java.sql.Connection;
import java.sql.DriverManager;


// https://hosunge.tistory.com/448 참고 
public class DBConn {

	private static Connection dbConn;
	
	
	
	public static Connection getConnection() {
		
		if(dbConn == null) {
			
			try {
				String url = "jdbc:mariadb://localhost:3306/mydb";
				String User = "root";
				String pwd = "1234";
				
				Class.forName("org.mariadb.jdbc.Driver");
				dbConn = DriverManager.getConnection(url, User, pwd);
			}catch (Exception e) {
				
				System.out.println(e.toString());
			}
	}
	return dbConn;
	
}

public static Connection getConnection(String url, String user, String pwd) {
	
	
	if(dbConn == null) {
		try {
			Class.forName("jdbc:mariadb://localhost:3306/mydb");
			dbConn = DriverManager.getConnection(url, user, pwd);
		}catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	return dbConn;
}



}//class end



