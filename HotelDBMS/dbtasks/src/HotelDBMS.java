import java.sql.*;
import java.sql.DriverManager;
import java.util.*;
import java.util.Scanner;

public class HotelDBMS {

	
	static  String DB_URL = "jdbc:postgresql://10.98.98.61:5432/group10";
	static  String JDBC_DRIVER = "org.postgresql.Driver";
	static  String USER = "group10";
	static  String PASS = "EPzBF*t2mM&$7%sx";
	static int decision;
	static ResultSet listTable;
	Scanner scan = new Scanner(System.in);

	public Connection getConnection() {
		Connection connection = null;

		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e) {
			System.out.println("Error occured while invoking the driver");
			e.printStackTrace();
		}
		try {
			connection = DriverManager.getConnection(DB_URL, USER, PASS);
		} catch (SQLException e) {
			System.out.println("Error occured while connecting");
			e.printStackTrace();
		}
		return connection;
	}

	private static void printResultSet(ResultSet listTable) throws SQLException {
		ResultSetMetaData read = listTable.getMetaData();
		int columnNumber = read.getColumnCount();
		while (listTable.next()) {
			for (int i = 1; i <= columnNumber; i++) {
				System.out.print(listTable.getString(i) + " ");
			}
			System.out.print("\n");
		}

	}

	public void insertRecordsCustomers() {
		Scanner scan = new Scanner(System.in);
		System.out.println("Customer ID:");
		String Customer = scan.nextLine();
		System.out.println("Name:");
		String Name = scan.nextLine();
		System.out.println("Surname:");
		String Surname = scan.nextLine();
		System.out.println("Birhtday:");
		String Birhtday = scan.nextLine();
		System.out.println("Email:");
		String Email = scan.nextLine();
		System.out.println("Phone Number:");
		String phoneNumber = scan.nextLine();
		System.out.println("Town:");
		String Town = scan.nextLine();
		System.out.println("Country:");
		String Country = scan.nextLine();

		Statement statement = null;
		Connection newConnection = getConnection();
		System.out.println("Inserting records into the Customers table...");
		try {

			statement = newConnection.createStatement();
			String sql = "INSERT INTO customers " + "VALUES (" + Customer + ", '" + Name + "', '" + Surname + "','"
					+ Birhtday + "','" + Email + "','" + phoneNumber + "','" + Town + "','" + Country + "')";
			statement.executeUpdate(sql);
			System.out.println("Record inserted ...");
			newConnection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}



	public void updateRecordsReservationResult() {
		Statement statement = null;
		Connection newConnection = getConnection();
		System.out.println("Write the Reservation Result ID that you want to update the customer comment of:");
		String RESULT_ID = scan.nextLine();
		System.out.println("Customer Comment:");
		String job = scan.nextLine();
		System.out.println("Update Operation");
		try {
			statement = newConnection.createStatement();
			String sql = "UPDATE Reservation_Result set " + "CUSTOMER_COMMENT = '" + job + "'" + " where RESULT_ID = '"
					+ RESULT_ID + "'";
			statement.executeUpdate(sql);
			System.out.println("Updated the records ...");
			newConnection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	public void deleteRecordsDepartment() {
		Statement statement = null;
		Connection newConnection = getConnection();

		System.out.println("Write the Department ID that you want to be deleted:");
		String departmentID = scan.nextLine();
		System.out.println("Delete Operation");
		try {
			statement = newConnection.createStatement();
			String sql = "delete from DEPARTMENTS " + "where DEP_ID = " + departmentID + "";
			statement.executeUpdate(sql);
			System.out.println("Record deleted ...");
			newConnection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void listRecordsCustomers() {
		Statement statement = null;
		Connection newConnection = getConnection();
		System.out.println("List Operation of Customers Table");
		try {
			statement = newConnection.createStatement();
			String sql = "SELECT * FROM Customers";
			listTable = statement.executeQuery(sql);
			printResultSet(listTable);
			System.out.println("Listed the records as requested");
			newConnection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	public void listRecordsHotels() {
		Statement statement = null;
		Connection newConnection = getConnection();
		System.out.println("List Operation of Hotels Table");
		try {
			statement = newConnection.createStatement();
			String sql = "SELECT * FROM HOTELS";
			listTable = statement.executeQuery(sql);
			printResultSet(listTable);
			System.out.println("Listed the records as requested");
			newConnection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		HotelDBMS dataBaseOperations = new HotelDBMS();
	
		int decision;
		int firstGate=-1;
		do {
			if(firstGate==-1) {
			System.out.println("Welcome to Database Operations ");
			System.out.println("1. Insert Operation");
			System.out.println("2. Update Operation");
			System.out.println("3. Delete Operation");
			System.out.println("4. List Operation");
			System.out.println("5. Exit");
			firstGate=0;
			
			}
			else {
		System.out.println("****************************");		
				System.out.println("1. Insert Operation");
				System.out.println("2. Update Operation");
				System.out.println("3. Delete Operation");
				System.out.println("4. List Operation");
				System.out.println("5. Exit");
				
			}
				
			System.out.println("Choose one of the operations above: ");
			decision = scan.nextInt();
			switch (decision) {
			case 1:
				System.out.println("You chose DB Insert");
				System.out.println("Please select the correct table that you want to insert");
				System.out.println("1-Hotels(Not covered in demo application)");
				System.out.println("2-Hotel Room Type(Not covered in demo application)");
				System.out.println("3-Hotel Rooms(Not covered in demo application)");
				System.out.println("4-Departments(Not covered in demo application)");
				System.out.println("5-Employees(Not covered in demo application)");
				System.out.println("6-Customers");
				System.out.println("7-Reservations(Not covered in demo application)");
				System.out.println("8-Reservations Results(Not covered in demo application)");
				decision = scan.nextInt();
				switch (decision) {
				case 1:
					System.out.println("As being said, this is demo application and Hotels table has not been covered.");
					break;
				case 2:
					System.out.println("As being said, this is demo application and Hotel Room Type table has not been covered.");
					break;
				case 3:
					System.out.println("As being said, this is demo application and Hotel Rooms table has not been covered.");
					break;
				case 4:
					System.out.println("This specific function is not covered in the demo application");
					break;
				case 5:
					System.out.println("As being said, this is demo application and Employees has not been covered.");
					break;
				case 6:
					dataBaseOperations.insertRecordsCustomers();
					break;
				case 7:
				case 8:
					System.out.println("Not covered on demo application");
					break;
				}

				break;

			case 2:
				System.out.println("You chose to Update(Not covered in demo application)");
				System.out.println("Please select the correct table that you want to update(Not covered in demo application)");
				System.out.println("1-Hotels(Not covered in demo application)");
				System.out.println("2-Hotel Room Type(Not covered in demo application)");
				System.out.println("3-Hotel Rooms(Not covered in demo application)");
				System.out.println("4-Departments(Not covered in demo application)");
				System.out.println("5-Employees(Not covered in demo application)");
				System.out.println("6-Customers(Not covered in demo application)");
				System.out.println("7-Reservations(Not covered in demo application)");
				System.out.println("8-Reservations Results");
				decision = scan.nextInt();
				switch (decision) {
				case 1:
					System.out.println("As being said, this is demo application and Hotels table has not been covered.");
					break;
				case 2:
					System.out.println("As being said, this is demo application and Hotel Room Type table has not been covered.");
					break;
				case 3:
					System.out.println("As being said, this is demo application and Hotel Rooms table has not been covered.");
					break;
				case 4:
					System.out.println("This specific function is not covered in the demo application");
					break;
				case 5:
					System.out.println("As being said, this is demo application and Employees has not been covered.");
					break;
				case 6:
					System.out.println("As being said, this is demo application and Customers table has not been covered.");
					break;
				case 7:
					System.out.println("As being said, this is demo application and Reservations table has not been covered.");	
					break;
				case 8:
					dataBaseOperations.updateRecordsReservationResult();
					break;
				}
				break;

			case 3:
				System.out.println("You chose to Delete");
				System.out.println("Please select the correct table that you want to delete");
				System.out.println("1-Hotels(Not covered in demo application)");
				System.out.println("2-Hotel Room Type(Not covered in demo application)");
				System.out.println("3-Hotel Rooms(Not covered in demo application)");
				System.out.println("4-Departments");
				System.out.println("5-Employees(Not covered in demo application)");
				System.out.println("6-Customers(Not covered in demo application)");
				System.out.println("7-Reservations(Not covered in demo application)");
				System.out.println("8-Reservations Results(Not covered in demo application)");
				decision = scan.nextInt();
				switch (decision) {
				case 1:
					System.out.println("As being said, this is demo application and Hotels table has not been covered.");
					break;
				case 2:
					System.out.println("As being said, this is demo application and Hotel Room Type table has not been covered.");
					break;
				case 3:
					System.out.println("As being said, this is demo application and Hotel Rooms table has not been covered.");
					break;
				case 4:
					dataBaseOperations.deleteRecordsDepartment();
					break;
				case 5:
					System.out.println("As being said, this is demo application and Employees has not been covered.");
					break;
				case 6:
					System.out.println("As being said, this is demo application and Customers table has not been covered.");
					break;
				case 7:
					System.out.println("As being said, this is demo application and Reservations table has not been covered.");
					break;
				case 8:
					System.out.println("As being said, this is demo application and Reservations Results table has not been covered.");
					break;
				}
				break;
			case 4:
				System.out.println("You have chosen to List");
				System.out.println("Please select the correct table that you want to list records of");
				System.out.println("1-Hotels");
				System.out.println("2-Hotel Room Type(Not covered in demo application)");
				System.out.println("3-Hotel Rooms(Not covered in demo application)");
				System.out.println("4-Departments(Not covered in demo application)");
				System.out.println("5-Employees(Not covered in demo application)");
				System.out.println("6-Customers");
				System.out.println("7-Reservations(Not covered in demo application)");
				System.out.println("8-Reservations Results(Not covered in demo application)");
				decision = scan.nextInt();
				switch (decision) {
				case 1:
					dataBaseOperations.listRecordsHotels();
					break;
				case 2:
					System.out.println("As being said, this is demo application and Hotel Room Type table has not been covered.");
					break;
				case 3:
					System.out.println("As being said, this is demo application and Hotel Rooms table has not been covered.");
					break;
				case 4:
					System.out.println("As being said, this is demo application and Departments table has not been covered.");
					break;
				case 5:
					System.out.println("As being said, this is demo application and Employees has not been covered.");
					break;
				case 6:
					dataBaseOperations.listRecordsCustomers();
					break;
				case 7:
					System.out.println("As being said, this is demo application and Reservations table has not been covered.");
					break;
				case 8:
					System.out.println("As being said, this is demo application and Reservations Results table has not been covered.");
					break;
				}
				break;
			case 5:
				System.out.println("Quit");
				break;
			}
		} while (decision != 5);
	}

}