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

public class ClubValueGui extends JFrame {

	private JPanel contentPane;
	private JTextField clubNameField;
	private JTextField valueField;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					ClubValueGui frame = new ClubValueGui();
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
	public ClubValueGui() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 339);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel clubValueTitle = new JLabel("Calculate club value");
		clubValueTitle.setHorizontalAlignment(SwingConstants.CENTER);
		clubValueTitle.setForeground(new Color(0, 128, 0));
		clubValueTitle.setFont(new Font("Dialog", Font.BOLD | Font.ITALIC, 29));
		clubValueTitle.setBackground(new Color(0, 128, 0));
		clubValueTitle.setBounds(10, 11, 414, 38);
		contentPane.add(clubValueTitle);
		
		JLabel clubNameLabel = new JLabel("Club name:");
		clubNameLabel.setHorizontalAlignment(SwingConstants.CENTER);
		clubNameLabel.setFont(new Font("Tahoma", Font.PLAIN, 18));
		clubNameLabel.setBounds(10, 60, 169, 21);
		contentPane.add(clubNameLabel);
		
		clubNameField = new JTextField("");
		clubNameField.setColumns(10);
		clubNameField.setBounds(52, 92, 331, 26);
		contentPane.add(clubNameField);
		
		JButton confirmButton = new JButton("Submit");
		confirmButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				long value=ClubDao.teamValue(clubNameField.getText());
				valueField.setText(String.valueOf(value));
			}});
		confirmButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		confirmButton.setBounds(10, 232, 141, 29);
		contentPane.add(confirmButton);
		
		JButton backButton = new JButton("Back");
		backButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				ClubGui conuntryGui=new ClubGui();
				conuntryGui.setVisible(true);
			}
		});
		backButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		backButton.setBounds(283, 232, 141, 29);
		contentPane.add(backButton);
		
		valueField = new JTextField();
		valueField.setEditable(false);
		valueField.setBounds(119, 159, 203, 38);
		contentPane.add(valueField);
		valueField.setColumns(10);
	}
}
