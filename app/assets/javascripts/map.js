
function searchResultsMap(user, results){

  console.log('map elem', document.getElementById('results_map'));

  var bound = new google.maps.LatLngBounds();

  var map = new google.maps.Map(document.getElementById('results_map'), {
    center: user,
    scrollwheel: false,
    zoom: 16
  });

  var marker = new google.maps.Marker({
                position: user,
                map: map,
                title:'YOU'
                });


  bound.extend(user);

  for(var user_id in results) {

console.log( {lat: results[user_id].latitude, lng: results[user_id].longitude } );

  // Construct the circle for each value in citymap.
  // Note: We scale the area of the circle based on the population.
  // for (var city in citymap) {
    // Add the circle for this city to the map.
    var cityCircle = new google.maps.Circle({
      strokeColor: '#1695A3',
      strokeOpacity: 0.9,
      strokeWeight: 2,
      fillColor: '#1695A3',
      fillOpacity: 0.45,
      map: map,
      center: {lat: results[user_id].latitude, lng: results[user_id].longitude },
      radius: 50
    });

    bound.extend(cityCircle.center);
  }

  map.fitBounds(bound);


}

function initMap() {
        // Create a map object and specify the DOM element for display.
        var map = new google.maps.Map(document.getElementById('map'), {
          center: myLatLng,
          scrollwheel: false,
          zoom: 16
        });

        //console.log('map', citymap);

        // // Create a marker and set its position.
        // var marker = new google.maps.Marker({
        //   map: map,
        //   position: myLatLng,
        //   title: 'addres'
        // });

        // Construct the circle for each value in citymap.
        // Note: We scale the area of the circle based on the population.
        // for (var city in citymap) {
          // Add the circle for this city to the map.
          var cityCircle = new google.maps.Circle({
            strokeColor: '#1695A3',
            strokeOpacity: 0.9,
            strokeWeight: 2,
            fillColor: '#1695A3',
            fillOpacity: 0.45,
            map: map,
            center: myLatLng,
            radius: 150
          });


        // }



      }
