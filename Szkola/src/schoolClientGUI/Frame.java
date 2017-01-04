package schoolClientGUI;

import java.awt.Dimension;

import javax.swing.JFrame;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

import schoolClient.SQLAccess;

public class Frame extends JFrame 
{
	private SQLAccess base;

	public Frame(SQLAccess base)
	{
		this.base = base;
		initComponents();
	}
	
	private void initComponents()
	{
		try { UIManager.setLookAndFeel("javax.swing.plaf.metal.MetalLookAndFeel");}
        catch (UnsupportedLookAndFeelException ex) { ex.printStackTrace(); }
        catch (IllegalAccessException ex) { ex.printStackTrace(); } 
        catch (InstantiationException ex) { ex.printStackTrace(); }
        catch (ClassNotFoundException ex) { ex.printStackTrace(); }
        UIManager.put("swing.boldMetal", Boolean.FALSE); 

	    this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		Dimension frameSize = new Dimension(800, 600);
		setSize(frameSize);
		setMinimumSize(frameSize);
		setVisible(true);
		
		new NewStudentDialog(this);
	}
	
	public SQLAccess getBase() { return base; }
}
