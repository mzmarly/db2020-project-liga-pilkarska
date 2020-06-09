package pl.League.models;

import java.util.Date;

public class Club {
	
	private int club_id;
	private String club_name;
	private  String city;
	private Date dateOfFounding;
	private int leagueID;
	
	public Club(){}
	public Club(int club_id, String club_name, String city, Date dateOfFounding, int leagueID) {
		super();
		this.club_id = club_id;
		this.club_name = club_name;
		this.city = city;
		this.dateOfFounding = dateOfFounding;
		this.leagueID = leagueID;

	}

	public int getClub_id() {
		return club_id;
	}

	public void setClub_id(int club_id) {
		this.club_id = club_id;
	}

	public String getClub_name() {
		return club_name;
	}

	public void setClub_name(String club_name) {
		this.club_name = club_name;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Date getDateOfFounding() {
		return dateOfFounding;
	}

	public void setDateOfFounding(Date dateOfFounding) {
		this.dateOfFounding = dateOfFounding;
	}

	public int getLeagueID() {
		return leagueID;
	}

	public void setLeagueID(int leagueID) {
		this.leagueID = leagueID;
	}



	@Override
	public String toString() {
		return "Club [club_id=" + club_id + ", club_name=" + club_name + ", city=" + city + ", dateOfFounding="
				+ dateOfFounding + ", leagueID=" + leagueID + "]";
	}
	
}
