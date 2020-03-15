
document.addEventListener("DOMContentLoaded", function(event) {

  function ground() {

    var tl = new TimelineMax({
      repeat: -1
    });

    tl.to("#ground", 20, {
        backgroundPosition: "1301px 0px",
        force3D:true,
        rotation:0.01,
        z:0.01,
        autoRound:false,
        ease: Linear.easeNone
      });

    return tl;
  }

  function clouds() {

    var tl = new TimelineMax({
      repeat: -1
    });

    tl.to("#clouds", 52, {
      backgroundPosition: "-2247px bottom",
      force3D:true,
      rotation:0.01,
      z:0.01,
      ease: Linear.easeNone
    });
    
    return tl;
  }

  var masterTL = new TimelineMax({
    repeat: -1
  });
  
window.onload = function() {
  
  masterTL
  .add(ground(),0)
  .add(clouds(),0)
  .timeScale(0.7)
  .progress(1).progress(0)
  .play();

};
  
});

$('.fun-btn').on('click', function(event) {
  $(this).toggleClass('start-fun');
  var $page = $('.page');
  $page.toggleClass('color-bg-start')
    .toggleClass('bg-animate-color');


  $(this).hasClass('start-fun') ?
    $(this).text('stop the fun') :
    $(this).text('start the fun');

});
document.addEventListener("DOMContentLoaded", function(){
      var el = document.querySelector(".button-bird");
      var text = document.querySelector(".button-bird__text");
          el.addEventListener('click', function() {
            el.classList.toggle('active');

            if(el.classList.contains('active')){
                console.log('true');
                text.innerHTML = 'DONE';
            }else{
                text.innerHTML = 'SEND';
            }
        });
    });



