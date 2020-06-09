package pl.League.GUI;

import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Date;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.border.EmptyBorder;

import pl.League.DAO.ClubDao;
import pl.League.DAO.CountryDao;
import pl.League.DAO.EmployeeDao;
import pl.League.DAO.LeaguesDao;
import pl.League.models.Club;
import pl.League.models.Employee;

public class AddLeagueGui extends JFrame {

	private JPanel contentPane;
	private JTextField leagueNameField;
	private JTextField countryNameField;
	private JTextField sizeField;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					AddLeagueGui frame = new AddLeagueGui();
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
	public AddLeagueGui() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 349);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel addLeagueTitle = new JLabel("Add new league!");
		addLeagueTitle.setHorizontalAlignment(SwingConstants.CENTER);
		addLeagueTitle.setForeground(new Color(0, 128, 0));
		addLeagueTitle.setFont(new Font("Dialog", Font.BOLD | Font.ITALIC, 29));
		addLeagueTitle.setBackground(new Color(0, 128, 0));
		addLeagueTitle.setBounds(10, 11, 414, 38);
		contentPane.add(addLeagueTitle);
		
		JLabel leagueNameLabel = new JLabel("League Name:");
		leagueNameLabel.setHorizontalAlignment(SwingConstants.CENTER);
		leagueNameLabel.setFont(new Font("Tahoma", Font.PLAIN, 18));
		leagueNameLabel.setBounds(10, 60, 169, 21);
		contentPane.add(leagueNameLabel);
		
		leagueNameField = new JTextField("");
		leagueNameField.setColumns(10);
		leagueNameField.setBounds(52, 92, 331, 26);
		contentPane.add(leagueNameField);
		
		JButton confirmButton = new JButton("Submit");
		confirmButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				LeaguesDao.addLeague(countryNameField.getText(),sizeField.getText(),leagueNameField.getText());
				dispose();
				LeaguesGui leagueGui=new LeaguesGui();
				leagueGui.setVisible(true);
			}});
		confirmButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		confirmButton.setBounds(10, 265, 141, 29);
		contentPane.add(confirmButton);
		
		JButton backButton = new JButton("Back");
		backButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				LeaguesGui leagueGui=new LeaguesGui();
				leagueGui.setVisible(true);
			}
		});
		backButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		backButton.setBounds(283, 265, 141, 29);
		contentPane.add(backButton);
		
		JLabel countryNameLabel = new JLabel("Country name:");
		countryNameLabel.setHorizontalAlignment(SwingConstants.CENTER);
		countryNameLabel.setFont(new Font("Tahoma", Font.PLAIN, 18));
		countryNameLabel.setBounds(10, 129, 169, 21);
		contentPane.add(countryNameLabel);
		
		countryNameField = new JTextField("");
		countryNameField.setColumns(10);
		countryNameField.setBounds(52, 161, 331, 26);
		contentPane.add(countryNameField);
		
		JLabel sizeLabel = new JLabel("Size of league:");
		sizeLabel.setHorizontalAlignment(SwingConstants.CENTER);
		sizeLabel.setFont(new Font("Tahoma", Font.PLAIN, 18));
		sizeLabel.setBounds(10, 198, 169, 21);
		contentPane.add(sizeLabel);
		
		sizeField = new JTextField("");
		sizeField.setColumns(10);
		sizeField.setBounds(52, 228, 331, 26);
		contentPane.add(sizeField);
	}
}
