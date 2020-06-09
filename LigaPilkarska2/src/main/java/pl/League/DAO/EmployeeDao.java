package pl.League.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pl.League.DataBase.BaseConnection;
import pl.League.models.Employee;

public class EmployeeDao {
	
	private static Connection connectionWithDateBase=BaseConnection.getConnection();
 
	
	public static List<Employee> findAll(){
		List<Employee> employies=new ArrayList<Employee>();
		try {
			String query="select * from football_leagues.employee;";
			PreparedStatement statement=connectionWithDateBase.prepareStatement(query);
			ResultSet result=statement.executeQuery();
			while(result.next()) {
				employies.add(new Employee(result.getInt(1),result.getString(2),result.getString(3),result.getString(4),result.getDate(5),result.getInt(6)));
			}
		}catch(SQLException sqlexc) {
			System.out.println(sqlexc.getMessage());
		}
		return employies;
	}
	
	public static Employee findByEmployeeName(String employee_name) {
		Employee employee=new Employee();
		try {
			String query="select * from football_leagues.employee where surname=?;";
			PreparedStatement statement=connectionWithDateBase.prepareStatement(query);
			statement.setString(1, employee_name);
			ResultSet result=statement.executeQuery();
			if(result.next()) {
				employee=new Employee(result.getInt(1),result.getString(2),result.getString(3),result.getString(4),result.getDate(5),result.getInt(6));
			}
		}catch(SQLException sqlexc) {
			System.out.println(sqlexc.getMessage());
		}
		return employee;
	}
	public static void addEmployee(String position,String firstName,String surname,String dateOfBorn,String clubName) {
		try {
			int clubId=ClubDao.findByClubName(clubName).getClub_id();
			String query="insert into football_leagues.country (employees_id,job_title,first_name,surname,born_date,clubID) select * from (select null,?,?,?,?,?)as tmp where not exists (select job_title,first_name,surname from football_leagues.country where job_title=? and first_name=? and surname=?) LIMIT 1;";
			PreparedStatement statement=connectionWithDateBase.prepareStatement(query);
			statement.setString(1, position);
			statement.setString(2, firstName);
			statement.setString(3, surname);
			statement.setDate(4, Date.valueOf(dateOfBorn));
			statement.setInt(5, clubId);
			statement.setString(6, position);
			statement.setString(7,firstName);
			statement.setString(8,surname);
			int result=statement.executeUpdate();
			System.out.println("Query executed-added new club to table");
		}catch(SQLException sqlexc){
			System.out.println(sqlexc.getMessage());
		}
	}
}
