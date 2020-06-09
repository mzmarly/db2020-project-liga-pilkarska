package pl.League.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import pl.League.DataBase.BaseConnection;
import pl.League.models.Club;

public class ClubDao {
	
	private static Connection connectionWithDateBase=BaseConnection.getConnection();

	public static List<Club> findAll(){
		List<Club> clubs=new ArrayList<Club>();
		try {
		String query="select * from football_leagues.club;";
		PreparedStatement statement=connectionWithDateBase.prepareStatement(query);
		ResultSet result=statement.executeQuery();
		while(result.next()) {
			clubs.add(new Club(result.getInt(1),result.getString(2),result.getString(3),result.getDate(4),result.getInt(5)));
		}
		}catch(SQLException sqlexc) {
			System.out.println(sqlexc.getMessage());
		}
		return clubs;
	}
	
	public static Club findByClubName(String club_name) {
		Club club=new Club();
		try {
			String query="select * from football_leagues.club where club_name=?";
			PreparedStatement statement=connectionWithDateBase.prepareStatement(query);
			statement.setString(1, club_name);
			ResultSet result=statement.executeQuery();
			if(result.next()) {
				club=new Club(result.getInt(1),result.getString(2),result.getString(3),result.getDate(4),result.getInt(5));
			}
		}catch(SQLException sqlexc) {
			System.out.println(sqlexc.getMessage());
		}
		return club;
	}
	
	public static void addClub(String clubName,String city,String dateOfFounding,String leagueName) {
		try {
			int leagueId=LeaguesDao.findByLeagueName(leagueName).getLeagues_id();
			String query="insert into football_leagues.club (club_id,club_name,city,dateOfFounding,leagueID) select * from (select null,?,?,?,?)as tmp where not exists (select club_name from football_leagues.club where club_name=?) LIMIT 1;";
			PreparedStatement statement=connectionWithDateBase.prepareStatement(query);
			statement.setString(1, clubName);
			statement.setString(2, city);
			statement.setDate(3, Date.valueOf(dateOfFounding));
			statement.setInt(4, leagueId);
			statement.setString(5, clubName);
			int result=statement.executeUpdate();
		}catch(SQLException sqlexc){
			System.out.println(sqlexc.getMessage());
		}
	}
	public static long teamValue(String club_name){
		long  wartosc=0;
		try {
			wartosc=0;
			String query="select  SUM(market_value) from football_leagues.player where clubID=(select club_id from football_leagues.club where club_name=?);";
			PreparedStatement statement=connectionWithDateBase.prepareStatement(query);
			statement.setString(1, club_name);
			ResultSet result=statement.executeQuery();
			while(result.next())
			{
				wartosc+=result.getDouble(1);
			}
			System.out.println("wartosc klubu to: "+ wartosc);
		}
		catch(SQLException sqlexc) {
			System.out.println(sqlexc.getMessage());
		}
		return wartosc;
	}
}
