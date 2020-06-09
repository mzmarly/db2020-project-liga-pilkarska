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

public class EmployeeGui extends JFrame {

	private JPanel contentPane;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					EmployeeGui frame = new EmployeeGui();
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
	public EmployeeGui() {
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
		backbutton.setBounds(181, 227, 89, 23);
		contentPane.add(backbutton);
		
		JLabel employeesTitle = new JLabel("Employees");
		employeesTitle.setHorizontalAlignment(SwingConstants.CENTER);
		employeesTitle.setForeground(new Color(0, 128, 0));
		employeesTitle.setFont(new Font("Dialog", Font.BOLD | Font.ITALIC, 29));
		employeesTitle.setBackground(new Color(0, 128, 0));
		employeesTitle.setBounds(10, 11, 414, 38);
		contentPane.add(employeesTitle);
		
		JButton addEmployeeButton = new JButton("Add new Employee");
		addEmployeeButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				AddEmployeeGui addEmployeeGui=new AddEmployeeGui();
				addEmployeeGui.setVisible(true);
			}
		});
		addEmployeeButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		addEmployeeButton.setBounds(39, 193, 355, 23);
		contentPane.add(addEmployeeButton);
		
		JButton findEmployeeByClubButton = new JButton("Search an employee from the club");
		findEmployeeByClubButton.setFont(new Font("Tahoma", Font.PLAIN, 17));
		findEmployeeByClubButton.setBounds(39, 159, 355, 23);
		contentPane.add(findEmployeeByClubButton);
	}
}
