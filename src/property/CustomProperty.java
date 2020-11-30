package property;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

public class CustomProperty {
	
	private String dbName;
	private String userName;
	private String userPassword;
	private CustomProperty properties;
	private final static String propertyFile = "DB.properties";

	public CustomProperty() {
		InputStream is;
		Properties props = new Properties();
		try {
			is = new FileInputStream(propertyFile);
			props.load(is);
			dbName = props.getProperty("dbname");
			userName = props.getProperty("username");
			userPassword = props.getProperty("userpassword");
			is.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public CustomProperty getCustomProperty() {
		if(properties == null) {
			properties = new CustomProperty();
		}
		return properties;
	}
	
	public String getDbName() {
		return dbName;
	}

	public String getUserName() {
		return userName;
	}

	public String getUserPassword() {
		return userPassword;
	}
}
