package pl.League.Main;

import java.util.List;

import pl.League.DAO.ClubDao;
import pl.League.DAO.CountryDao;
import pl.League.DAO.LeaguesDao;
import pl.League.models.Club;
import pl.League.models.Country;
import pl.League.models.Leagues;

public class Main {

	public static void main(String[] args) {
		
		List<Club> clubs=ClubDao.findAll();
		List<Country> countries=CountryDao.findAll();
		List<Leagues> leagues=LeaguesDao.findAll();
		for(Club club:clubs) {
			System.out.println(club.toString());
			}
		for(Leagues club:leagues) {
			System.out.println(club.toString());
			}
		for(Country count:countries) {
			System.out.println(count.toString());
		}
		Leagues league=LeaguesDao.findByLeagueName("Ekstraklasa");
		System.out.println(league.toString());
		long value=ClubDao.teamValue("Legia Warszawa");
		System.out.println(value);
		
	}

}
