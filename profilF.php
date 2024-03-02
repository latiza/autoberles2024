
<body ng-app="renterApp" ng-controller="RenterController">
    <h1>Renter Profil</h1>

    <h2>Renter adatai:</h2>
    <p>First Name: {{ renterData.FirstName }}</p>
    <p>Surname: {{ renterData.Surname }}</p>
    <p>Email: {{ renterData.Email }}</p>
    <p>Telephone Number: {{ renterData.TelephoneNumber }}</p>

    <!-- Település adatai -->
    <div ng-if="settlementData">
        <h2>Település adatai:</h2>
        <p>Settlement Name: {{ settlementData.SettlementName }}</p>
        <p>Zip Code: {{ settlementData.ZipCode }}</p>
        <p>County: {{ settlementData.County }}</p>
    </div>

    <!-- Foglalás adatai -->
    <div ng-if="reservationData.length > 0">
        <h2>Reservation adatai:</h2>
        <ul>
            <li ng-repeat="reservation in reservationData">
                ReservationID: {{ reservation.ReservationID }}<br>
                CarID: {{ reservation.CarID }}<br>
                StartingDay: {{ reservation.StartingDay }}<br>
                EndingDay: {{ reservation.EndingDay }}<br>
            </li>
        </ul>
    </div>

    <form action="profilupdate.php" method="get">
        <button type="submit">Profil Módosítása</button>
    </form>

    <!-- Include AngularJS script -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
   <script src="js/profil.js"></script>
</body>
</html>
