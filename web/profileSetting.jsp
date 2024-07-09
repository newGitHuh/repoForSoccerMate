<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Profile Setting</title>
  <link rel="stylesheet" href="css/global/base.css" type="text/css">
  <link rel="stylesheet" href="css/setting/setting.css" type="text/css">
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
      <strong>Profile settings</strong>
      <span>Setup your account information: name, phone number and email.</span>
    </div>
    <div class="setting">
      <div class="setting-nav">
        <a href="" style="background: #e4e4e4">Profile</a>
        <a href="security.jsp">Security</a>
        <a href="productPage">Return to homepage</a>
      </div>
      <div class="setting-main">
        <div class="setting-main-header">
          <strong>Profile</strong>
          <span>This is how others will see you on the site.</span>
        </div>
          <form action="settingAccount" class="profile-form" autocomplete="off" spellcheck="false" method="get">
          <div class="form-item">
            <label for="">Fullname</label>
            <input type="text" placeholder="${sessionScope.user.fullname}" name="displayName"/>
            
          </div>
          <div class="form-item">
            <label for="">Phone number</label>
            <input type="text" placeholder="${sessionScope.user.phone}" name="phone"/>
            <small>You can manage your phone number</small>
          </div>
            
          <div class="form-item">
            <label for="">Email</label>
            <input type="text" placeholder="${sessionScope.user.email}" name="email" disabled value="${sessionScope.user.email}"/>
            
          </div>
            
          <button class="submitbutton">Update Profile</button>
        </form>
      </div>
    </div>
  </div>
</body>

</html>