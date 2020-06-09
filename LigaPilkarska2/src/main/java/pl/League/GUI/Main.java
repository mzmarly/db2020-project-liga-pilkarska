package pl.League.GUI;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import java.awt.Color;
import java.awt.Font;
import javax.swing.SwingConstants;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class Main extends JFrame {

	private JPanel contentPane;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Main frame = new Main();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public Main() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 445);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblNewLabel_1 = new JLabel("Football League Manager");
		lblNewLabel_1.setBounds(5, 5, 424, 38);
		lblNewLabel_1.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_1.setForeground(new Color(0, 128, 0));
		lblNewLabel_1.setFont(new Font("Dialog", Font.BOLD | Font.ITALIC, 29));
		lblNewLabel_1.setBackground(new Color(0, 128, 0));
		contentPane.add(lblNewLabel_1);
		
		JButton playerButton = new JButton("Players");
		playerButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				PlayerGui playerGui=new PlayerGui();
				playerGui.setVisible(true);
				
			}
		});
		playerButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		playerButton.setBounds(66, 95, 306, 38);
		contentPane.add(playerButton);
		
		JButton countryButton = new JButton("Country");
		countryButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				CountryGui countryGui=new CountryGui();
				countryGui.setVisible(true);
			}
		});
		countryButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		countryButton.setBounds(66, 144, 306, 38);
		contentPane.add(countryButton);
		
		JButton leagueButton = new JButton("Leagues");
		leagueButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				LeaguesGui leaguesGui=new LeaguesGui();
				leaguesGui.setVisible(true);
			}
		});
		leagueButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		leagueButton.setBounds(66, 193, 306, 38);
		contentPane.add(leagueButton);
		
		JButton stadiumButton = new JButton("Stadiums");
		stadiumButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				StadiumGui stadiumGui=new StadiumGui();
				stadiumGui.setVisible(true);
			}
		});
		stadiumButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		stadiumButton.setBounds(66, 242, 306, 38);
		contentPane.add(stadiumButton);
		
		JButton employeesButton = new JButton("Employees");
		employeesButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				EmployeeGui employeeGui=new EmployeeGui();
				employeeGui.setVisible(true);
			}
		});
		employeesButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		employeesButton.setBounds(66, 291, 306, 38);
		contentPane.add(employeesButton);
		
		JButton clubButton = new JButton("Clubs");
		clubButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				ClubGui clubGui=new ClubGui();
				clubGui.setVisible(true);
			}
		});
		clubButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		clubButton.setBounds(66, 340, 306, 38);
		contentPane.add(clubButton);
	}
}
