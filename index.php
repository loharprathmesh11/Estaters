<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION['current_user'])) {
    $_SESSION['current_user'] = 'admin123';
}

if (isset($_SESSION['current_user'])) {
    // echo "<p id='home'>Session current user: " . $_SESSION['current_user'] . "</p>";
    echo " <p id='home'>.</p>";
}


$servername = "sql301.infinityfree.com";
$username = "if0_35675136";
$password = "KjZEqEwm8WsB";
$dbname = "if0_35675136_real_estate";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

?>




<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Real-estate</title>
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <script>
        function filterProperties() {
            var state = document.getElementById('state').value;
            var type = document.getElementById('type').value;
            var salePrice = document.getElementById('sale-price').value;
            var rentPrice = document.getElementById('rent-price').value;

            var url = window.location.href.split('?')[0];
            var queryParams = [];

            if (state) {
                queryParams.push('state=' + encodeURIComponent(state));
            }
            if (type) {
                queryParams.push('type=' + encodeURIComponent(type));
            }
            if (salePrice) {
                queryParams.push('sale-price=' + encodeURIComponent(salePrice));
            }
            if (rentPrice) {
                queryParams.push('rent-price=' + encodeURIComponent(rentPrice));
            }

            if (queryParams.length > 0) {
                url += '?' + queryParams.join('&');
            }

            window.location.href = url;
        }

        function scrollToSection(sectionId) {
            var section = document.getElementById(sectionId);
            if (section) {
                section.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        }
    </script>

</head>

<body>
    <div id="navbar">
        <i class="fa-solid fa-hotel" id="nav-logo"></i>
        <div id="navbar-text">
            <li><a href="#home" onclick="scrollToSection('home')">HOME</a></li>
            <li><a href="#about" onclick="scrollToSection('about-div')">ABOUT</a></li>
            <li><a href="#properties" onclick="scrollToSection('prop-div')">PROPERTIES</a></li>
            <!-- <li><a href="#agents">AGENTS</a></li> -->
            <li><a href="#contact" onclick="scrollToSection('contact-form')">CONTACT US</a></li>
        </div>
        <div id="login">
            <?php
            if (isset($_SESSION['current_user'])) {
                echo '<span>' . $_SESSION['current_user'] . '</span>';
                echo "<a href='signup.php'>Logout</a>";
            }
            ?>
        </div>
    </div>

    <div id="about-div">
        <img src="logo-real-estate.png" alt="our logo">
        <div id="about-text">
            <h1>Welcome to AJ-ESTATES</h1>
            <h3>Connecting You with Your Perfect Home.</h3>
            <p>Find houses tailored to your price and preferences in your nearby location only with AJ-Estates. Your dream home is just a click away.</p>
            <h4>"Your Dream Home, Your Way!"</h4>
        </div>
    </div>



    <div id="prop-div">
        <div id="add-property-div">
            <h2>Add Property form</h2>
            <form id="add-property-form" method="post" action="add_property.php">
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" required>

                <label for="description">Description:</label>
                <textarea id="description" name="description" required></textarea>

                <label for="property-type">Type:</label>
                <select id="property-type" name="property-type" required>
                    <option value="Sale">Sale</option>
                    <option value="Rent">Rent</option>
                    <option value="Both">Both</option>
                </select>

                <label for="price-sale">Sale Price:</label>
                <input type="text" id="price-sale" name="price-sale">

                <label for="price-rent">Rent Price:</label>
                <input type="text" id="price-rent" name="price-rent">

                <label for="state">State:</label>
                <select id="state" name="state" required>
                    <option value="Andhra Pradesh">Andhra Pradesh</option>
                    <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                    <option value="Assam">Assam</option>
                    <option value="Bihar">Bihar</option>
                    <option value="Chhattisgarh">Chhattisgarh</option>
                    <option value="Goa">Goa</option>
                    <option value="Gujarat">Gujarat</option>
                    <option value="Haryana">Haryana</option>
                    <option value="Himachal Pradesh">Himachal Pradesh</option>
                    <option value="Jharkhand">Jharkhand</option>
                    <option value="Karnataka">Karnataka</option>
                    <option value="Kerala">Kerala</option>
                    <option value="Madhya Pradesh">Madhya Pradesh</option>
                    <option value="Maharashtra">Maharashtra</option>
                    <option value="Manipur">Manipur</option>
                    <option value="Meghalaya">Meghalaya</option>
                    <option value="Mizoram">Mizoram</option>
                    <option value="Nagaland">Nagaland</option>
                    <option value="Odisha">Odisha</option>
                    <option value="Punjab">Punjab</option>
                    <option value="Rajasthan">Rajasthan</option>
                    <option value="Sikkim">Sikkim</option>
                    <option value="Tamil Nadu">Tamil Nadu</option>
                    <option value="Telangana">Telangana</option>
                    <option value="Tripura">Tripura</option>
                    <option value="Uttar Pradesh">Uttar Pradesh</option>
                    <option value="Uttarakhand">Uttarakhand</option>
                    <option value="West Bengal">West Bengal</option>
                </select>

                <label for="city">City:</label>
                <input type="text" id="city" name="city" required>

                <button type="submit" name="add_property_button">Add Property</button>
            </form>
        </div>
        <div id="property-filter-form">
            <h2>Filter Properties</h2>
            <form action="" method="get">
                <label for="state">State:</label>
                <select id="state" name="state">
                    <option value="any">Any</option>
                    <option value="Andhra Pradesh">Andhra Pradesh</option>
                    <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                    <option value="Assam">Assam</option>
                    <option value="Bihar">Bihar</option>
                    <option value="Chhattisgarh">Chhattisgarh</option>
                    <option value="Goa">Goa</option>
                    <option value="Gujarat">Gujarat</option>
                    <option value="Haryana">Haryana</option>
                    <option value="Himachal Pradesh">Himachal Pradesh</option>
                    <option value="Jharkhand">Jharkhand</option>
                    <option value="Karnataka">Karnataka</option>
                    <option value="Kerala">Kerala</option>
                    <option value="Madhya Pradesh">Madhya Pradesh</option>
                    <option value="Maharashtra">Maharashtra</option>
                    <option value="Manipur">Manipur</option>
                    <option value="Meghalaya">Meghalaya</option>
                    <option value="Mizoram">Mizoram</option>
                    <option value="Nagaland">Nagaland</option>
                    <option value="Odisha">Odisha</option>
                    <option value="Punjab">Punjab</option>
                    <option value="Rajasthan">Rajasthan</option>
                    <option value="Sikkim">Sikkim</option>
                    <option value="Tamil Nadu">Tamil Nadu</option>
                    <option value="Telangana">Telangana</option>
                    <option value="Tripura">Tripura</option>
                    <option value="Uttar Pradesh">Uttar Pradesh</option>
                    <option value="Uttarakhand">Uttarakhand</option>
                    <option value="West Bengal">West Bengal</option>
                </select>

                <label for="type">Type:</label>
                <select id="type" name="type">
                    <option value="any">Any</option>
                    <option value="Sale">Sale</option>
                    <option value="Rent">Rent</option>
                    <option value="Both">Both</option>
                </select>

                <label for="sale-price">Sale Price:</label>
                <input type="text" id="sale-price" name="sale-price">

                <label for="rent-price">Rent Price:</label>
                <input type="text" id="rent-price" name="rent-price">

                <button type="submit" name="filter_properties">Filter Properties</button>
            </form>
        </div>

        <div id="filtered-properties">
            <?php
            // Handle form submission and filter properties
            if ($_SERVER['REQUEST_METHOD'] === 'GET') {
                if (isset($_GET['filter_properties'])) {
                    $state = isset($_GET['state']) && $_GET['state'] !== 'any' ? $_GET['state'] : '';
                    $type = isset($_GET['type']) && $_GET['type'] !== 'any' ? $_GET['type'] : '';
                    $salePrice = isset($_GET['sale-price']) ? $_GET['sale-price'] : '';
                    $rentPrice = isset($_GET['rent-price']) ? $_GET['rent-price'] : '';

                    $sql = "SELECT * FROM properties WHERE 1=1";

                    if (!empty($state)) {
                        $sql .= " AND State = '$state'";
                    }

                    if (!empty($type)) {
                        $sql .= " AND Type = '$type'";
                    }

                    if (!empty($salePrice)) {
                        $sql .= " AND PriceSale <= $salePrice";
                    }

                    if (!empty($rentPrice)) {
                        $sql .= " AND PriceRent <= $rentPrice";
                    }

                    $result = $conn->query($sql);

                    echo "<div id='filtered-properties'>";
                    if ($result->num_rows > 0) {
                        while ($row = $result->fetch_assoc()) {
                            echo "<div class='property'>";
                            $randomImageNumber = rand(1, 26);
                            echo "<img src='images/house$randomImageNumber.jpg' alt='Property Image'>";
                            echo "<h3>" . $row['Title'] . "</h3>";
                            echo "<p>" . $row['Description'] . "</p>";
                            echo "<p>Type: " . $row['Type'] . "</p>";
                            echo "<p>Sale Price: " . $row['PriceSale'] . "</p>";
                            echo "<p>Rent Price: " . $row['PriceRent'] . "</p>";
                            echo "<p>Location: " . $row['State'] . ", " . $row['City'] . "</p>";
                            echo "<div class='centered-button'>";

                            echo "<form method='post' action='delete_property.php'>";
                            echo "<input type='hidden' name='property_id' value='{$row['PropertyID']}'>";

                            if ($row['Type'] == 'Sale') {
                                echo "<button type='submit' name='buy_button'>Buy for Sale</button>";
                                echo "<input type='hidden' name='action' value='delete_property.php'>";
                            } elseif ($row['Type'] == 'Rent') {
                                echo "<button type='submit' name='buy_button'>Buy for Rent</button>";
                                echo "<input type='hidden' name='action' value='delete_property.php'>";
                            } elseif ($row['Type'] == 'Both') {
                                echo "<button type='submit' name='buy_button_sale'>Buy for Sale</button>";
                                echo "<input type='hidden' name='action_sale' value='delete_property.php'>";

                                echo "<button type='submit' name='buy_button_rent'>Buy for Rent</button>";
                                echo "<input type='hidden' name='action_rent' value='delete_property.php'>";
                            }

                            echo "</form>";
                            echo "</div>";
                            echo "</div>";
                        }
                    } else {
                        echo "No properties found.";
                    }

                    echo "</div>";

                    $conn->close();
                }
            }
            ?>
        </div>
    </div>


    <div id="contact-form">
        <h2>Contact Us</h2>
        <form action="https://formspree.io/f/meqyjnvb" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone" required>

            <label for="message">Message:</label>
            <textarea id="message" name="message" rows="4" required></textarea>

            <button type="submit">Submit</button>
        </form>
    </div>

</body>

</html>