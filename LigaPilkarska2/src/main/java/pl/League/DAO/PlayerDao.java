package pl.League.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pl.League.DataBase.BaseConnection;
import pl.League.models.Player;

public class PlayerDao {
	
	private static Connection connectionWithDateBase=BaseConnection.getConnection();

	public static List<Player> findAll(){
		List<Player> players=new ArrayList<Player>();
		try {
		String query="select * from football_leagues.player;";
		PreparedStatement statement=connectionWithDateBase.prepareStatement(query);
		ResultSet result=statement.executeQuery();
		while(result.next()) {
			players.add(new Player(result.getInt(1),result.getString(2),result.getString(3),result.getDate(4),result.getInt(5),result.getInt(6),result.getString(7),result.getString(8),result.getDouble(9)));
		}
		}catch(SQLException sqlexc) {
			System.out.println(sqlexc.getMessage());
		}
		return players;
	}


	public static Player findBySurName(String surname) {
		Player player=new Player();
		try {
			String query="select * from football_leagues.player where surname=?;";
			PreparedStatement statement=connectionWithDateBase.prepareStatement(query);
			statement.setString(1, surname);
			ResultSet result=statement.executeQuery();
			if(result.next()) {
				player=new Player(result.getInt(1),result.getString(2),result.getString(3),result.getDate(4),result.getInt(5),result.getInt(6),result.getString(7),result.getString(8),result.getDouble(9));
			}
		}catch(SQLException sqlexc) {
			System.out.println(sqlexc.getMessage());
		}
		return player;
	}
	
	public static void addPlayer(String firstName,String surname,String position,String foot,String market_value,String clubName,String countryName,String dateOfBorn) {
		try {
			int countryId=CountryDao.findByCountryName(countryName).getCountry_id();
			int clubId=ClubDao.findByClubName(clubName).getClub_id();
			String query="insert into football_leagues.player (player_id,first_name,surname,born_date,clubID,countryID,position,foot,market_value) select * from (select null,?,?,?,?,?,?,?,?)as tmp where not exists (select first_name,surname,clubID from football_leagues.player where first_name=? and surname=? and clubID=?) LIMIT 1;";
			PreparedStatement statement=connectionWithDateBase.prepareStatement(query);
			statement.setString(1, firstName);
			statement.setString(2, surname);
			statement.setDate(3,  Date.valueOf(dateOfBorn));
			statement.setInt(4, clubId);
			statement.setInt(5, countryId);
			statement.setString(6, position);
			statement.setString(7, foot);
			statement.setDouble(8, Double.parseDouble(market_value));
			statement.setString(9, firstName);
			statement.setString(10, surname);
			statement.setInt(11, clubId);
			int result=statement.executeUpdate();
			System.out.println("Query executed- created new Player ");
		}catch(SQLException sqlexc){
			System.out.println(sqlexc.getMessage());
		}
	}
	public static List<Player> mostValuablePlayersFromClub(String clubName){
		List<Player> players=new ArrayList<Player>();
		try {
		String query="select * from football_leagues.player where clubID=(select club_id from football.club where club_name=?) order by market_value desc limit 5;";
		PreparedStatement statement=connectionWithDateBase.prepareStatement(query);
		statement.setString(1, clubName);
		ResultSet result=statement.executeQuery();
		while(result.next()) {
			players.add(new Player(result.getInt(1),result.getString(2),result.getString(3),result.getDate(4),result.getInt(5),result.getInt(6),result.getString(7),result.getString(8),result.getDouble(9)));
		}
		}catch(SQLException sqlexc) {
			System.out.println(sqlexc.getMessage());
		}
		return players;
	}
}
