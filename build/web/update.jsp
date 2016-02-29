
<%@ include file="/import.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Edit your account</title>
        <link href="css/paper.css" rel="stylesheet" rev="stylesheet" />
        <link rel="stylesheet" href="css/elegant-aero2.css" type="text/css">
        <link href="css/styles.css" rel="stylesheet">

        <style>
            .myButton {
                background-color:#f5f5f5;
                -moz-border-radius:14px;
                -webkit-border-radius:14px;
                border-radius:14px;
                border: 2px solid;
                display:inline-block;
                cursor:pointer;
                color:orange;
                margin-left: 0px;
                font-family:Courier New;
                font-size:13px;
                padding:3px 15px;
                text-decoration:none;
            }

            .myButton:active {
                position:relative;
                top:1px;
            }

        </style>
    </head>
    <body>
        <section class="paper">
            <%    for (User u : User_infor) {
            %>
            <form action="controller" method="post" class="elegant-aero">
                <h1>Edit your account</h1>
                <label>
                    <span>Full name</span>
                    <input id="name" type="text" name="fullname" value="<%=u.getFullname()%>"  autocomplete="off" />
                </label><center><span style="color:orangered;margin-right: 90px" id="name_error" class="error"></span></center>
                <br>
                <label>

                    <span>Email address</span>
                    <input id="email" type="text" name="email" value="<%=u.getEmail()%>" autocomplete="off"/>
                </label><center><span style="color:orangered;margin-right: 90px" id="email_error" class="error"></span></center>
                <br>
                <label>

                    <span>Telephone</span>
                    <input id="phone" type="text" name="phone" value="<%=u.getPhone_Num()%>" autocomplete="off"/>
                </label><center><span style="color:orangered;margin-right: 90px" id="phone_error" class="error"></span></center>
                <br>
                <label>

                    <span>Password</span>
                    <input id="pass" type="password" name="pass" onclick="this.value = '';" onfocus="this.select()" onblur="this.value = !this.value ? '<%=u.getPassword()%>' : this.value;" value="<%=u.getPassword()%>" autocomplete="off"/>
                </label> <center><span style="color:orangered;margin-right: 90px" id="pass_error" class="error"></span></center>
                <br>
                <label>

                    <span>Confirm password</span>
                    <input id="re_pass" type="password" name="re_pass" onclick="this.value = '';" onfocus="this.select()" onblur="this.value = !this.value ? '<%=u.getPassword()%>' : this.value;" value="<%=u.getPassword()%>" autocomplete="off"/>
                </label>  <center><span style="color:orangered;margin-right: 90px" id="re_pass_error" class="error"></span></center>


                <br>

                <label>
                    <span>&nbsp;</span>
                    <input type="hidden" name="action" value="updatePerson">
                    <input type="hidden" name="username" value="<%=user%>">
                    <input type="submit" onclick="return validation3()" class="button" value="Save changes" /> or <a style="color:red" href="controller?action=cancel">Cancel</a>
                </label> 
            </form>
            <%}%>
        </section>

    </body>
</html>