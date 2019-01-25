
const FormImagesPreviewer = () => {
  // For each file input with the class `preview`
  document.querySelectorAll('input[type=file].preview').forEach((input) => {
    EnablePreview(input);
  })

  function EnablePreview(input) {
    input.addEventListener('change', (e) => {
      if (input.files && input.files.length > 0) {
        Array.prototype.forEach.call(input.files, (file) => {
          var reader = new FileReader();
  
          reader.onload = function (e) {
              // Twice parent nodes because simple form creates a <div class="form-group"> around the input
              let previewContainer = input.parentNode.parentNode.querySelector('.preview-container');
              let pictureElement = document.createElement("img");

              console.log(input.parentNode, previewContainer);
              pictureElement.setAttribute('src', e.target.result);
              previewContainer.appendChild(pictureElement);
           };
  
          reader.readAsDataURL(file);
        });
      }
    });
  }
};


export { FormImagesPreviewer };
