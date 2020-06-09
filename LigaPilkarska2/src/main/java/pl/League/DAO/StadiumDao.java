package pl.League.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pl.League.DataBase.BaseConnection;
import pl.League.models.Stadium;

public class StadiumDao {
	
	private static Connection connectionWithDateBase=BaseConnection.getConnection();

	public static List<Stadium> findAll(){
		List<Stadium> stadiums=new ArrayList<Stadium>();
		try {
		String query="select * from football_leagues.stadium;";
		PreparedStatement statement=connectionWithDateBase.prepareStatement(query);
		ResultSet result=statement.executeQuery();
		while(result.next()) {
			stadiums.add(new Stadium(result.getInt(1),result.getString(2),result.getString(3),result.getDate(4),result.getInt(5),result.getInt(6)));
		}
		}catch(SQLException sqlexc) {
			System.out.println(sqlexc.getMessage());
		}
		return stadiums;
	}
	
	public static Stadium findByStadiumName(String stadiumName) {
		Stadium stadium=new Stadium();
		try {
			String query="select * from football_leagues.stadium where name_stadium=?;";
			PreparedStatement statement=connectionWithDateBase.prepareStatement(query);
			statement.setString(1, stadiumName);
			ResultSet result=statement.executeQuery();
			if(result.next()) {
				stadium=new Stadium(result.getInt(1),result.getString(2),result.getString(3),result.getDate(4),result.getInt(5),result.getInt(6));
			}
		}catch(SQLException sqlexc) {
			System.out.println(sqlexc.getMessage());
		}
		return stadium;
	}
	public static double averageOfStadiumsCapacity() {
		double average=0.0;
		try {
			String query="select AVG(capacity) from football_leagues.stadium ;";
			PreparedStatement statement=connectionWithDateBase.prepareStatement(query);
			ResultSet result=statement.executeQuery();
			result.next();
			average=result.getDouble(1);
		}catch(SQLException sqlexc) {
			System.out.println(sqlexc.getMessage());
		}
		return average;
	}
	
	public static void addStadium(String stadiumName,String stadiumAdress,String capacity,String clubName,String dateOfBuilt) {
		try {
			int clubId=ClubDao.findByClubName(clubName).getClub_id();
			String query="insert into football_leagues.stadium (stadium_id,name_stadium,address,dateOfBuilt,clubID,capacity) select * from (select null,?,?,?,?,?)as tmp where not exists (select name_stadium from football_leagues.stadium where name_stadium=?) LIMIT 1;";
			PreparedStatement statement=connectionWithDateBase.prepareStatement(query);
			statement.setString(1, stadiumName);
			statement.setString(2, stadiumAdress);
			statement.setDate(3, Date.valueOf(dateOfBuilt));
			statement.setInt(4,clubId);
			statement.setInt(5, Integer.parseInt(capacity));
			statement.setString(6, stadiumName);
			int result=statement.executeUpdate();
			System.out.println("Query executed-added new stadiums ");
		}catch(SQLException sqlexc){
			System.out.println(sqlexc.getMessage());
		}
	}
	
}
