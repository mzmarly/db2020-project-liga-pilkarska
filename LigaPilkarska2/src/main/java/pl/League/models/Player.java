package pl.League.models;

import java.util.Date;

public class Player {
	
	private int player_id;
	private String first_name;
	private String surname;
	private Date born_date;
	private int clubID;
	private int countryID;
	private String position;
	private String foot;
	private double market_value;
	
	public Player() {}
	public Player(int player_id, String first_name, String surname, Date born_date, int clubID,
			int countryID, String position, String foot, double market_value) {
		super();
		this.player_id = player_id;
		this.first_name = first_name;
		this.surname = surname;
		this.born_date = born_date;
		this.clubID = clubID;
		this.countryID = countryID;
		this.position = position;
		this.foot = foot;
		this.market_value = market_value;
	}
	
	@Override
	public String toString() {
		return "Player [player_id=" + player_id + ", first_name=" + first_name + ", surname=" + surname + ", born_date="
				+ born_date +  ", clubID=" + clubID + ", countryID=" + countryID + ", position="
				+ position + ", foot=" + foot + ", market_value=" + market_value + "]";
	}
	public int getPlayer_id() {
		return player_id;
	}

	public void setPlayer_id(int player_id) {
		this.player_id = player_id;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public Date getBorn_date() {
		return born_date;
	}

	public void setBorn_date(Date born_date) {
		this.born_date = born_date;
	}

	public int getClubID() {
		return clubID;
	}

	public void setClubID(int clubID) {
		this.clubID = clubID;
	}

	public int getCountryID() {
		return countryID;
	}

	public void setCountryID(int countryID) {
		this.countryID = countryID;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getFoot() {
		return foot;
	}

	public void setFoot(String foot) {
		this.foot = foot;
	}

	public double getMarket_value() {
		return market_value;
	}

	public void setMarket_value(double market_value) {
		this.market_value = market_value;
	}
	
}
