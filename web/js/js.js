
function loadXML()

{
    var xmlhttp;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function ()
    {
        //var error = document.getElementById("error"); 
        if (xmlhttp.readyState == 4)
        {
            if (xmlhttp.response === "Login successful") {
                window.location.href = "controller?action=Login&u_name=" + username;
            }

            else {
            }
            document.getElementById("myDiv").innerHTML = xmlhttp.responseText;
        }
    }

    var username = document.getElementById("username").value;
    var pass = document.getElementById("password").value;
    var url = "controller?action=checklogin&username=" + username + "&password=" + pass;
    xmlhttp.open("POST", url, true);
    xmlhttp.send();
}



function loadXMLDoc()
{
    var xmlhttp;
    var k = document.getElementById("u_name").value;
    var urls = "controller?action=checkuser&ver=" + k;

    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();
    }
    else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function ()
    {
        if (xmlhttp.readyState == 4)
        {
            //document.getElementById("err").style.color="red";
            document.getElementById("err").innerHTML = xmlhttp.responseText;

        }
    }
    xmlhttp.open("GET", urls, true);
    xmlhttp.send();
}

function toggle_visibility(id) {
    var e = document.getElementById(id);
    if (e.style.display == 'block')
        e.style.display = 'none';
    else
        e.style.display = 'block';
}

function toggle_2(id) {
    var e = document.getElementById(id);
    if (e.style.display == 'block')
        e.style.display = 'none';
    else
        e.style.display = 'block';
}

function toggle_3(id) {
    var e = document.getElementById(id);
    if (e.style.display == 'block')
        e.style.display = 'none';
    else
        e.style.display = 'block';
}

function toggle_4(id) {
    var e = document.getElementById(id);
    if (e.style.display == 'block')
        e.style.display = 'none';
    else
        e.style.display = 'block';
}

var _0xe23d = ["\x69\x6E\x6E\x65\x72\x48\x54\x4D\x4C", "\x65\x72\x72", "\x67\x65\x74\x45\x6C\x65\x6D\x65\x6E\x74\x42\x79\x49\x64", "", "\x65\x6D\x61\x69\x6C\x5F\x65\x72\x72\x6F\x72", "\x72\x65\x5F\x70\x61\x73\x73\x5F\x65\x72\x72\x6F\x72", "\x70\x61\x73\x73\x5F\x65\x72\x72\x6F\x72", "\x70\x68\x6F\x6E\x65\x5F\x65\x72\x72\x6F\x72", "\x66\x75\x6C\x6C\x6E\x61\x6D\x65\x5F\x65\x72\x72\x6F\x72", "\x76\x61\x6C\x75\x65", "\x75\x5F\x6E\x61\x6D\x65", "\x65\x6D\x61\x69\x6C", "\x70\x61\x73\x73", "\x72\x65\x5F\x70\x61\x73\x73", "\x70\x68\x6F\x6E\x65", "\x66\x75\x6C\x6C\x6E\x61\x6D\x65", "\x50\x6C\x65\x61\x73\x65\x20\x65\x6E\x74\x65\x72\x20\x75\x73\x65\x72\x20\x6E\x61\x6D\x65\x2E", "\x50\x6C\x65\x61\x73\x65\x20\x65\x6E\x74\x65\x72\x20\x70\x61\x73\x73\x77\x6F\x72\x64\x2E", "\x50\x6C\x65\x61\x73\x65\x20\x65\x6E\x74\x65\x72\x20\x72\x65\x2D\x70\x61\x73\x73\x77\x6F\x72\x64\x2E", "\x6C\x65\x6E\x67\x74\x68", "\x50\x6C\x65\x61\x73\x65\x20\x65\x6E\x74\x65\x72\x20\x6D\x6F\x72\x65\x20\x74\x68\x65\x6E\x20\x34\x20\x63\x68\x61\x72\x61\x63\x74\x65\x72\x2E", "\x44\x6F\x6E\x27\x74\x20\x6D\x61\x74\x63\x68\x20\x70\x61\x73\x73\x77\x6F\x72\x64\x2E", "\x50\x6C\x65\x61\x73\x65\x20\x65\x6E\x74\x65\x72\x20\x65\x6D\x61\x69\x6C\x20\x61\x64\x64\x72\x65\x73\x73\x2E", "\x74\x65\x73\x74", "\x50\x6C\x65\x61\x73\x65\x20\x65\x6E\x74\x65\x72\x20\x76\x61\x6C\x69\x64\x20\x65\x6D\x61\x69\x6C\x20\x61\x64\x64\x72\x65\x73\x73\x2E", "\x50\x6C\x65\x61\x73\x65\x20\x65\x6E\x74\x65\x72\x20\x70\x68\x6F\x6E\x65\x20\x6E\x75\x6D\x62\x65\x72\x2E", "\x50\x6C\x65\x61\x73\x65\x20\x65\x6E\x74\x65\x72\x20\x79\x6F\x75\x72\x20\x66\x75\x6C\x6C\x20\x6E\x61\x6D\x65\x2E", "\x66\x6F\x63\x75\x73", "\x50\x6C\x65\x61\x73\x65\x20\x65\x6E\x74\x65\x72\x20\x76\x61\x6C\x69\x64\x20\x20\x70\x68\x6F\x6E\x65\x20\x6E\x75\x6D\x62\x65\x72\x2E"];
function validation() {
    document[_0xe23d[2]](_0xe23d[1])[_0xe23d[0]] = _0xe23d[3];
    document[_0xe23d[2]](_0xe23d[4])[_0xe23d[0]] = _0xe23d[3];
    document[_0xe23d[2]](_0xe23d[5])[_0xe23d[0]] = _0xe23d[3];
    document[_0xe23d[2]](_0xe23d[6])[_0xe23d[0]] = _0xe23d[3];
    document[_0xe23d[2]](_0xe23d[7])[_0xe23d[0]] = _0xe23d[3];
    document[_0xe23d[2]](_0xe23d[8])[_0xe23d[0]] = _0xe23d[3];
    var _0xe598x2 = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9])/;
    var _0xe598x3 = document[_0xe23d[2]](_0xe23d[10])[_0xe23d[9]];
    var _0xe598x4 = document[_0xe23d[2]](_0xe23d[11])[_0xe23d[9]];
    var _0xe598x5 = document[_0xe23d[2]](_0xe23d[12])[_0xe23d[9]];
    var _0xe598x6 = document[_0xe23d[2]](_0xe23d[13])[_0xe23d[9]];
    var _0xe598x7 = document[_0xe23d[2]](_0xe23d[14])[_0xe23d[9]];
    var _0xe598x8 = document[_0xe23d[2]](_0xe23d[15])[_0xe23d[9]];
    var _0xe598x9 = true;
    var _0xe598xa = _0xe23d[3];
    if (_0xe598x3 == _0xe23d[3]) {
        document[_0xe23d[2]](_0xe23d[1])[_0xe23d[0]] = _0xe23d[16];
        if (_0xe598xa == _0xe23d[3]) {
            _0xe598xa = _0xe23d[10];
        }
        ;
        _0xe598x9 = false;
    }
    ;
    //password
    if (_0xe598x5 == _0xe23d[3]) {
        document[_0xe23d[2]](_0xe23d[6])[_0xe23d[0]] = _0xe23d[17];
        if (_0xe598xa == _0xe23d[3]) {
            _0xe598xa = _0xe23d[12];
        }
        ;
        _0xe598x9 = false;
    } else {
        if (_0xe598x6 == _0xe23d[3]) {
            document[_0xe23d[2]](_0xe23d[5])[_0xe23d[0]] = _0xe23d[18];
            if (_0xe598xa == _0xe23d[3]) {
                _0xe598xa = _0xe23d[13];
            }
            ;
            _0xe598x9 = false;
        } else {
            if (4 > _0xe598x5[_0xe23d[19]]) {
                document[_0xe23d[2]](_0xe23d[6])[_0xe23d[0]] = _0xe23d[20];
                if (_0xe598xa == _0xe23d[3]) {
                    _0xe598xa = _0xe23d[12];
                }
                ;
                _0xe598x9 = false;
            } else {
                if (_0xe598x5 != _0xe598x6) {
                    document[_0xe23d[2]](_0xe23d[5])[_0xe23d[0]] = _0xe23d[21];
                    if (_0xe598xa == _0xe23d[3]) {
                        _0xe598xa = _0xe23d[13];
                    }
                    ;
                    _0xe598x9 = false;
                }
                ;
            }
            ;
        }
        ;
    }
    ;
    //email
    if (_0xe598x4 == _0xe23d[3]) {
        document[_0xe23d[2]](_0xe23d[4])[_0xe23d[0]] = _0xe23d[22];
        if (_0xe598xa == _0xe23d[3]) {
            _0xe598xa = _0xe23d[11];
        }
        ;
        _0xe598x9 = false;
    } else {
        if (!_0xe598x2[_0xe23d[23]](_0xe598x4)) {
            document[_0xe23d[2]](_0xe23d[4])[_0xe23d[0]] = _0xe23d[24];
            if (_0xe598xa == _0xe23d[3]) {
                _0xe598xa = _0xe23d[11];
            }
            ;
            _0xe598x9 = false;
        }
        ;
    }
    ;
    //phone
    var RE = /^[\d\.\-]+$/;
    if (_0xe598x7 == _0xe23d[3]) {
        document[_0xe23d[2]](_0xe23d[7])[_0xe23d[0]] = _0xe23d[25];
        if (_0xe598xa == _0xe23d[3]) {
            _0xe598xa = _0xe23d[14];
        }
        ;
        _0xe598x9 = false;
    } else {
        if (!RE.test(_0xe598x7)) {
            document[_0xe23d[2]](_0xe23d[7])[_0xe23d[0]] = _0xe23d[28];
            if (_0xe598xa == _0xe23d[3]) {
                _0xe598xa = _0xe23d[14];
            }
            ;
            _0xe598x9 = false;
        }
        ;
    }
    ;
    if (_0xe598x8 == _0xe23d[3]) {
        document[_0xe23d[2]](_0xe23d[8])[_0xe23d[0]] = _0xe23d[26];
        if (_0xe598xa == _0xe23d[3]) {
            _0xe598xa = _0xe23d[15];
        }
        ;
        _0xe598x9 = false;
    }
    ;
    if (_0xe598xa != _0xe23d[3]) {
        document[_0xe23d[2]](_0xe598xa)[_0xe23d[27]]();
    }
    ;
    return _0xe598x9;
}
;

function validation2()
{
    document.getElementById("projectname_error").innerHTML = "";
    document.getElementById("description_error").innerHTML = "";


    var projectname = document.getElementById("projectname").value;
    var description = document.getElementById("description").value;

    var flag = true;
    var focus = "";


    if (projectname == "")
    {
        document.getElementById("projectname_error").innerHTML = "Please enter projectname.";
        if (focus == "")
            focus = "projectname";
        flag = false;
    }
    if (description == "")
    {
        document.getElementById("description_error").innerHTML = "Please enter description.";
        if (focus == "")
            focus = "description";
        flag = false;
    }
    else if (15 > description.length)
    {
        document.getElementById("description_error").innerHTML = "Please enter more then 15 character.";
        if (focus == "")
            focus = "description";
        flag = false;
    }




    if (focus != "")
        document.getElementById(focus).focus();
    return flag;
}


function validation3()
{

    document.getElementById("email_error").innerHTML = "";
    document.getElementById("re_pass_error").innerHTML = "";
    document.getElementById("pass_error").innerHTML = "";
    document.getElementById("phone_error").innerHTML = "";
    document.getElementById("name_error").innerHTML = "";

    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9])/;


    var email = document.getElementById("email").value;
    var pass = document.getElementById("pass").value;
    var re_pass = document.getElementById("re_pass").value;
    var phone = document.getElementById("phone").value;
    var name = document.getElementById("name").value;

    var flag = true;
    var focus = "";

    if (pass == "")
    {
        document.getElementById("pass_error").innerHTML = "Please enter password.";
        if (focus == "")
            focus = "pass";
        flag = false;
    }
    else if (re_pass == "")
    {
        document.getElementById("re_pass_error").innerHTML = "Please enter re-password.";
        if (focus == "")
            focus = "re_pass";
        flag = false;
    }
    else if (4 > pass.length)
    {
        document.getElementById("pass_error").innerHTML = "Please enter more then 4 character.";
        if (focus == "")
            focus = "pass";
        flag = false;
    }
    else if (pass != re_pass)
    {
        document.getElementById("re_pass_error").innerHTML = "Don't match password.";
        if (focus == "")
            focus = "re_pass";
        flag = false;
    }

    if (email == "")
    {
        document.getElementById("email_error").innerHTML = "Please enter email address.";
        if (focus == "")
            focus = "email";
        flag = false;
    }
    else if (!filter.test(email))
    {
        document.getElementById("email_error").innerHTML = "Please enter valid email address.";
        if (focus == "")
            focus = "email";
        flag = false;
    }
    if (phone == "")
    {
        document.getElementById("phone_error").innerHTML = "Please enter phone number.";
        if (focus == "")
            focus = "phone";
        flag = false;
    }
    if (name == "")
    {
        document.getElementById("name_error").innerHTML = "Please enter full name.";
        if (focus == "")
            focus = "name";
        flag = false;
    }
    if (focus != "")
        document.getElementById(focus).focus();
    return flag;
}

function validation4()
{
    document.getElementById("subject_error").innerHTML = "";
    document.getElementById("message_error").innerHTML = "";


    var subject = document.getElementById("subject").value;
    var message = document.getElementById("message").value;

    var flag = true;
    var focus = "";


    if (subject == "")
    {
        document.getElementById("subject_error").innerHTML = "Please enter subject.";
        if (focus == "")
            focus = "subject";
        flag = false;
    }
    if (message == "")
    {
        document.getElementById("message_error").innerHTML = "Please enter message.";
        if (focus == "")
            focus = "message";
        flag = false;
    }
    else if (15 > message.length)
    {
        document.getElementById("message_error").innerHTML = "Please enter more than 15 character.";
        if (focus == "")
            focus = "message";
        flag = false;
    }




    if (focus != "")
        document.getElementById(focus).focus();
    return flag;
}


