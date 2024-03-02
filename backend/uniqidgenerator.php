<?php
include_once "config.php";
/**
 * Probléma: nincs autoincremet
 * int() a generált számban nem lehet betű
 * nem lehet hosszabb 11-nél
 * a time() nem frissült, ugyanazt a számot generálta le
 * több próbálkozás után maradt a sima random függvény
 * ez a fájl nincs behúzva,
 * a regisztrációt egészítsd ki egy vizsgálattal nem e létezik az a random számi amit generálsz épp
 */
function generateUniqueId($conn) {
    // Az epoch időből származó egyedi azonosító generálása
    $epochTime = time(); 
    var_dump($epochTime);
    $uniqueId = base_convert($epochTime, 10, 36);
    var_dump($uniqueId);
    // Hozzáadjuk néhány véletlenszerű számot
    for ($i = 0; $i < 4; $i++) {
        $uniqueId .= mt_rand(0, 9);
        var_dump($uniqueId);
    }

    // Ellenőrzés, hogy az egyedi azonosító már létezik-e az adatbázisban
    $sql_check = mysqli_query($conn, "SELECT RenterID FROM renter WHERE RenterID = '{$uniqueId}'");

    // Amennyiben már létezik, újra generáljuk az egyedi azonosítót
    while ($sql_check !== false && mysqli_num_rows($sql_check) > 0) {
        $uniqueId = base_convert(time(), 10, 36); // Újra generáljuk az egyedi azonosítót
        for ($i = 0; $i < 4; $i++) {
            $uniqueId .= mt_rand(0, 9);
        }
        $sql_check = mysqli_query($conn, "SELECT RenterID FROM renter WHERE RenterID = '{$uniqueId}'");
    }

    // Korlátozzuk az azonosító hosszát az INT(11) típus miatt
    $uniqueId = substr($uniqueId, 0, 8);

    return $uniqueId;
}

$uniqueId = generateUniqueId($conn);
var_dump($uniqueId);
