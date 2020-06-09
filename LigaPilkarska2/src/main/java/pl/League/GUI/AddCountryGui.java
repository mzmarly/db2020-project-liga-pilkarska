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
import pl.League.models.Club;
import pl.League.models.Employee;

public class AddCountryGui extends JFrame {

	private JPanel contentPane;
	private JTextField countryNameField;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					AddCountryGui frame = new AddCountryGui();
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
	public AddCountryGui() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 250);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel addCountryTitle = new JLabel("Add new country!");
		addCountryTitle.setHorizontalAlignment(SwingConstants.CENTER);
		addCountryTitle.setForeground(new Color(0, 128, 0));
		addCountryTitle.setFont(new Font("Dialog", Font.BOLD | Font.ITALIC, 29));
		addCountryTitle.setBackground(new Color(0, 128, 0));
		addCountryTitle.setBounds(10, 11, 414, 38);
		contentPane.add(addCountryTitle);
		
		JLabel countryNameLabel = new JLabel("Country name:");
		countryNameLabel.setHorizontalAlignment(SwingConstants.CENTER);
		countryNameLabel.setFont(new Font("Tahoma", Font.PLAIN, 18));
		countryNameLabel.setBounds(10, 60, 169, 21);
		contentPane.add(countryNameLabel);
		
		countryNameField = new JTextField("");
		countryNameField.setColumns(10);
		countryNameField.setBounds(52, 92, 331, 26);
		contentPane.add(countryNameField);
		
		JButton confirmButton = new JButton("Submit");
		confirmButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				CountryDao.addCountry(countryNameField.getText());
				dispose();
				CountryGui conuntryGui=new CountryGui();
				conuntryGui.setVisible(true);
			}});
		confirmButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		confirmButton.setBounds(10, 160, 141, 29);
		contentPane.add(confirmButton);
		
		JButton backButton = new JButton("Back");
		backButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				CountryGui conuntryGui=new CountryGui();
				conuntryGui.setVisible(true);
			}
		});
		backButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		backButton.setBounds(242, 160, 141, 29);
		contentPane.add(backButton);
	}
}
