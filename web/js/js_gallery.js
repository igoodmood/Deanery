// portfolio
var id = "";
$('.gallery ul li a').click(function() {
    var itemID = $(this).attr('href');
    id = itemID.slice(1);
    $.ajax({
        url: 'gallery',
        type: 'post',
        data: {
            id_ph: itemID.slice(1)
        },
        success: function (data) {
            var dt = data.split("[comm]");
            var inform = dt[0].split("|");
            var diver = document.getElementById('comm_people_' + itemID.slice(1));
            var uname = document.getElementById('download3').innerText;
            if (diver == null) {
                var port = document.createElement('div');
                port.id = itemID.slice(1);
                port.className = 'port';
                document.getElementById('sector').appendChild(port);
                var row = document.createElement('div');
                row.className = 'row';
                port.appendChild(row);
                var elem = document.createElement("img");
                var imgsrc = document.getElementById("image_" + itemID.slice(1)).src;
                elem.src = imgsrc;
                row.appendChild(elem);
                var description = document.createElement("div");
                description.className = "decription";
                var title = document.createElement("h1");
                var h_text = document.createTextNode(inform[0]);
                title.appendChild(h_text);
                var line = document.createElement("hr");
                var per = document.createElement("p");
                var p_text = document.createTextNode(inform[1]);
                per.appendChild(p_text);
                var p_com = document.createElement("p");
                p_com.className = "comments";
                var com_text = document.createTextNode("Комментарии");
                var fiel = document.createElement("div");
                var people_comm = document.createElement("div");
                people_comm.className = "commer";
                people_comm.id = "comm_people_" + itemID.slice(1);
                var btn = document.createElement("div");
                description.appendChild(title);
                description.appendChild(line);
                description.appendChild(per);
                description.appendChild(p_com);
                description.appendChild(people_comm);
                if (uname != "") {
                    fiel.className = "field";
                    fiel.innerHTML = "<div id=\"btn_comm\">" +
                        "<textarea name=\"message\" class=\"question\" id=" + ('msg_' + itemID.slice(1)) + " placeholder=\"Оставьте комментарий...\" required autocomplete=\"off\"></textarea>" + "</div>";
                    p_com.appendChild(com_text);
                    btn.innerHTML = "<button onclick='b1()' class='contact100-form-btn2'>" +
                        "<span>" + "Отправить" +
                        "<i class=\"fa fa-long-arrow-right m-l-7\" aria-hidden=\"true\"></i>" + "</span>" +
                        "</button>";
                }
                else {
                    btn.innerHTML = "<button onclick='b2()' class='contact100-form-btn'>" +
                        "<span>" + "Чтобы комментировать, необходимо авторизоваться" +
                        "<i class=\"fa fa-long-arrow-right m-l-7\" aria-hidden=\"true\"></i>" + "</span>" +
                        "</button>";
                }
                row.appendChild(description);
                if (dt[1].length != 17) {
                    var diver = document.getElementById('comm_people_' + itemID.slice(1));
                    diver.innerHTML = dt[1];
                }
                else {
                    var diber = document.createElement("div");
                    diber.className = "goland";
                    diber.id = "goland_" + id;
                    var empty = document.createElement("img");
                    empty.src = "http://localhost:8080/empty.png";
                    diber.appendChild(empty);
                    description.appendChild(diber);
                }
                description.appendChild(fiel);
                description.appendChild(btn);
            }
            else {
                var diver = document.getElementById('comm_people_' + itemID.slice(1));
                diver.innerHTML = dt[1];
            }
            $('.gallery ul').addClass('item_open');
            $(itemID).addClass('item_open');
        }
    });
    return false;
});
$('.close').click(function() {
    $('.port, .gallery ul').removeClass('item_open');
    return false;
});

$(".gallery ul li a").click(function() {
    $('html, body').animate({
        scrollTop: parseInt($("#top").offset().top)
    }, 400);
});

$('#download2').on("click",function() {
    window.location = "http://localhost:8080/login";
});


$('#download').on("click",function() {
    window.location = "http://localhost:8080/register";
});

function b2() {
    window.location = "http://localhost:8080/login";
}

function b1() {
    $.ajax({
        url: 'gallery',
        type: 'post',
        data: {
            action: "add",
            id_ph: id,
            comm: document.getElementById('msg_' + id).value
        },
        success: function (data) {
            if (data.slice(0, 6) == "Exist!") {
                swal("Упс!", "Такой комментарий Вы уже писали!", "error");
            }
            else {
                var im_empt = (document.getElementById('goland_' + id));
                if (im_empt != null) document.getElementById('goland_' + id).style.display = "none";
                var diver = document.getElementById('comm_people_' + id);
                diver.innerHTML = data;
            }
        }
    });
}

$(document).ready(function () {
    get();
});