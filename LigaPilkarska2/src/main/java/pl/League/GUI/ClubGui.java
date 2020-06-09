package pl.League.GUI;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JButton;
import java.awt.Font;
import javax.swing.JLabel;
import java.awt.Color;
import javax.swing.SwingConstants;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class ClubGui extends JFrame {

	private JPanel contentPane;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					ClubGui frame = new ClubGui();
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
	public ClubGui() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 300);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JButton backbutton = new JButton("Back");
		backbutton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				Main main=new Main();
				main.setVisible(true);
			}
		});
		backbutton.setFont(new Font("Tahoma", Font.PLAIN, 18));
		backbutton.setBounds(174, 227, 89, 23);
		contentPane.add(backbutton);
		
		JLabel ClubTitle = new JLabel("Clubs");
		ClubTitle.setHorizontalAlignment(SwingConstants.CENTER);
		ClubTitle.setForeground(new Color(0, 128, 0));
		ClubTitle.setFont(new Font("Dialog", Font.BOLD | Font.ITALIC, 29));
		ClubTitle.setBackground(new Color(0, 128, 0));
		ClubTitle.setBounds(10, 11, 414, 38);
		contentPane.add(ClubTitle);
		
		JButton addClubButton = new JButton("Add new Club");
		addClubButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				AddClubGui addClub=new AddClubGui();
				addClub.setVisible(true);
			}
		});
		addClubButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		addClubButton.setBounds(41, 195, 355, 23);
		contentPane.add(addClubButton);
		
		JButton clubValueButton = new JButton("Calculate club value");
		clubValueButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				ClubValueGui clubValue=new ClubValueGui();
				clubValue.setVisible(true);;
			}
		});
		clubValueButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		clubValueButton.setBounds(41, 60, 355, 23);
		contentPane.add(clubValueButton);
		
		JButton maxValuableClubsbutton = new JButton("Top 10 most valuable players in club");
		maxValuableClubsbutton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				MostValuablePlayersInClubGui mostvaluable=new MostValuablePlayersInClubGui();
				mostvaluable.setVisible(true);
			}
		});
		maxValuableClubsbutton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		maxValuableClubsbutton.setBounds(41, 94, 355, 23);
		contentPane.add(maxValuableClubsbutton);
	}
}
