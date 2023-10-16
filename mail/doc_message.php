<?php 
    // Session Code
    session_start();

    // Check if the user is logged in
    if (isset($_SESSION['username'])) {
      $usernameSession = $_SESSION['username'];
    } else {
      // Redirect to the login page if the user is not logged in
      header("Location: login.html");
    }

    // Connection to database
    $server = 'localhost';
    $username = 'SeniorProjects';
    $password = 'Password';
    $db = 'MedLink';

    $conn = new mysqli($server, $username, $password, $db);

    if ($conn->connect_error) {
        die("Fatal Error: Database Connection");
    }
 ?>

<!DOCTYPE html>
<html>
<head>
    <title>Med Link Doctor Homepage</title>
    <link rel="stylesheet" href="DocLayout.css">
    <link rel="stylesheet" href="doc_message.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<script>

//search through patient cards
function searchPatients() {
    var search = document.getElementById("search").value.toLowerCase();
    var cards = document.getElementsByClassName("card");

    for (var i = 0; i < cards.length; i++) {
            var name = cards[i].getElementsByClassName("name")[0].textContent.toLowerCase();
            if (name.includes(search)) {
                cards[i].style.display = "flex";
            } else {
                cards[i].style.display = "none";
            }
    }
}

//get patient email and fill into recipient field
function patient_email(patient) {
    //sends the patientid to php script to get patient info
    fetch('php_functions.php?emailFilter=' + patient)
        .then(response => response.json())
        .then(data => {
            // Store the data in an associative array
            let emailData = data;
            console.log(emailData); //outputs to console for debug
            if(emailData.email){
                document.getElementById("emailField").value = emailData.email;
                document.getElementById("emailForm").action
            }
            else {
                document.getElementById("emailField").value = "No Email on Record";
            }
        })
}

//email sending, check if page is loaded
document.addEventListener("DOMContentLoaded", function() {
    //create email object from the form
    const emailForm = document.getElementById("emailForm");

    //checks if submit button is hit
    emailForm.addEventListener("submit", function(event) {
        // prevent the default form submission behavior
        event.preventDefault(); 

        // new object, consisting of data from the email form
        const formData = new FormData(emailForm);

        //send data to php script using post
        fetch("send_email.php", {
            method: "POST",
            body: formData
        })
        //checks response and makes it plain text
        .then(response => response.text())
        //actions preformed with response
        .then(data => {
            //success echo
            if (data === "success") {
                alert("Email sent successfully!");
                // reset the form
                emailForm.reset(); 
            //error echo
            } else {
                alert("Error: " + data);
            }
        })
        //JS error handling
        .catch(error => {
            console.error("Error:", error);
            alert("An error occurred while sending the email.");
        });
    });
});

</script>
</head>
<body>
    <!-- Top Nav Bar -->
    <header>
        <a href="doc_homepage.php"><img class="logo" src="img/MedLink_Logo.png" alt="logo"></a>
        <nav>
            <ul class="nav_buttons">
                <li><a href="doc_calendar.php"><span class="material-icons">calendar_month</span>Calendar</a></li>
                <li><a href="doc_create_prescription.php"><span class="material-icons">medication</span>Medication</a></li>
                <li><a href="doc_patient.php"><span class="material-icons">man</span>Patients</a></li>
                <li><a href="doc_message.php"><span class="material-icons">mail</span>Message</a></li>
            </ul>
        </nav>
        <a href="#" class="menu-icon" onclick="toggleDropdown()"><span class="material-icons">menu</span></a>
        <div class="dropdown_menu">
            <span class="close-icon" onclick="toggleDropdown()">&times;</span>
            <li class="hidden"><a href="doc_calendar.php"><span class="material-icons">calendar_month</span>Calender</a></li>
            <li class="hidden"><a href="doc_create_prescription.php"><span class="material-icons">medication</span>Medication</a></li>
            <li class="hidden"><a href="doc_patient.php"><span class="material-icons">man</span>Patients</a></li>
            <li class="hidden"><a href="#"><span class="material-icons">mail</span>Message</a></li>
            <li><a href="#"><span class="material-icons">call</span>Contact us</a></li>
            <li><a href="logout.php"><span class="material-icons">logout</span>Logout</a></li>
        </div>
    </header>
    <script>
        const togglebtn = document.querySelector('.menu-icon')
        const dropdownMenu = document.querySelector(".dropdown_menu")

        function toggleDropdown() {
            dropdownMenu.classList.toggle('open');
            // Toggle the menu icon between "menu" and "close"
            const menuIcon = document.querySelector('.menu-icon .material-icons');
            menuIcon.textContent = menuIcon.textContent === 'menu' ? 'close' : 'menu';
        }
    </script>

   <!-- Body of Page -->
    <main>
        <div class="header">Patient List</div>
        <div class="content">
            <!-- Left Side -->
            <div class="container1">
                <div class="inputArea searchBar">
                    <input type="text" id="search" class="inputField" name="search" placeholder="" onkeyup="searchPatients()">
                    <label class="label">Search</label>
                    <span class="bottomBorder"></span>
                    <span class="bar"></span>
                </div>
                <div class="container2">
                     <!-- initiation of php loop to generate patient cards -->
                    <?php 
                        // SQL query to retrieve patient information
                        $sql = "SELECT PatientID, FirstName, LastName, FamilyID FROM patient";
                        $result = $conn->query($sql);

                        if ($result === false) {
                            // Query execution failed
                            echo "Error: " . $conn->error;
                        } else {
                            while ($row = $result->fetch_assoc()) {
                                // Display patient information for each row
                                ?>
                                <!-- Patient Card -->
                                <div class="card ">
                                    <div class="info">
                                        <div class="name">
                                            <?php echo $row["FirstName"] . " " . $row["LastName"]; ?>
                                        </div>
                                        <div class="family">
                                            <?php echo $row["FamilyID"]; ?>
                                        </div>
                                    </div>
                                    <div class="btn">
                                        <button class="button" onclick="patient_email('<?php echo $row['PatientID']; ?>')">Message</button>
                                    </div>
                                </div>
                                <?php
                            } 
                        }
                    ?>
                </div>
            </div>
            <!-- Right Side -->
            <div class="container3">
                <!-- Message Card -->
                <form id="emailForm" class="message" action="send_email.php" method="POST">
                    <div class="toFrom">
                        <!-- Recipient -->
                        <div class="inputArea emailLine">
                            <input id="emailField" type="email"  class="inputField" name="email" placeholder="" readonly required>
                            <label class="label">Recipient</label>
                            <span class="bottomBorder"></span>
                            <span class="bar"></span>
                        </div>
                        <!-- Sender -->
                        <div class="inputArea emailLine">
                            <?php
                                //query changed to using username
                                $queryResult = mysqli_query($conn, "SELECT * FROM userid WHERE username = '$usernameSession'");
                                //store querry into an array
                                $row = mysqli_fetch_assoc($queryResult);
                                
                                $conn->close();
                            ?>
                            <input type="text"  class="inputField" name="sender" value="Dr. <?php echo "{$row['LastName']}"; ?>" placeholder="" readonly required>
                            <label class="label">Sender</label>
                            <span class="bottomBorder"></span>
                            <span class="bar"></span>
                        </div>
                    </div>
                    <!-- Subject -->
                    <div class="inputArea emailLine">
                        <input type="text"  class="inputField" name="subject" placeholder="" required>
                        <label class="label">Subject</label>
                        <span class="bottomBorder"></span>
                        <span class="bar"></span>
                    </div>
                    <!-- Body -->
                    <div class="bodyArea">
                        <textarea name="message" class="bodyText" placeholder="" required></textarea>
                        <label class="bodyLabel">Write Message Here</label>
                        
                    </div>
                    
                    <button class="button" type="submit">Send Email</button>
                </form>
            </div>
        </div>
    </main>

    <!-- Bottom Nav Bar -->
    <footer>
        <ul class="nav_buttons">
            <li><a href="#">Rules of Conduct</a></li>
            <li><a href="#">Privacy Policy</a></li>
            <li><a href="#">Need Help?</a></li>
        </ul>
    </footer>
</body>
</html> 