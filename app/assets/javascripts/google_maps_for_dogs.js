var lat = 0;
var lng = 0;
var msj = document.getElementById("mensajes");
var markerOnMap;
var dog_aux;

function gmap_show(company) {
  if ((company.lat == null) || (company.lng == null) ) {    // validation check if coordinates are there
    return 0;
  }

  handler = Gmaps.build('Google');    // map init
  handler.buildMap({ provider: {
  },
  internal: {id: 'map'}}, function(){
    markers = handler.addMarkers([    // put marker method
      {
      "lat": company.lat,    // coordinates from parameter company
      "lng": company.lng,
      "picture": {    // setup marker icon
        "url": 'http://www.planet-action.org/img/2009/interieur/icons/orange-dot.png',
        "width":  32,
        "height": 32
      },
      "infowindow": "<b>" + company.name + "</b> " + company.address + ", " + company.postal_code + " " + company.city
    }
    ]);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    handler.getMap().setZoom(12);    // set the default zoom of the map
  });
}

//function mapOptions()
//{
  //timeout: 10 * 1000;
//}

function getLocation(dog) {
  if (navigator.geolocation) {
    console.log(dog);
    dog_aux = dog;
    navigator.geolocation.getCurrentPosition(showPosition, showError);
    //setTimeout(function(){llamarMapa(dog)},2000);
  } else {
    console.log("something");
    msj.innerHTML = "Tu navegador no soporta la geolocalizacion";
    dog.lat = "19.2530047";
    dog.lng = "-103.7238732";
    gmap_form(dog);
  }
}

function llamarMapa(dog)
{
  dog.lat = lat;
  dog.lng = lng;
  document.getElementById("lat").value = lat;
  document.getElementById("lng").value = lng;
  gmap_form(dog);
}

function showPosition(position) {
  lat = position.coords.latitude;
  lng = position.coords.longitude;
  console.log(lat, lng)
  llamarMapa(dog_aux);
}

function showError(error)
{
  console.log("Colima como ubicacion por default por error de geolocalizacion");
  console.log(dog_aux);
  lat = 19.2440911;
  lng = -103.7218132;
  llamarMapa(dog_aux);
}



function gmap_form(dog) {
  handler = Gmaps.build('Google');    // map init
  handler.buildMap({ provider: {
    disableDoubleClickZoom: true
  }, internal: {id: 'map'}}, function(){
    if (dog.lat && dog.lng) {    // statement check - new or edit view
      //markers = handler.addMarkers([    // print existent marker
        //{
        //"lat": dog.lat,
        //"lng": dog.lng,
        ////"picture": {
          ////"url": 'http://www.clker.com/cliparts/g/R/z/I/u/o/map-pin-md.png',
          ////"width":  32,
          ////"height": 32
        ////},
        //"infowindow": "<b>" + dog.name + "</b> "
      //}
      //]);
      //handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      handler.getMap().setZoom(15);
      handler.map.centerOn([dog.lat, dog.lng]);
      var geo = new google.maps.LatLng(parseFloat(dog.lat), parseFloat(dog.lng))
      //var geo = {k: parseFloat(dog.lat), B: parseFloat(dog.lng)};
      placeMarker(geo);
    }
    else {    // show the empty map
      handler.fitMapToBounds();
      handler.map.centerOn([dog.lat, dog.lng]);
      handler.getMap().setZoom(15);
    }
  });


  function placeMarker(location) {    // simply method for put new marker on map
    console.log(location)
    if (markerOnMap) {
      markerOnMap.setPosition(location);
    }
    else {
      console.log("entro");
      markerOnMap = new google.maps.Marker({
        position: location,
        map: handler.getMap()
      });
      console.log(markerOnMap)
    }
  }

  google.maps.event.addListener(handler.getMap(), 'click', function(event) {   //  event for click-put marker on map and pass coordinates to hidden fields in form
    console.log(event.latLng);
    placeMarker(event.latLng);
    document.getElementById("lat").value = event.latLng.lat();
    document.getElementById("lng").value = event.latLng.lng();
  });
}
