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

import pl.League.DAO.PlayerDao;
import pl.League.models.Player;

public class EmployeeFromClubGui extends JFrame {

	private JPanel contentPane;
	private JTextField clubNameField;
	private JTable playersValueTable;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					EmployeeFromClubGui frame = new EmployeeFromClubGui();
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
	public EmployeeFromClubGui() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 600);
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
				List<Player> mostValuablePlayers=PlayerDao.mostValuablePlayersFromClub(clubNameField.getText());
				for(Player p:mostValuablePlayers) {
					//DOKONCZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ+
				}
			}});
		confirmButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		confirmButton.setBounds(10, 504, 141, 29);
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
		backButton.setBounds(283, 504, 141, 29);
		contentPane.add(backButton);
		
		playersValueTable = new JTable();
		playersValueTable.setToolTipText("");
		playersValueTable.setForeground(Color.BLACK);
		playersValueTable.setModel(new DefaultTableModel(
			new Object[][] {
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
				{null, null, null, null, null, null},
			},
			new String[] {
				"Market Value", "FirstName", "Born Date", "Position", "Foot", "Country"
			}
		) {
			Class[] columnTypes = new Class[] {
				Long.class, String.class, String.class, String.class, String.class, String.class
			};
			public Class getColumnClass(int columnIndex) {
				return columnTypes[columnIndex];
			}
		});
		playersValueTable.setBounds(52, 442, 314, -294);
		contentPane.add(playersValueTable);
	}
}
