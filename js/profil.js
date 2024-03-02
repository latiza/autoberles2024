let app = angular.module('renterApp', []);
app.controller('RenterController', function($scope, $http) {
    //adatok beolvasása
    $http.get('http://localhost/autoberles_szabi/backend/profil.php').then(function(response) {
                $scope.renterData = response.data.renterData;
                $scope.settlementData = response.data.settlementData;
                $scope.reservationData = response.data.reservationData;
            });
    //adatok módodosítása ezt meg kell írnotok


    
 });