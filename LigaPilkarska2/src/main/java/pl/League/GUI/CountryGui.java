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

public class CountryGui extends JFrame {

	private JPanel contentPane;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					CountryGui frame = new CountryGui();
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
	public CountryGui() {
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
				Main mainGui=new Main();
				mainGui.setVisible(true);
			}
		});
		backbutton.setFont(new Font("Tahoma", Font.PLAIN, 18));
		backbutton.setBounds(181, 227, 89, 23);
		contentPane.add(backbutton);
		
		JLabel countryTitle = new JLabel("Countries");
		countryTitle.setHorizontalAlignment(SwingConstants.CENTER);
		countryTitle.setForeground(new Color(0, 128, 0));
		countryTitle.setFont(new Font("Dialog", Font.BOLD | Font.ITALIC, 29));
		countryTitle.setBackground(new Color(0, 128, 0));
		countryTitle.setBounds(10, 11, 414, 38);
		contentPane.add(countryTitle);
		
		JButton addCountryButton = new JButton("Add new Employee");
		addCountryButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				AddCountryGui addcountrygui=new AddCountryGui();
				addcountrygui.setVisible(true);
			}
		});
		addCountryButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		addCountryButton.setBounds(39, 193, 355, 23);
		contentPane.add(addCountryButton);
	}

}
