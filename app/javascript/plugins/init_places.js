var places = require('places.js');

const initPlaces = () => {
  var placesAutocomplete = places({
    apiKey: '25de5b522791da076aa61e68988589c2',
    appId: 'plH6GRF2SVCU',
    container: document.querySelector('#query_location')
  });
}

export { initPlaces }
