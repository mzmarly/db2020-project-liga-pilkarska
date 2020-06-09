package pl.League.GUI;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import java.awt.Color;
import java.awt.Font;
import javax.swing.SwingConstants;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class PlayerGui extends JFrame {

	private JPanel contentPane;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					PlayerGui frame = new PlayerGui();
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
	public PlayerGui() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 337);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel playerTitle = new JLabel("Players");
		playerTitle.setHorizontalAlignment(SwingConstants.CENTER);
		playerTitle.setForeground(new Color(0, 128, 0));
		playerTitle.setFont(new Font("Dialog", Font.BOLD | Font.ITALIC, 29));
		playerTitle.setBackground(new Color(0, 128, 0));
		playerTitle.setBounds(10, 11, 414, 38);
		contentPane.add(playerTitle);
		
		JButton addPlayerButton = new JButton("Add new player");
		addPlayerButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				AddPlayerGui addPlayerGui=new AddPlayerGui();
				addPlayerGui.setVisible(true);
			}
		});
		addPlayerButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		addPlayerButton.setBounds(46, 218, 355, 23);
		contentPane.add(addPlayerButton);
		
		JButton backbutton = new JButton("Back");
		backbutton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				Main main=new Main();
				main.setVisible(true);
			}
		});
		backbutton.setFont(new Font("Tahoma", Font.PLAIN, 18));
		backbutton.setBounds(172, 252, 89, 23);
		contentPane.add(backbutton);
	}
}
