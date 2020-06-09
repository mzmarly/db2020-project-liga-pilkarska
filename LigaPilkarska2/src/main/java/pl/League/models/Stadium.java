package pl.League.models;

import java.util.Date;

public class Stadium {
	
	private int stadium_id;
	private String name_stadium;
	private String address;
	private Date dateOfBuilt;
	private int clubID;
	private int capacity;
	
	public int getStadium_id() {
		return stadium_id;
	}

	public void setStadium_id(int stadium_id) {
		this.stadium_id = stadium_id;
	}

	public String getName_stadium() {
		return name_stadium;
	}

	public void setName_stadium(String name_stadium) {
		this.name_stadium = name_stadium;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getDateOfBuilt() {
		return dateOfBuilt;
	}

	public void setDateOfBuilt(Date dateOfBuilt) {
		this.dateOfBuilt = dateOfBuilt;
	}

	public int getClubID() {
		return clubID;
	}

	public void setClubID(int clubID) {
		this.clubID = clubID;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public Stadium() {}
	public Stadium(int stadium_id, String name_stadium, String address, Date dateOfBuilt, int clubID, int capacity) {
		super();
		this.stadium_id = stadium_id;
		this.name_stadium = name_stadium;
		this.address = address;
		this.dateOfBuilt = dateOfBuilt;
		this.clubID = clubID;
		this.capacity = capacity;
	}

	@Override
	public String toString() {
		return "Stadium [stadium_id=" + stadium_id + ", name_stadium=" + name_stadium + ", address=" + address
				+ ", dateOfBuilt=" + dateOfBuilt + ", clubID=" + clubID + ", capacity=" + capacity + "]";
	}
	
}
