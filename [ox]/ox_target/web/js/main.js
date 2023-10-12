import { createOptions } from './createOptions.js';

const optionsWrapper = document.getElementById('options-wrapper');
const body = document.body;
const eye = document.getElementById('eyeSvg');
window.addEventListener('message', (event) => {
  optionsWrapper.innerHTML = '';

  switch (event.data.event) {
    case 'visible': {
      body.style.visibility = event.data.state ? 'visible' : 'hidden';
      return (eye.style.color = 'white');
    }

    case 'leftTarget': {
      return (eye.style.color = 'white');
    }

    case 'setTarget': {
      eye.style.color = 'rgb(250, 46, 5)';

      if (event.data.options) { 
        for (const type in event.data.options) {
          event.data.options[type].forEach((data, id) => {
            createOptions(type, data, id + 1);
          });
        }
      }
    }
  }
});
