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

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['buy_button_sale'])) {
    $propertyId = $conn->real_escape_string($_POST['property_id']);

    $username = $_SESSION['current_user'];

    $userIDQuery = "SELECT user_id FROM users WHERE username = '$username'";
    $userIDResult = $conn->query($userIDQuery);

    if ($userIDResult === false) {
        echo "Error executing user ID query: " . $conn->error;
    } elseif ($userIDResult->num_rows > 0) {
        $userIDRow = $userIDResult->fetch_assoc();
        $userID = $userIDRow['user_id'];
    } else {
        echo "Error: User ID not found for username $username";
    }

    $propertyTypeQuery = "SELECT type FROM properties WHERE PropertyID = '$propertyId'";
    $propertyTypeResult = $conn->query($propertyTypeQuery);

    if ($propertyTypeResult === false) {
        echo "Error executing property type query: " . $conn->error;
    } elseif ($propertyTypeResult->num_rows > 0) {
        $propertyTypeRow = $propertyTypeResult->fetch_assoc();
        $propertyType = $propertyTypeRow['type'];
    } else {
        echo "Error: Property type not found for PropertyID $propertyId";
    }

    $stateQuery = "SELECT state FROM properties WHERE PropertyID = '$propertyId'";
    $stateResult = $conn->query($stateQuery);

    if ($stateResult === false) {
        echo "Error executing state query: " . $conn->error;
    } elseif ($stateResult->num_rows > 0) {
        $stateRow = $stateResult->fetch_assoc();
        $state = $stateRow['state'];
    } else {
        echo "Error: State not found for PropertyID $propertyId";
    }

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

    $defaultAgentID = 1;

    $agentID = isset($stateAgentMapping[$state]) ? $stateAgentMapping[$state] : $defaultAgentID;

    $maxTransactionIdQuery = "SELECT MAX(transaction_id) as max_id FROM transactions";
    $maxTransactionIdResult = $conn->query($maxTransactionIdQuery);

    if ($maxTransactionIdResult === false) {
        echo "Error executing max transaction_id query: " . $conn->error;
    } elseif ($maxTransactionIdResult->num_rows > 0) {
        $maxTransactionIdRow = $maxTransactionIdResult->fetch_assoc();
        $maxTransactionId = $maxTransactionIdRow['max_id'];
        $newTransactionId = $maxTransactionId + 1;
    } else {
        $newTransactionId = 1;
    }

    $deleteSql = "DELETE FROM properties WHERE PropertyID = '$propertyId'";
    if ($conn->query($deleteSql) === TRUE) {
        echo "Property successfully deleted.";

        // Assuming 'buysale' should be the correct transaction type for 'Both'
        $insertTransactionSql = "INSERT INTO transactions (transaction_id, user_id, transaction_type, property_id, agent_id) 
                                VALUES ('$newTransactionId', '$userID', 'buysale', '$propertyId', '$agentID')";

        if ($conn->query($insertTransactionSql) === TRUE) {
            echo "Transaction record added successfully.";
        } else {
            echo "Error adding transaction record: " . $conn->error;
        }
    } else {
        echo "Error deleting property: " . $conn->error;
    }
}

$conn->close();
?>