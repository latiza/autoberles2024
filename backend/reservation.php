<?php

session_start();
include_once "config.php";

if (!isset($_SESSION['RenterID'])) {
    header("Location: ../login.php");
    exit();
}

$RenterID = $_SESSION['RenterID'];

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['reserve'])) {

    $carID = $_POST['carID'];
    $startingDay = $_POST['startingDay'];
    $endingDay = $_POST['endingDay'];

    // Ellenőrzés, hogy a foglalás dátumai helyesek-e
    if (strtotime($endingDay) <= strtotime($startingDay)) {
        echo "Hibás foglalási időszak!";
    } else {
        // Ellenőrizzük, hogy a kiválasztott időszakban szabad-e az autó
        $checkAvailabilityQuery = "SELECT * FROM reservation
                                    WHERE CarID = $carID
                                    AND (
                                        (StartingDay BETWEEN '$startingDay' AND '$endingDay')
                                        OR (EndingDay BETWEEN '$startingDay' AND '$endingDay')
                                    )";
        $resultCheckAvailability = mysqli_query($conn, $checkAvailabilityQuery);

        if (mysqli_num_rows($resultCheckAvailability) > 0) {
            echo "Az autó ezen időszakban már foglalt!";
        } else {
            //random id generálása
            function generateUniqueReservationId($conn) {
                // Generálunk egy random számot
                $uniqueReservartionId = rand(100000, 999999);
                   return $uniqueReservartionId;
               }
            // Unikális azonosító generálása
            $ReservationId = generateUniqueReservationId($conn);
            // Foglalás rögzítése az adatbázisban
            $reserveQuery = "INSERT INTO reservation (ReservationId, RenterID, CarID, StartingDay, EndingDay)
                             VALUES ($ReservationId, $RenterID, $carID, '$startingDay', '$endingDay')";
            $resultReserve = mysqli_query($conn, $reserveQuery);

            if ($resultReserve) {
                //echo "Foglalás sikeres!";
                header("Location: profil.php");
            } else {
                echo "Hiba a foglalás során: " . mysqli_error($conn);
            }
        }
    }
}

?>

<!DOCTYPE html>
<html lang="hu">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Autó foglalás</title>
</head>

<body>
    <h1>Autó foglalás</h1>

    <form method="post" action="">
        <!-- Autó kiválasztása -->
        <label for="carID">Autó kiválasztása:</label>
        <select id="carID" name="carID">
            <?php
            $carQuery = "SELECT c.CarID, CONCAT(b.BrandName, ' ', m.CarModelName, ' (', c.ProductionYear, ')') AS CarInfo
                 FROM car c
                 JOIN carmodel m ON c.ModelID = m.ModelID
                 JOIN brand b ON m.BrandID = b.BrandID";
            $resultCar = mysqli_query($conn, $carQuery);

            while ($rowCar = mysqli_fetch_assoc($resultCar)) {
                echo "<option value='{$rowCar['CarID']}'>{$rowCar['CarInfo']}</option>";
            }
            ?>
        </select><br>

        <!-- Foglalási időszak -->
        <label for="startingDay">Foglalás kezdete:</label>
        <input type="date" id="startingDay" name="startingDay" min="<?php echo date('Y-m-d'); ?>" required><br>

        <label for="endingDay">Foglalás vége:</label>
        <input type="date" id="endingDay" name="endingDay" min="<?php echo date('Y-m-d'); ?>" required><br>

        <button type="submit" name="reserve">Foglalás</button>
    </form>
    <script src="../js/checkDate.js"></script>
</body>

</html>