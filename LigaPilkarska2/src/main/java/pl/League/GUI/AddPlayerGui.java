package pl.League.GUI;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import pl.League.DAO.PlayerDao;

import javax.swing.JLabel;
import java.awt.Color;
import java.awt.Font;
import javax.swing.SwingConstants;
import javax.swing.JTextField;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class AddPlayerGui extends JFrame {

	private JPanel contentPane;
	private JTextField firstNameField;
	private JTextField surnameField;
	private JTextField dateOfBithField;
	private JTextField clubField;
	private JTextField nationalityField;
	private JTextField valueField;
	private JTextField positionField;
	private JTextField footField;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					AddPlayerGui frame = new AddPlayerGui();
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
	public AddPlayerGui() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 752);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel addPlayerTitle = new JLabel("Add new player!");
		addPlayerTitle.setHorizontalAlignment(SwingConstants.CENTER);
		addPlayerTitle.setForeground(new Color(0, 128, 0));
		addPlayerTitle.setFont(new Font("Dialog", Font.BOLD | Font.ITALIC, 29));
		addPlayerTitle.setBackground(new Color(0, 128, 0));
		addPlayerTitle.setBounds(10, 11, 414, 38);
		contentPane.add(addPlayerTitle);
		
		JLabel firstNameLabel = new JLabel("First name:");
		firstNameLabel.setHorizontalAlignment(SwingConstants.CENTER);
		firstNameLabel.setFont(new Font("Tahoma", Font.PLAIN, 18));
		firstNameLabel.setBounds(10, 60, 105, 21);
		contentPane.add(firstNameLabel);
		
		firstNameField = new JTextField("");
		firstNameField.setColumns(10);
		firstNameField.setBounds(49, 92, 331, 26);
		contentPane.add(firstNameField);
		
		JLabel surnameLabel = new JLabel("Surname:");
		surnameLabel.setHorizontalAlignment(SwingConstants.CENTER);
		surnameLabel.setFont(new Font("Tahoma", Font.PLAIN, 18));
		surnameLabel.setBounds(10, 129, 105, 21);
		contentPane.add(surnameLabel);
		
		surnameField = new JTextField("");
		surnameField.setColumns(10);
		surnameField.setBounds(49, 161, 331, 26);
		contentPane.add(surnameField);
		
		JLabel dateOfBirthLabel = new JLabel("Date of Birth:");
		dateOfBirthLabel.setHorizontalAlignment(SwingConstants.CENTER);
		dateOfBirthLabel.setFont(new Font("Tahoma", Font.PLAIN, 18));
		dateOfBirthLabel.setBounds(10, 198, 129, 21);
		contentPane.add(dateOfBirthLabel);
		
		dateOfBithField = new JTextField("");
		dateOfBithField.setColumns(10);
		dateOfBithField.setBounds(49, 230, 331, 26);
		contentPane.add(dateOfBithField);
		
		JLabel clubLabel = new JLabel("Club:");
		clubLabel.setHorizontalAlignment(SwingConstants.CENTER);
		clubLabel.setFont(new Font("Tahoma", Font.PLAIN, 18));
		clubLabel.setBounds(10, 267, 105, 21);
		contentPane.add(clubLabel);
		
		clubField = new JTextField("");
		clubField.setColumns(10);
		clubField.setBounds(49, 299, 331, 26);
		contentPane.add(clubField);
		
		
		JLabel nationalityLabell = new JLabel("Nationality:");
		nationalityLabell.setHorizontalAlignment(SwingConstants.CENTER);
		nationalityLabell.setFont(new Font("Tahoma", Font.PLAIN, 18));
		nationalityLabell.setBounds(10, 336, 105, 21);
		contentPane.add(nationalityLabell);
		
		nationalityField = new JTextField("");
		nationalityField.setColumns(10);
		nationalityField.setBounds(49, 368, 331, 26);
		contentPane.add(nationalityField);
		
		JLabel valueLabel = new JLabel("Value:");
		valueLabel.setHorizontalAlignment(SwingConstants.CENTER);
		valueLabel.setFont(new Font("Tahoma", Font.PLAIN, 18));
		valueLabel.setBounds(10, 405, 105, 21);
		contentPane.add(valueLabel);
		
		valueField = new JTextField("");
		valueField.setColumns(10);
		valueField.setBounds(49, 437, 331, 26);
		contentPane.add(valueField);
		
		JLabel positionLabel = new JLabel("Position:");
		positionLabel.setHorizontalAlignment(SwingConstants.CENTER);
		positionLabel.setFont(new Font("Tahoma", Font.PLAIN, 18));
		positionLabel.setBounds(10, 474, 105, 21);
		contentPane.add(positionLabel);
		
		positionField = new JTextField("");
		positionField.setColumns(10);
		positionField.setBounds(49, 506, 331, 26);
		contentPane.add(positionField);
		
		JLabel footLabel = new JLabel("Foot:");
		footLabel.setHorizontalAlignment(SwingConstants.CENTER);
		footLabel.setFont(new Font("Tahoma", Font.PLAIN, 18));
		footLabel.setBounds(10, 543, 105, 21);
		contentPane.add(footLabel);
		
		footField = new JTextField("");
		footField.setColumns(10);
		footField.setBounds(49, 575, 331, 26);
		contentPane.add(footField);
		
		JButton confirmButton = new JButton("Submit");
		confirmButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				PlayerDao.addPlayer(firstNameField.getText(), surnameField.getText(), positionField.getText(), footField.getText(), valueField.getText(), clubField.getText(), nationalityField.getText(), dateOfBithField.getText());
				dispose();
				PlayerGui playerGui=new PlayerGui();
				playerGui.setVisible(true);
			}
		});
		confirmButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		confirmButton.setBounds(49, 642, 141, 29);
		contentPane.add(confirmButton);
		
		JButton backButton = new JButton("Back");
		backButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				PlayerGui playerGui=new PlayerGui();
				playerGui.setVisible(true);
			}
		});
		backButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		backButton.setBounds(239, 642, 141, 29);
		contentPane.add(backButton);
	}
}
