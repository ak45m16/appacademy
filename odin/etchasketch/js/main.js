$(document).ready(function(){
  var initialgrid=16
  for(var i=1; i<=initialgrid*initialgrid; i++){
    $(".container").append('<div class="grid"></div>');
  }
  var measure=500/initialgrid
  $(".grid").width(measure.toString()+"px")
  $(".grid").height(measure.toString()+"px")

  $(".grid").hover(function(){
    $(this).css("background-color", "blue");
  });
  $("button").click(function(){
    $(".grid").remove();
    var newnum= prompt("How many squares per side for the new grid?");
    for(var i=1; i<=newnum*newnum; i++){
    $(".container").append('<div class="grid"></div>');
    }
    var measure=500/newnum
    $(".grid").width(measure.toString()+"px")
    $(".grid").height(measure.toString()+"px")

    $(".grid").hover(function(){
    $(this).css("background-color", "blue");
    });
  });
});

//there's a lot of duplicate code here; needs refactoring
