package schoolClientGUI;

import java.awt.Component;
import java.awt.Dimension;
import java.awt.TrayIcon.MessageType;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;

import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

public class NewStudentDialog extends JDialog 
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1457252257998260709L;
	private JTextField firstName;
	private JTextField lastName;
	private JLabel firstNameLabel;
	private JLabel lastNameLabel;
	private JButton submitButton;
	private JButton cancelButton;
	
	private Frame parent;
	
	public NewStudentDialog(Frame frame) 
	{
		parent = frame;
		initComponents();
	}

	private void initComponents() 
	{
		firstName = new JTextField();
		lastName = new JTextField();
		firstNameLabel = new JLabel("imię: ");
		lastNameLabel = new JLabel("nazwisko: ");
		submitButton = new JButton("Dodaj");
		cancelButton = new JButton("Anuluj");
		setTitle("Dodaj nowego ucznia");
		setLocationRelativeTo(null);
		
		Dimension size = new Dimension(300, 150);
		setSize(size);
		setMinimumSize(size);
		setMinimumSize(size);
		setPreferredSize(size);
		setResizable(false);
		
		setLayout(new BoxLayout(getContentPane(), BoxLayout.PAGE_AXIS));
		
		Dimension gapSize = new Dimension(50, 10);
		Dimension fieldSize = new Dimension(130, 30);
		
		Box box = new Box(BoxLayout.LINE_AXIS);
		
		firstNameLabel.setAlignmentX(Component.RIGHT_ALIGNMENT);
		lastNameLabel.setAlignmentX(Component.RIGHT_ALIGNMENT);
		
		Box labelBox = new Box(BoxLayout.PAGE_AXIS);
		labelBox.add(Box.createVerticalStrut(20));
		labelBox.add(firstNameLabel);
		labelBox.add(Box.createVerticalStrut(20));
		labelBox.add(lastNameLabel);
		labelBox.add(Box.createVerticalStrut(20));
		labelBox.setAlignmentX(LEFT_ALIGNMENT);
		labelBox.setAlignmentY(Component.CENTER_ALIGNMENT);
		labelBox.setMaximumSize(new Dimension(100, 80));
		box.add(labelBox);
		
		firstName.setSize(fieldSize);
		firstName.setMaximumSize(fieldSize);
		lastName.setSize(fieldSize);
		lastName.setMaximumSize(fieldSize);
		
		Box fieldBox = new Box(BoxLayout.PAGE_AXIS);
		fieldBox.add(Box.createRigidArea(gapSize));
		fieldBox.add(firstName);
		fieldBox.add(Box.createVerticalStrut(10));
		fieldBox.add(lastName);
		fieldBox.add(Box.createRigidArea(gapSize));
		fieldBox.setMaximumSize(new Dimension(150, 80));
		box.add(fieldBox);
		
		submitButton.addActionListener(new ActionListener() 
		{	
			@Override
			public void actionPerformed(ActionEvent e) 
			{
				submitButtonActionPerformed();
			}
		});
		
		cancelButton.addActionListener(new ActionListener() 
		{	
			@Override
			public void actionPerformed(ActionEvent e) 
			{
				cancelButtonActionPerformed();
			}
		});
		
		Box buttonBox = new Box(BoxLayout.LINE_AXIS);
		buttonBox.add(submitButton);
		buttonBox.add(cancelButton);
		
		add(box);
		add(Box.createRigidArea(gapSize));
		add(buttonBox);
		
		setVisible(true);
	}

	protected void cancelButtonActionPerformed() 
	{
		dispose();
	}

	protected void submitButtonActionPerformed() 
	{
		try {
			parent.getBase().addStudent(firstName.getText(), lastName.getText());
		} catch (SQLException e) 
		{
			JOptionPane.showMessageDialog((Component)this, "Błąd bazy danych", "Błąd", JOptionPane.ERROR_MESSAGE);
			e.printStackTrace();
		}
		dispose();
	}
}
