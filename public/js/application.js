$(document).ready(function() {

  var waiting_on_page = $('body').has('#spinningSquaresG').size();
  var username = $("#username").text();

  if (waiting_on_page === 1) {
    
    console.log("yesss");
    console.log($("#username").text());

    $.post('/' + username,function(data){
      console.log(data);
      $('#waiting').remove();
      $('.container').append(data);
    })

  } else {

    console.log("noooo")

  } 

});
