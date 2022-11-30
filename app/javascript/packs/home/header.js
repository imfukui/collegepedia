document.addEventListener('turbolinks:load', () => {

  const fixedHeader = document.getElementById('navigation-header');
  let startPoint = 0;
  let lastPoint = 0;

  window.addEventListener("scroll", function() {
    startPoint = window.scrollY;

    if(startPoint > lastPoint) {
      fixedHeader.classList.add('fixed-hide');
    } else {
      fixedHeader.classList.remove('fixed-hide');
    }

    lastPoint = startPoint;
  });

})
