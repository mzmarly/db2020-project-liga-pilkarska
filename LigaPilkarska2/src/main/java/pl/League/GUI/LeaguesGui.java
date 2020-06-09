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

public class LeaguesGui extends JFrame {

	private JPanel contentPane;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					LeaguesGui frame = new LeaguesGui();
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
	public LeaguesGui() {
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
		backbutton.setBounds(171, 227, 89, 23);
		contentPane.add(backbutton);
		
		JLabel leaguesTitle = new JLabel("Leagues");
		leaguesTitle.setHorizontalAlignment(SwingConstants.CENTER);
		leaguesTitle.setForeground(new Color(0, 128, 0));
		leaguesTitle.setFont(new Font("Dialog", Font.BOLD | Font.ITALIC, 29));
		leaguesTitle.setBackground(new Color(0, 128, 0));
		leaguesTitle.setBounds(10, 11, 414, 38);
		contentPane.add(leaguesTitle);
		
		JButton addLeagueButton = new JButton("Add new League");
		addLeagueButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				AddLeagueGui addLeagueGui=new AddLeagueGui();
				addLeagueGui.setVisible(true);
			}
		});
		addLeagueButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		addLeagueButton.setBounds(42, 193, 355, 23);
		contentPane.add(addLeagueButton);
		
		JButton findLeagueWithSizeButton = new JButton("Find Leagues with size");
		findLeagueWithSizeButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				LeaguesWithSizeGui sizegui=new LeaguesWithSizeGui();
				sizegui.setVisible(true);
			}
		});
		findLeagueWithSizeButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		findLeagueWithSizeButton.setBounds(42, 131, 355, 23);
		contentPane.add(findLeagueWithSizeButton);
	}

}
