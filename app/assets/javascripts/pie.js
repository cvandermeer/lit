var ready;
ready = function() {

  $('.chart').easyPieChart({
    barColor: '#6fccdd',
    lineWidth: '10',
    lineCap: 'square',
    animate: '2000',
    scaleColor: '#FFF'
  });

}

$(document).ready(ready);
$(document).on('page:load', ready);