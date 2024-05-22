<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}


$servername = "sql301.infinityfree.com";
$username = "if0_35675136";
$password = "KjZEqEwm8WsB";
$dbname = "if0_35675136_real_estate";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['add_property_button'])) {
    $title = $conn->real_escape_string($_POST['title']);
    $description = $conn->real_escape_string($_POST['description']);
    $type = $conn->real_escape_string($_POST['property-type']);
    $priceSale = empty($_POST['price-sale']) ? 'NULL' : $conn->real_escape_string($_POST['price-sale']);
    $priceRent = empty($_POST['price-rent']) ? 'NULL' : $conn->real_escape_string($_POST['price-rent']);
    $state = $conn->real_escape_string($_POST['state']);
    $city = $conn->real_escape_string($_POST['city']);

    $lastPropertyIDQuery = "SELECT MAX(PropertyID) AS maxID FROM properties";
    $result = $conn->query($lastPropertyIDQuery);
    $row = $result->fetch_assoc();
    $nextPropertyID = $row['maxID'] + 1;

    $sql = "INSERT INTO properties (PropertyID, Title, Description, Type, PriceSale, PriceRent, State, City) 
            VALUES ('$nextPropertyID', '$title', '$description', '$type', $priceSale, $priceRent, '$state', '$city')";

    if ($conn->query($sql) === TRUE) {
        echo "Property added successfully.";

        // Get user ID from session
        $username = $_SESSION['current_user'];

        // Assuming you have a column named 'Username' in your 'users' table
        $userIDQuery = "SELECT user_id FROM users WHERE username = '$username'";
        $userIDResult = $conn->query($userIDQuery);

        if ($userIDResult === false) {
            // Handle the SQL error
            echo "Error executing user ID query: " . $conn->error;
        } elseif ($userIDResult->num_rows > 0) {
            $userIDRow = $userIDResult->fetch_assoc();
            $userID = $userIDRow['user_id'];
        } else {
            // Handle the case where the user ID is not found
            echo "Error: User ID not found for username $username";
        }
        // Get property ID of the added property
        $propertyID = $nextPropertyID;
        // Assign agent ID based on the state
        $state = $conn->real_escape_string($_POST['state']); // Assuming state is selected during property addition

        // Mapping of states to agent IDs
        $stateAgentMapping = [
            "Andhra Pradesh" => 1,
            "Arunachal Pradesh" => 2,
            "Assam" => 3,
            "Bihar" => 4,
            "Chhattisgarh" => 5,
            "Goa" => 6,
            "Gujarat" => 7,
            "Haryana" => 8,
            "Himachal Pradesh" => 9,
            "Jharkhand" => 10,
            "Karnataka" => 11,
            "Kerala" => 12,
            "Madhya Pradesh" => 13,
            "Maharashtra" => 14,
            "Manipur" => 15,
            "Meghalaya" => 16,
            "Mizoram" => 17,
            "Nagaland" => 18,
            "Odisha" => 19,
            "Punjab" => 20,
            "Rajasthan" => 21,
            "Sikkim" => 22,
            "Tamil Nadu" => 23,
            "Telangana" => 24,
            "Tripura" => 25,
            "Uttar Pradesh" => 26,
            "Uttarakhand" => 27,
            "West Bengal" => 28,
        ];


        // Default agent ID in case the state is not in the mapping
        $defaultAgentID = 1;

        // Get agent ID based on the state
        $agentID = isset($stateAgentMapping[$state]) ? $stateAgentMapping[$state] : $defaultAgentID;

        // Insert a record into the transactions table
        $transactionIDQuery = "SELECT MAX(transaction_id) AS maxID FROM transactions";
        $result = $conn->query($transactionIDQuery);

        if ($result === false) {
            // Handle the SQL error
            echo "Error executing transaction ID query: " . $conn->error;
        } else {
            $row = $result->fetch_assoc();

            if ($row === null) {
                // Handle the case where no transactions exist
                $nextTransactionID = 1;
            } else {
                $nextTransactionID = $row['maxID'] + 1;
            }

            // Continue with the rest of the code...
        }

        $type = "add" . $type;
        $transactionInsertQuery = "INSERT INTO transactions (transaction_id, user_id, transaction_type, property_id, agent_id) 
                                   VALUES ('$nextTransactionID', '$userID', '$type', '$propertyID', '$agentID')";

        if ($conn->query($transactionInsertQuery) === TRUE) {
            echo "Transaction record added successfully.";
        } else {
            echo "Error adding transaction record: " . $conn->error;
        }
    } else {
        echo "Error adding property: " . $conn->error;
    }
}

$conn->close();

?>
