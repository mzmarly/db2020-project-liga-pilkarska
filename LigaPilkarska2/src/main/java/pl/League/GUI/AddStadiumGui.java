package pl.League.GUI;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import pl.League.DAO.StadiumDao;

import javax.swing.JLabel;
import java.awt.Color;
import java.awt.Font;
import javax.swing.SwingConstants;
import javax.swing.JTextField;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class AddStadiumGui extends JFrame {

	private JPanel contentPane;
	private JTextField stadiumNameField;
	private JTextField stadiumAdressField;
	private JTextField clubField;
	private JTextField capacityField;
	private JTextField dateOfBuiltField;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					AddStadiumGui frame = new AddStadiumGui();
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
	public AddStadiumGui() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 554);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel addStadiumLabel = new JLabel("Add new Stadium");
		addStadiumLabel.setHorizontalAlignment(SwingConstants.CENTER);
		addStadiumLabel.setForeground(new Color(0, 128, 0));
		addStadiumLabel.setFont(new Font("Dialog", Font.BOLD | Font.ITALIC, 29));
		addStadiumLabel.setBackground(new Color(0, 128, 0));
		addStadiumLabel.setBounds(10, 11, 414, 38);
		contentPane.add(addStadiumLabel);
		
		JLabel stadiumNameLabel = new JLabel("Stadium name:");
		stadiumNameLabel.setHorizontalAlignment(SwingConstants.CENTER);
		stadiumNameLabel.setFont(new Font("Tahoma", Font.PLAIN, 18));
		stadiumNameLabel.setBounds(20, 60, 132, 21);
		contentPane.add(stadiumNameLabel);
		
		stadiumNameField = new JTextField("");
		stadiumNameField.setColumns(10);
		stadiumNameField.setBounds(60, 92, 331, 26);
		contentPane.add(stadiumNameField);
		
		JLabel stadiumAdressLable = new JLabel("Adress:");
		stadiumAdressLable.setHorizontalAlignment(SwingConstants.CENTER);
		stadiumAdressLable.setFont(new Font("Tahoma", Font.PLAIN, 18));
		stadiumAdressLable.setBounds(20, 129, 132, 21);
		contentPane.add(stadiumAdressLable);
		
		stadiumAdressField = new JTextField("");
		stadiumAdressField.setColumns(10);
		stadiumAdressField.setBounds(60, 161, 331, 26);
		contentPane.add(stadiumAdressField);
		
		JLabel clubLabel = new JLabel("Club:");
		clubLabel.setHorizontalAlignment(SwingConstants.CENTER);
		clubLabel.setFont(new Font("Tahoma", Font.PLAIN, 18));
		clubLabel.setBounds(20, 198, 132, 21);
		contentPane.add(clubLabel);
		
		clubField = new JTextField("");
		clubField.setColumns(10);
		clubField.setBounds(60, 230, 331, 26);
		contentPane.add(clubField);
		
		JLabel capacityLabel = new JLabel("Capacity:");
		capacityLabel.setHorizontalAlignment(SwingConstants.CENTER);
		capacityLabel.setFont(new Font("Tahoma", Font.PLAIN, 18));
		capacityLabel.setBounds(20, 267, 132, 21);
		contentPane.add(capacityLabel);
		
		capacityField = new JTextField("");
		capacityField.setColumns(10);
		capacityField.setBounds(60, 299, 331, 26);
		contentPane.add(capacityField);
		
		JLabel dateOfBuildLabel = new JLabel("Date of built:");
		dateOfBuildLabel.setHorizontalAlignment(SwingConstants.CENTER);
		dateOfBuildLabel.setFont(new Font("Tahoma", Font.PLAIN, 18));
		dateOfBuildLabel.setBounds(20, 336, 129, 21);
		contentPane.add(dateOfBuildLabel);
		
		dateOfBuiltField = new JTextField("");
		dateOfBuiltField.setColumns(10);
		dateOfBuiltField.setBounds(60, 368, 331, 26);
		contentPane.add(dateOfBuiltField);
		
		JButton confirmButton = new JButton("Submit");
		confirmButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				StadiumDao.addStadium(stadiumNameField.getText(), stadiumAdressField.getText(), capacityField.getText(), clubField.getText(), dateOfBuiltField.getText());
			}
		});
		confirmButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		confirmButton.setBounds(20, 429, 165, 29);
		contentPane.add(confirmButton);
		
		JButton backButton = new JButton("Back");
		backButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		backButton.setBounds(266, 429, 158, 29);
		contentPane.add(backButton);
	}
}
