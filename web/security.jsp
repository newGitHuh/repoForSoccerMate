<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Security Setting</title>
        <link rel="stylesheet" href="css/global/base.css" type="text/css"/>
        <link rel="stylesheet" href="css/setting/setting.css" type="text/css"/>
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Fira+Code:wght@300..700&display=swap" rel="stylesheet" />
    </head>

    <body>
        <div class="setting-container">
            <div class="setting-header">
                <strong>Security settings</strong>
                <span>Manage your account username, password or set Two factor
                    authentication.</span>
            </div>
            <div class="setting">
                <div class="setting-nav">
                    <a href="profileSetting.jsp">Profile</a>
                    <a href="security.jsp" style="background: #e4e4e4">Security</a>
                    <a href="productPage">Return to homepage</a>
                </div>
                <div class="setting-main">
                    <div class="setting-main-header">
                        <strong>Security</strong>
                        <span>This is how you protect your account.</span>
                    </div>
                    <form action="updateUserPass" class="profile-form" autocomplete="off" spellcheck="false" method="get">
                        <div class="form-item">
                            <label for="">Username</label>
                            <input type="text" name="" value="${sessionScope.user.username}" disabled>
                            <input type="hidden" name="username" value="${sessionScope.user.username}">
                            <small id="checkValid" style="color: red;"></small>

                        </div>
                        <div class="form-item">
                            <label for="">password</label>
                            <input type="text" placeholder="*********" name="password" id="password"/>
                            <small>You can manage your password here</small>
                        </div>
                        <div class="form-item">
                            <label for="">Confirm Password</label>
                            <input type="text" placeholder="*********" name="confirmPassword" id="confirmPassword"/>
                            <small>Passwords must match</small>
                            <small id="password-match" style="color: red;"></small>
                        </div>

                        <button class="submitbutton" id="submit-btn">Update</button>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
                                const passwordInput = document.getElementById('password');
                                const confirmPasswordInput = document.getElementById('confirmPassword');
                                const passwordMatchSpan = document.getElementById('password-match');
                                const submitBtn = document.getElementById('submit-btn');

                                confirmPasswordInput.addEventListener('input', () => {
                                    if (passwordInput.value !== confirmPasswordInput.value) {
                                        passwordMatchSpan.textContent = 'Passwords do not match';
                                        submitBtn.disabled = true;
                                    } else {
                                        passwordMatchSpan.textContent = '';
                                        submitBtn.disabled = false;
                                    }
                                });

                                function checkValid(s) {
                                    var param = s.value;
                                    $.ajax({
                                        url: "/SoccerMate/checkDuplicateUser",
                                        type: "post", //send it through get method
                                        data: {
                                            username: param
                                        },
                                        success: function (data) {
                                            var row = document.getElementById("checkValid");
                                            if (data === "yes") {
                                                row.innerHTML = 'duplicate nigger';
                                                submitBtn.disabled = true
                                            } else {
                                                console.log(data);
                                                row.innerHTML = '';
                                                submitBtn.disabled = false;
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