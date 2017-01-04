/**
 * 
 */
package schoolClient;

import java.awt.EventQueue;
import java.sql.SQLException;

import javax.swing.UIManager;
import javax.swing.UIManager.LookAndFeelInfo;

import schoolClientGUI.Frame;

/**
 * @author mk
 *
 */
public class SchoolClient {

	/**
	 * @param args
	 */
	public static void main(String[] args) 
	{
		 EventQueue.invokeLater(new Runnable() 
	        {
	            @Override
	            public void run() 
	            {

	            try {
	                for (LookAndFeelInfo info : UIManager.getInstalledLookAndFeels()) {
	                    if ("Nimbus".equals(info.getName())) {
	                        UIManager.setLookAndFeel(info.getClassName());
	                        break;
	                    }
	                }
	            } catch (Exception e) { }
	            try {
					SQLAccess base = new SQLAccess("root", "");
					new Frame(base);
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	            
	
	            }
	        });     
	}

}
