const FormImagesPreviewer = () => {
  // We replaced the basic html inputs with custom buttons
  activateCustomUploadButtons();

  // For each file input with the class `preview`
  document.querySelectorAll('input[type=file].preview').forEach((input) => {
    EnablePreview(input);
    updateUploadButtonText(input);
  })

  // When an image is chosen, update the upload's button text
  function updateUploadButtonText(input) {
    input.addEventListener('change', (e) => {
      var filesCount = input.files.length;
      var button = input.parentNode.parentNode.querySelector('.upload-button');

      if (filesCount > 1) {
        button.innerHTML = "Changer les images";
      } else if (filesCount > 0) {
        button.innerHTML = "Changer l'image";
      } else { 
        button.innerHTML = "Ajouter une image";
      }
    });

  }

  function activateCustomUploadButtons() {
    document.querySelectorAll('.upload-input-container .upload-button').forEach((button) => {
      // Whenever you click on an upload button it clicks on the hidden file input next to it
      button.addEventListener('click', function(e) {
        var input = e.target.parentNode.querySelector('input[type=file]');
        input.click();
      });
    });
  }

  function EnablePreview(input) {
    input.addEventListener('change', (e) => {
      // Handle preview
      if (input.files && input.files.length > 0) {
        let previewContainer = input.parentNode.parentNode.querySelector('.preview-container');

        // Empty the preview container
        previewContainer.innerHTML = '';

        // For each file, display a preview in the container
        Array.prototype.forEach.call(input.files, (file, index) => {
          var reader = new FileReader();
  
          reader.onload = function (e) {
              let pictureElement = document.createElement("img");

              pictureElement.setAttribute('src', e.target.result);
              //pictureElement.addEventListener('click', removeFiles);

              // Add the preview picture to the container
              previewContainer.appendChild(pictureElement);
           };
  
          reader.readAsDataURL(file);
        });
      }
    });
  }

  function removeFiles(e) { 
    e.target.parentNode.parentNode.querySelector('input[type=file].preview').value = "";
    e.target.parentNode.innerHTML = "";
  }
};






export { FormImagesPreviewer };
