import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Find it.", "Book it.", "Sail it."],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
