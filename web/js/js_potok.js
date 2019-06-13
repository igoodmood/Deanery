$('.slide a').click(function () {
    $('.slide.active').removeClass('active');
    $(this).closest('.slide').addClass('active');
    return false;
});

function changeFunc(cour) {
    var selectBox = document.getElementsByClassName("selectBox_" + cour)[0];
    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    stud(cour, selectedValue)
}


function stud(crs, gro) {
    $.ajax({
        url: 'students',
        type: 'post',
        data: {
            course: crs,
            groop: gro
        },
        success: function (data) {
            $('#' + crs).html(data);
            document.getElementById('helper').style.visibility = "hidden";
        }
    });
}

$(document).ready(function () {
    get();
});