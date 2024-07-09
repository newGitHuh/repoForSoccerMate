<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Login</title>
        <link rel="stylesheet" href="/css/global/base.css" />
        <link rel="stylesheet" href="/css/auth/login.css" />
        <link
            href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
            rel="stylesheet"
            />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
            />
        <link rel="stylesheet" href="css/auth/signup.scss" type="text/css">
        <link rel="stylesheet" href="css/global/base.css" type="text/css"/>
        <link rel="stylesheet" href="css/auth/login.css" type="text/css">





    </head>

    <body>
        <div class="auth-container">
            <div class="inner-auth-container">
                <div class="section-left">
                    <img src="assets/login1.jpg" alt=""/>
                    <div class="inner-section-right"></div>
                </div>
                <div class="section-right">
                    <div class="inner-section-left">
                        <div class="section-left-header">
                            <img src="assets/logo1.webp" alt="" />
                            <h2>Login to Sportz®</h2>
                            <small>
                                Never give up! Failure and rejection are only the first step to
                                succeeding.
                            </small>
                        </div>
                        <form
                            action="login"
                            class="login-form"
                            spellcheck="false"
                            autocomplete="off"
                            method="post"
                            >
                            <div class="input-container">
                                <input type="text" placeholder="Username or Email" name="username" required/>
                            </div>
                            <div class="input-container">
                                <input type="password" placeholder="Password" name="password" required/>
                                <span class="material-symbols-outlined">visibility</span>
                            </div>
                            <input type="submit" class="login-btn" value="Sign In" />
                        </form>
                        <div class="or">
                            <span>Or authorize with</span>
                        </div>
                        <div class="oauth">
                            <div class="oauth-item">
                                <i class="bx bxl-google"></i>
                                <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8080/SoccerMate/LoginGoogleHandler&response_type=code&client_id=658676113995-ddeu9hvgps5dsqdkfk7bpmh2c3qpn388.apps.googleusercontent.com&approval_prompt=force">Google</a>
                            </div>

                        </div>
                        <div class="other">
                            
                            <div class="signup">
                                <p>Don't have an account?</p>
                                <a href="signup.jsp">Sign up</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
