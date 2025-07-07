

<?php
// -- do not edit below this line -- 
#http://weebtutorials.com/2012/03/pdo-connection-class-using-singleton-pattern/
#http://culttt.com/2012/10/01/roll-your-own-pdo-php-class/#

//db connection class using singleton pattern
class dbConn{
 
	//variable to hold connection object.
	protected static $db;
 
	//private construct - class cannot be instatiated externally.
	private function __construct() {
 
		try {
		// assign PDO object to db variable
			#self::$db = new PDO( 'mysql:host=localhost;dbname=DBNAME', 'USERNAME', 'PASSWORD' );
                        $host = getenv('DB_HOST') ?: 'localhost';
                        $name = getenv('DB_NAME') ?: 'configuratore_prezzi';
                        $user = getenv('DB_USER') ?: 'root';
                        $pass = getenv('DB_PASS') ?: '';
                        self::$db = new PDO( "mysql:host={$host};dbname={$name}", $user, $pass );
			self::$db->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
		}
		catch (PDOException $e) {
		//Output error - would normally log this to error file rather than output to user.
			echo "Connection Error: " . $e->getMessage();
		}
 
	}
 
	// get connection function. Static method - accessible without instantiation
	public static function getConnection() {
 
		//Guarantees single instance, if no connection object exists then create one.
		if (!self::$db) {
		//new connection object.
			new dbConn();
		}
 
		//return connection.
		return self::$db;
	}
 
}//end class
 
?>