

$(function() {
    window.addEventListener( 'message', function( event ) {
        var item = event.data;
        
        switch (item.action) {
            case 'show':
	    $(".container").removeClass("slide-right");
		$(".container").addClass("slide-left");
                $('.container').fadeIn(500);
				swipe.play();
            break;

            case 'hide':
                $('.container').fadeOut(500);
                	 $(".container").addClass("slide-right");

            break;
        };
    });

    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
        };
    }

    $('.item').on('click', function() {
        if ($(this).hasClass('active')) {
            $(this).removeClass('active');
        } else {
            $(this).addClass('active');
        };

        $.post(`https://${GetParentResourceName()}/select`, JSON.stringify({
            item: this.id
        }));
    });

    $('.option').on('click', function() {
        $.post(`https://${GetParentResourceName()}/reset`);

        $('.item').removeClass('active');
    })

    $('.reset').on('click', function() {
        $.post(`https://${GetParentResourceName()}/reset`);

        $('.item').removeClass('active');
    })



});


