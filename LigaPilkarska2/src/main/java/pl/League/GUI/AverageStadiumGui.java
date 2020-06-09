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
import pl.League.DAO.StadiumDao;
import pl.League.models.Player;

public class AverageStadiumGui extends JFrame {

	private JPanel contentPane;
	private JTextField textField;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					AverageStadiumGui frame = new AverageStadiumGui();
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
	public AverageStadiumGui() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 290);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel averageTitle = new JLabel("Average of stadiums capacity");
		averageTitle.setHorizontalAlignment(SwingConstants.CENTER);
		averageTitle.setForeground(new Color(0, 128, 0));
		averageTitle.setFont(new Font("Dialog", Font.BOLD | Font.ITALIC, 20));
		averageTitle.setBackground(new Color(0, 128, 0));
		averageTitle.setBounds(10, 11, 414, 74);
		contentPane.add(averageTitle);
		
		JButton backButton = new JButton("Back");
		backButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				StadiumGui stadiumGui=new StadiumGui();
				stadiumGui.setVisible(true);
			}
		});
		backButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		backButton.setBounds(149, 204, 141, 29);
		contentPane.add(backButton);
		
		textField = new JTextField();
		textField.setEditable(false);
		textField.setColumns(10);
		textField.setBounds(114, 108, 203, 38);
		contentPane.add(textField);
		textField.setText(String.valueOf(StadiumDao.averageOfStadiumsCapacity()));
	}
}
