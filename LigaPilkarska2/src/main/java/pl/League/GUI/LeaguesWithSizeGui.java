package pl.League.GUI;

import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;

import pl.League.DAO.LeaguesDao;
import pl.League.models.Leagues;
import pl.League.models.Player;
import javax.swing.JTextPane;

public class LeaguesWithSizeGui extends JFrame {

	private JPanel contentPane;
	private JTextField sizeField;
	private JTextField textField;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					LeaguesWithSizeGui frame = new LeaguesWithSizeGui();
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
	public LeaguesWithSizeGui() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 324);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel clubValueTitle = new JLabel("Find Leagues with size");
		clubValueTitle.setHorizontalAlignment(SwingConstants.CENTER);
		clubValueTitle.setForeground(new Color(0, 128, 0));
		clubValueTitle.setFont(new Font("Dialog", Font.BOLD | Font.ITALIC, 32));
		clubValueTitle.setBackground(new Color(0, 128, 0));
		clubValueTitle.setBounds(10, 11, 414, 38);
		contentPane.add(clubValueTitle);
		
		JLabel clubNameLabel = new JLabel("Type least number of clubs in the league");
		clubNameLabel.setHorizontalAlignment(SwingConstants.CENTER);
		clubNameLabel.setFont(new Font("Tahoma", Font.PLAIN, 18));
		clubNameLabel.setBounds(52, 79, 323, 21);
		contentPane.add(clubNameLabel);
		
		sizeField = new JTextField("");
		sizeField.setColumns(10);
		sizeField.setBounds(52, 122, 331, 26);
		contentPane.add(sizeField);
		
		JButton confirmButton = new JButton("Submit");
		confirmButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				List<Leagues> leaguesWithSize=LeaguesDao.findLeaguesWithSize(sizeField.getText());
				StringBuilder sb=new StringBuilder();
				for(int i=0;i<leaguesWithSize.size();i++) {
					sb.append(leaguesWithSize.get(i).getName_league()+"    ");
				}
				textField.setText(sb.toString());

				
				
			}});
		confirmButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		confirmButton.setBounds(10, 241, 141, 29);
		contentPane.add(confirmButton);
		
		JButton backButton = new JButton("Back");
		backButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				LeaguesGui leaguesGui=new LeaguesGui();
				leaguesGui.setVisible(true);
			}
		});
		backButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		backButton.setBounds(283, 241, 141, 29);
		contentPane.add(backButton);
		
		textField = new JTextField();
		textField.setEditable(false);
		textField.setBounds(52, 159, 323, 48);
		contentPane.add(textField);
		textField.setColumns(10);
	}
}
