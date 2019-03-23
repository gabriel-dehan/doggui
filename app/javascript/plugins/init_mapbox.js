import mapboxgl from 'mapbox-gl';

window.markers = [];
window.enteredOtherCard = false; 

function handleCardEnter(e) {
  let id = e.target.id;
  let pin = document.querySelector(".dog-marker[data-dog-id='" + id + "']");

  if (pin) {
    enteredOtherCard = true;
    document.querySelectorAll(".dog-marker").forEach(function(marker) {
      marker.style.opacity = 0;
    });
    pin.style.opacity = 1;
  }

}

function handleCardLeave(e) {
  enteredOtherCard = false;
  setTimeout(function() {
    if (!enteredOtherCard) {
      let id = e.target.id;
      let pin = document.querySelector(".dog-marker[data-dog-id='" + id + "']");
      document.querySelectorAll(".dog-marker").forEach(function(marker) {
        marker.style.opacity = 1;
      });
    }
  }, 100);
}

// buildMap now takes `mapElement` as an argument because it is not a global constant anymore
const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    let map_marker = new mapboxgl.Marker().setLngLat([ marker.lng, marker.lat ]);
    map_marker._element.className += " dog-marker";
    map_marker._element.setAttribute('data-dog-id', "dog-" + marker.id);
    map_marker.addTo(map);
  });
};

const fitMapToMarkers = (map, markers, zoomOut) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: zoomOut ? 6 : 15 });
};

const initMapbox = () => {
  // Moved mapElement here, because we want to search for the element in the DOM everytime we call the "initMapBox" function
  const mapElement = document.getElementById('map');

  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    const zoomOut = mapElement.dataset.zoomOut == "true";
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers, zoomOut);

    document.querySelectorAll('.card').forEach(function(element) {
      element.addEventListener('mouseenter', handleCardEnter);
      element.addEventListener('mouseleave', handleCardLeave);
    });
  }
};

export { initMapbox };
