package pl.League.models;

public class Leagues {
	private int leagues_id;
	private int countryID;
	private int size_league;
	private String name_league;
	
	public Leagues() {}
	public Leagues(int leagues_id, int countryID, int size_league, String name_league) {
		super();
		this.leagues_id = leagues_id;
		this.countryID = countryID;
		this.size_league = size_league;
		this.name_league = name_league;
	}
	
	@Override
	public String toString() {
		return "Leagues [leagues_id=" + leagues_id + ", countryID=" + countryID + ", size_league=" + size_league
				+ ", name_league=" + name_league + "]";
	}
	public int getLeagues_id() {
		return leagues_id;
	}

	public void setLeagues_id(int leagues_id) {
		this.leagues_id = leagues_id;
	}

	public int getCountryID() {
		return countryID;
	}

	public void setCountryID(int countryID) {
		this.countryID = countryID;
	}

	public int getSize_league() {
		return size_league;
	}

	public void setSize_league(int size_league) {
		this.size_league = size_league;
	}

	public String getName_league() {
		return name_league;
	}

	public void setName_league(String name_league) {
		this.name_league = name_league;
	}
	
}
