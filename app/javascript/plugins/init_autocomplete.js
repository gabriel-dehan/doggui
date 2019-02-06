import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('dog_address');
  if (addressInput) {
    var placesInstance = places({ 
      templates: {
        value: (data) => {
          return data.city;
        }
      },
      container: addressInput
     });
  }
};


export { initAutocomplete };
