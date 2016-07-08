//to add sqljdbc4.jar into eclipse, please refer to 
//http://zhidao.baidu.com/link?url=zrmncXcICvIkPoaMlo4gRR_YQY5bLe8Urepp1Fh4TKVNG_bejZsBdzsZm_5SGF__jttkq0GWGCAGxmpsheZrR_

//if connection still fails, you may check the settings in sql
//http://www.360doc.com/content/13/1119/21/14602453_330603496.shtml, in which SQL Server Configuration Manager means SQL Server ≈‰÷√π‹¿Ì∆˜

import java.sql.Connection;    
import java.sql.DriverManager;    
import java.sql.ResultSet;    
import java.sql.Statement;

import java.util.Vector;
import javax.swing.table.DefaultTableModel;
import javax.swing.JFrame;
import javax.swing.JTable;

public class sqllink 
{
	private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=Exercise";
	private static final String USER = "sa";
	private static final String PASSWORD = "**********";
	
    public static void main(String args[]) 
	{    
		try
		{
			// Create a variable for the connection string.    			
			Class.forName(DRIVER);
			Connection connection = DriverManager.getConnection(URL,USER,PASSWORD);
        	Statement statement = connection.createStatement();  
    
        	// Create and execute an SQL statement that returns some data.    
        	String SQL = "SELECT * FROM CUSTOMERS";    
        	statement = connection.createStatement();    
        	ResultSet rs = statement.executeQuery(SQL);    
    
        	//make a UI table
        	JFrame frame=new JFrame("CUSTOMERS");
        	//Table_Model model=new Table_Model(20);
        	Vector<String> columnNames = new Vector<String>();
        	columnNames.add("ID");
        	columnNames.add("NAME");
        	columnNames.add("AGE");
        	columnNames.add("ADDRESS");
        	columnNames.add("SALARY");
        	Vector<Vector<Object>> rowData = new Vector<Vector<Object>>();
        	while(rs.next())
        	{
        		Vector<Object> info = new Vector<Object>();
        		for(int i=1;i<=rs.getMetaData().getColumnCount();i++)
        			info.add(rs.getString(i));
        		rowData.add(info);
        	}
        	JTable table = new JTable(new DefaultTableModel(rowData,columnNames));
        	frame.add(table);
        	frame.setSize(500,300);
        	frame.setLocationRelativeTo(null);
        	frame.setVisible(true);
        	frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        	
        	// Iterate through the data in the result set and display it.    
        	/*while (rs.next())  
			{
        		for(int i=1;i<=rs.getMetaData().getColumnCount();i++)
        			System.out.print(rs.getString(i)+"\t");
        		System.out.println();
        	}*/
        }
		catch(Exception e)
        {
			e.printStackTrace(); 
        }
	}			
}    