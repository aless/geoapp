initialize = () ->
  latlng = new google.maps.LatLng(-33.43706, -70.634451);
  myOptions =
    zoom: 11
    center: latlng
    mapTypeId: google.maps.MapTypeId.HYBRID

  map = new google.maps.Map(document.getElementById("map_canvas"),
    myOptions)

  marker = new google.maps.Marker
    map: map

  $("#geocodeBtn").bind 'click', () ->
    $.getJSON('/geocode?d=' + $("#address").attr('value'), (coord) ->
      latlng = new google.maps.LatLng(coord['lat'], coord['lng'])
      marker.setPosition(latlng)
      map.setCenter(latlng)
      map.setZoom(15)
    )


$(document).ready(initialize)