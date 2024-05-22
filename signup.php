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

// Registration Form Handling
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['register'])) {
    $username = $conn->real_escape_string($_POST['username']);
    $password = $conn->real_escape_string($_POST['password']);
    $phone_num = $conn->real_escape_string($_POST['phone_num']);
    $email_id = $conn->real_escape_string($_POST['email_id']);

    // Retrieve the current maximum user_id
    $maxIdQuery = "SELECT MAX(user_id) as max_id FROM users";
    $result = $conn->query($maxIdQuery);

    if ($result) {
        $row = $result->fetch_assoc();
        $currentMaxId = $row['max_id'];
        $newUserId = $currentMaxId + 1;
    } else {
        // Handle error if the query fails
        echo "Error retrieving maximum user_id";
        exit();
    }

    // Hash the password for security
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // Insert user information into the users table with the new user_id
    $sql = "INSERT INTO users (user_id, username, password, phone_num, email_id) VALUES ('$newUserId', '$username', '$hashed_password', '$phone_num', '$email_id')";

    if ($conn->query($sql) === TRUE) {
        $_SESSION['current_user'] = $username; // Update the session variable with the entered username
        header("Location: index.php");  // Redirect to index.php
        exit();
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Login Form Handling
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['login'])) {
    $login_username = $conn->real_escape_string($_POST['login_username']);
    $login_password = $conn->real_escape_string($_POST['login_password']);

    // Retrieve user information from the users table based on the entered username
    $retrieve_sql = "SELECT * FROM users WHERE username = '$login_username'";
    $result = $conn->query($retrieve_sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        // Verify the entered password with the hashed password in the database
        if (password_verify($login_password, $row['password'])) {
            $_SESSION['current_user'] = $login_username; // Update the session variable with the entered username
            header("Location: index.php"); // Redirect to index.php
            exit();
        } else {
            echo "Incorrect password";
        }
    } else {
        echo "User not found";
    }
}
?>






<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup and Login</title>
    <!-- Include your CSS and other styling here -->
    <style>
        body {
            margin: 0;
            padding: 0;
            animation: gradientAnimation 10s infinite alternate;
            /* Adjust duration and other properties as needed */
        }

        @keyframes gradientAnimation {
            0% {
                background: linear-gradient(to right, #ff5733, #ffc300);
            }

            50% {
                background: linear-gradient(to right, #00bcd4, #4caf50);
            }

            100% {
                background: linear-gradient(to right, #ff5733, #ffc300);
            }
        }

        #signup-form {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            text-align: center;
        }

        form {
            background: rgba(255, 255, 255, 0.9);
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            border-radius: 10px;
            padding: 20px;
            width: 300px;
            /* Adjust the width as needed */
            margin: 20px;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        button {
            background: #3498db;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background: #2980b9;
        }
    </style>
</head>

<body>

    <div id="signup-form">
        <h1>Create new account!</h1>
        <form id="user-signup-form" method="post" action="">
            <!-- Registration Form -->
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <label for="phone_num">Phone Number:</label>
            <input type="text" id="phone_num" name="phone_num" required>

            <label for="email_id">Email ID:</label>
            <input type="email" id="email_id" name="email_id" required>

            <button type="submit" name="register">Register</button>
        </form>

        <!-- Login Form -->
        <div id="login-form">
            <h2>Already have an account?</h2>
            <h1>Login here</h1>
            <form id="user-login-form" method="post" action="">
                <label for="login_username">Username:</label>
                <input type="text" id="login_username" name="login_username" required>

                <label for="login_password">Password:</label>
                <input type="password" id="login_password" name="login_password" required>

                <button type="submit" name="login">Login</button>
            </form>
        </div>

        <!-- Add a link or button to go back to the original page -->
        <!-- <a href="index.php">Back to Original Page</a> -->
    </div>

</body>

</html>