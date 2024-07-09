<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Signup</title>
        <link rel="stylesheet" href="/css/global/base.css" />
        <link rel="stylesheet" href="/css/auth/signup.css" />
        <link
            href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
            rel="stylesheet"
            />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
            />
        <link rel="stylesheet" href="css/auth/signup.scss" type="text/css">
        <link rel="stylesheet" href="css/global/base.css" type="text/css">
    </head>

    <body>
        <div class="auth-container">
            <div class="inner-auth-container">
                <div class="section-left">
                    <div class="inner-section-left">
                        <a class="return" href="login.jsp">
                            <i class="bx bx-arrow-back"></i>
                        </a>
                        <div class="section-left-header">
                            <h2>Become a Member</h2>
                            <div class="signin">
                                <small>Have Account?</small>
                                <a href="login.jsp">Login now</a>
                            </div>
                        </div>
                        <form
                            action="signup"
                            class="login-form"
                            spellcheck="false"
                            autocomplete="off"
                            method="post"
                            >
                            <div class="fullname">
                                <div class="name-container">
                                    <input type="text" placeholder="First name" name="firstname" required/>
                                </div>
                                <div class="name-container">
                                    <input type="text" placeholder="Last name" name="lastname" required/>
                                </div>
                            </div>
                            <div class="input-container">
                                <input type="text" placeholder="Enter your email" name="email" required/>
                            </div>
                            <div class="input-container">
                                <input type="text" placeholder="Enter your phone number " name="phone" required/>
                            </div>
                            <div class="input-container">
                                <input onchange="checkUser(this)" type="text" placeholder="Enter username" name="username" value="${username}" required/>
                                <span id="context"></span>
                            </div>
                            <div class="input-container">
                                <input type="password" placeholder="Enter password" name="password" required/>
                                <span class="material-symbols-outlined eye">visibility</span>
                            </div>
                            <div class="input-container">
                                <input type="password" placeholder="Confirm password"/>
                                <span class="material-symbols-outlined eye">visibility</span>
                            </div>
                            <input
                                type="submit"
                                class="login-btn"
                                value="Create new account"
                                />
                        </form>
                        <div class="or">
                            <span>Or signup with</span>
                        </div>
                        <div class="oauth">
                            <div class="oauth-item">
                                <i class="bx bxl-google"></i>
                                <span>Signup With Google</span>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="section-right">
                    <img src="assets/signup1.jpg" alt="" />
                    <div class="inner-section-right"></div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            function checkUser(s) {
                var param = s.value;
                $.ajax({
                    url: "/SoccerMate/checkDuplicateUser",
                    type: "get", //send it through get method
                    data: {
                        username: param
                    },
                    success: function (data) {
                        var row = document.getElementById("context");
                        if (data === "yes") {
                            row.innerHTML = 'duplicate nigger';
                        } else {
                            console.log(data);
                            row.innerHTML = '';
                        }
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                        console.log(xhr);
                    }
                });
            }
        </script>
    </body>
</html>
