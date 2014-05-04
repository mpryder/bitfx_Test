/**
 * Created by Mrs Ryder on 18/04/14.
 */

function marketList($scope, $http){
    $scope.rates=[];

    $scope.getRates = function(){
   $http({method : 'GET',
       url : "https://openexchangerates.org/api/latest.json?app_id=6334fc4be1884035840275ade9f84c9a"})
       .success(function(data, status){
        $scope.rates = data; // response data
       })
       .error(function(data, status){
        alert("error");

    });
    }
};
