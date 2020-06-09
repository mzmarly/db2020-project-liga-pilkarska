package pl.League.models;

import java.util.Date;

public class Employee {
	private int employees_id;
	private String job_title;
	private String first_name;
	private String surname;
	private Date born_date;
	private int clubID;
	
	public Employee() {}
	public Employee(int employees_id, String job_title, String first_name, String surname, Date born_date,int clubID) {
		super();
		this.employees_id = employees_id;
		this.job_title = job_title;
		this.first_name = first_name;
		this.surname = surname;
		this.born_date = born_date;
		this.clubID = clubID;
	}

	@Override
	public String toString() {
		return "Employee [employees_id=" + employees_id + ", job_title=" + job_title + ", first_name=" + first_name
				+ ", surname=" + surname + ", born_date=" + born_date  + ", clubID=" + clubID+ "]";
	}
	public int getEmployees_id() {
		return employees_id;
	}

	public void setEmployees_id(int employees_id) {
		this.employees_id = employees_id;
	}

	public String getJob_title() {
		return job_title;
	}

	public void setJob_title(String job_title) {
		this.job_title = job_title;
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
}
