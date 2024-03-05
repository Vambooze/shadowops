
        window.addEventListener('message', (event) => {	            
            var item = event.data;

            
            if (item !== undefined && item.type === "ui") {		                
                if (item.display === true) {
                    $(".container").fadeIn(700);
        
                    var start = new Date();
                    
                    var title = item.title;
                    var maxTime = item.time;
                    var text = item.text;
                    var timeoutVal = Math.floor(maxTime/100);
                    animateUpdate();
                    $('#textAlert').text(text);
                    $('#titleAlert').text(title);
        
        
                    function updateProgress(percentage) {
                        $('#bar').css("width", percentage + "%");
                    }
        
                    function animateUpdate() {
                        var now = new Date();
                        var timeDiff = now.getTime() - start.getTime();
                        var perc = Math.round((timeDiff/maxTime)*100);
                        console.log(perc);
                        if (perc <= 100) {
                            updateProgress(perc);
                            setTimeout(animateUpdate, timeoutVal);
                        } else {
							
                            
							$(".container").fadeOut(700);
                        }
                    }


                } else {
                    $("#container").hide();
                }
            }
        });



