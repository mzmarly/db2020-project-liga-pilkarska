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
import pl.League.DAO.EmployeeDao;
import pl.League.models.Club;
import pl.League.models.Employee;

public class AddEmployeeGui extends JFrame {

	private JPanel contentPane;
	private JTextField firstNameField;
	private JTextField surnameField;
	private JTextField dateField;
	private JTextField clubField;
	private JTextField positionField;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					AddEmployeeGui frame = new AddEmployeeGui();
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
	public AddEmployeeGui() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 503);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel addEmployeeTitle = new JLabel("Add new employe!");
		addEmployeeTitle.setHorizontalAlignment(SwingConstants.CENTER);
		addEmployeeTitle.setForeground(new Color(0, 128, 0));
		addEmployeeTitle.setFont(new Font("Dialog", Font.BOLD | Font.ITALIC, 29));
		addEmployeeTitle.setBackground(new Color(0, 128, 0));
		addEmployeeTitle.setBounds(10, 11, 414, 38);
		contentPane.add(addEmployeeTitle);
		
		JLabel firstNameLabel = new JLabel("First name:");
		firstNameLabel.setHorizontalAlignment(SwingConstants.CENTER);
		firstNameLabel.setFont(new Font("Tahoma", Font.PLAIN, 18));
		firstNameLabel.setBounds(10, 60, 105, 21);
		contentPane.add(firstNameLabel);
		
		firstNameField = new JTextField("");
		firstNameField.setColumns(10);
		firstNameField.setBounds(52, 92, 331, 26);
		contentPane.add(firstNameField);
		
		JLabel surnameLabel = new JLabel("Surname:");
		surnameLabel.setHorizontalAlignment(SwingConstants.CENTER);
		surnameLabel.setFont(new Font("Tahoma", Font.PLAIN, 18));
		surnameLabel.setBounds(10, 129, 105, 21);
		contentPane.add(surnameLabel);
		
		surnameField = new JTextField("");
		surnameField.setColumns(10);
		surnameField.setBounds(52, 161, 331, 26);
		contentPane.add(surnameField);
		
		JLabel dateOfBirthLabel = new JLabel("Date of Birth:");
		dateOfBirthLabel.setHorizontalAlignment(SwingConstants.CENTER);
		dateOfBirthLabel.setFont(new Font("Tahoma", Font.PLAIN, 18));
		dateOfBirthLabel.setBounds(10, 198, 129, 21);
		contentPane.add(dateOfBirthLabel);
		
		dateField = new JTextField("");
		dateField.setColumns(10);
		dateField.setBounds(52, 230, 331, 26);
		contentPane.add(dateField);
		
		JLabel clubLabel = new JLabel("Club:");
		clubLabel.setHorizontalAlignment(SwingConstants.CENTER);
		clubLabel.setFont(new Font("Tahoma", Font.PLAIN, 18));
		clubLabel.setBounds(10, 267, 105, 21);
		contentPane.add(clubLabel);
		
		clubField = new JTextField("");
		clubField.setColumns(10);
		clubField.setBounds(52, 299, 331, 26);
		contentPane.add(clubField);
		
		JLabel lblTypeOfPosition = new JLabel("Type of position:");
		lblTypeOfPosition.setHorizontalAlignment(SwingConstants.CENTER);
		lblTypeOfPosition.setFont(new Font("Tahoma", Font.PLAIN, 18));
		lblTypeOfPosition.setBounds(10, 336, 148, 21);
		contentPane.add(lblTypeOfPosition);
		
		positionField = new JTextField("");
		positionField.setColumns(10);
		positionField.setBounds(52, 368, 331, 26);
		contentPane.add(positionField);
		
		JButton confirmButton = new JButton("Submit");
		confirmButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				EmployeeDao.addEmployee(positionField.getText(),firstNameField.getText(), surnameField.getText(), dateField.getText(), clubField.getText());
				dispose();
				EmployeeGui employeeGui=new EmployeeGui();
				employeeGui.setVisible(true);
		}});
		confirmButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		confirmButton.setBounds(17, 421, 141, 29);
		contentPane.add(confirmButton);
		
		JButton backButton = new JButton("Back");
		backButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				EmployeeGui employeeGui=new EmployeeGui();
				employeeGui.setVisible(true);
			}
		});
		backButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		backButton.setBounds(257, 421, 141, 29);
		contentPane.add(backButton);
	}
}
