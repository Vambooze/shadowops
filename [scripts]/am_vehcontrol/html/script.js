window.addEventListener('message', function(event){
    if(event.data.action == "show"){
	    $(".container").removeClass("slide-right");
		$(".container").addClass("slide-left");
        	  $(".container").fadeIn(300);
    } else if(event.data.action == "hide"){
			 $(".container").addClass("slide-right");
        	 $(".container").fadeOut(300);
    }
});