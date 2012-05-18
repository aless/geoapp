(function() {
  var initialize;

  initialize = function() {
    var latlng, map, marker, myOptions;
    latlng = new google.maps.LatLng(-33.43706, -70.634451);
    myOptions = {
      zoom: 11,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.HYBRID
    };
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    marker = new google.maps.Marker({
      map: map
    });
    return $("#geocodeBtn").bind('click', function() {
      return $.getJSON('/geocode?d=' + $("#address").attr('value'), function(coord) {
        latlng = new google.maps.LatLng(coord['lat'], coord['lng']);
        marker.setPosition(latlng);
        map.setCenter(latlng);
        return map.setZoom(15);
      });
    });
  };

  $(document).ready(initialize);

}).call(this);
