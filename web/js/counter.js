// Always test to check for a connection!
// console.log("Testing - JavaScript file has been linked correctly!");

// Find the 'count this' class on the page and animate it
$('.count-this').each(function () {

	// Start the counting from a specified number - in this case, 0!
    $(this).prop('Counter',0).animate({
        Counter: $(this).text()
    }, {
    	// Speed of counter in ms, default animation style
        duration: 2500,
        easing: 'swing',
        step: function (now) {
        	// Round up the number
            $(this).text(Math.ceil(now));
        }
    });
});

$(document).ready(function () {
    get();
});

$(document).ready(function () {
    $('.mover').animate({
        left: 50
    }, 1000);
});

var value = 0;
$(window).bind('mousewheel', function(event) {
    value = event.originalEvent.wheelDelta;
    if (value / 120 >= 0) {
        $('html,body').animate({ scrollTop: 0 }, 900);
    }
    else {
        $('body,html').animate({ scrollTop: $('body').height() }, 900);
    }
    value = 0;
});

$('.maps').click(function () {
    $('.maps iframe').css("pointer-events", "auto");
});

$( ".maps" ).mouseleave(function() {
    $('.maps iframe').css("pointer-events", "none");
});

$(document).ready(function(){
    setTimeout(function(){$('#page-preloader').fadeOut()}, 1);
});

function post(path, params) {
    method = "post"; // Set method to post by default if not specified.

    // The rest of this code assumes you are not using a library.
    // It can be made less wordy if you use one.
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);

    for(var key in params) {
        if(params.hasOwnProperty(key)) {
            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", key);
            hiddenField.setAttribute("value", params[key]);

            form.appendChild(hiddenField);
        }
    }

    document.body.appendChild(form);
    form.submit();
}


