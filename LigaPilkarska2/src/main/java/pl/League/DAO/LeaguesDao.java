package pl.League.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import pl.League.DataBase.BaseConnection;
import pl.League.models.Club;
import pl.League.models.Leagues;

public class LeaguesDao {
	
	private static Connection connectionWithDateBase=BaseConnection.getConnection();

	public static List<Leagues> findAll(){
		List<Leagues> leagues=new ArrayList<Leagues>();
		try {
			String query="select * from football_leagues.leagues;";
			PreparedStatement statement=connectionWithDateBase.prepareStatement(query);
			ResultSet result=statement.executeQuery();
			while(result.next()) {
				leagues.add(new Leagues(result.getInt(1),result.getInt(2),result.getInt(3),result.getString(4)));
			}
		}catch(SQLException sqlexc) {
			System.out.println(sqlexc.getMessage());
		}
		return leagues;
	}
	
	
	public static Leagues findByLeagueName(String league_name) {
		Leagues leagues=new Leagues();
		try {
			String query="select * from football_leagues.leagues where name_league=?;";
			PreparedStatement statement=connectionWithDateBase.prepareStatement(query);
			statement.setString(1, league_name);
			ResultSet result=statement.executeQuery();
			if(result.next()) {
				leagues=new Leagues(result.getInt(1),result.getInt(2),result.getInt(3),result.getString(4));
			}
		}catch(SQLException sqlexc) {
			System.out.println(sqlexc.getMessage());
		}
		return leagues;
	}
	public static void addLeague(String countryName,String size_league,String leagueName) {
		try {
			int countryId=CountryDao.findByCountryName(countryName).getCountry_id();
			System.out.println("countryName "+countryId);
			String query="insert into football_leagues.leagues (leagues_id,countryID,size_league,name_league) select * from (select null,?,?,?)as tmp where not exists (select name_league from football_leagues.leagues where name_league=?) LIMIT 1;";
			PreparedStatement statement=connectionWithDateBase.prepareStatement(query);
			statement.setInt(1, countryId);
			statement.setInt(2, Integer.parseInt(size_league));
			statement.setString(3, leagueName);
			statement.setString(4, leagueName);
			int result=statement.executeUpdate();
		}catch(SQLException sqlexc){
			System.out.println(sqlexc.getMessage());
		}
	}
	public static List<Leagues> findLeaguesWithSize(String size){
		List<Leagues> leagues=new ArrayList<Leagues>();
		try {
			int sizeInt=Integer.parseInt(size);
			String query="select * from football_leagues.leagues having size_league>? order by size_league desc;";
			PreparedStatement statement=connectionWithDateBase.prepareStatement(query);
			statement.setInt(1, sizeInt);
			ResultSet result=statement.executeQuery();
			while(result.next()) {
				leagues.add(new Leagues(result.getInt(1),result.getInt(2),result.getInt(3),result.getString(4)));
			}
		}catch(SQLException sqlexc) {
			System.out.println(sqlexc.getMessage());
		}
		return leagues;
	}
}
