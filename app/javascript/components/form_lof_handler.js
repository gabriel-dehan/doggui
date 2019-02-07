const FormLofHandler = () => {
  const input = document.querySelector('form .dog_status select');

  if (input) {
    input.addEventListener('change', (e) => {
      if (e.target.value != "Pas de LOF") {
        document.querySelector('form .lof-number-input').style.display = 'block';
      } else {
        document.querySelector('form .lof-number-input').style.display = 'none';
      }
    });
  }
 
};

export { FormLofHandler };
