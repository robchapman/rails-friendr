var places = require('places.js');

const initPlaces = () => {
  const location = document.querySelector('#query_location')
  if (!location) return;
  var placesAutocomplete = places({
    apiKey: '25de5b522791da076aa61e68988589c2',
    appId: 'plH6GRF2SVCU',
    container: location
  });
}

export { initPlaces }
