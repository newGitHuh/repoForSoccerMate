<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Users Dashboard</title>
        <link rel="stylesheet" href="css/global/base.css" type="text/css">
        <link rel="stylesheet" href="css/dashboard/userdashboard.css" type="text/css">
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Fira+Code:wght@300..700&display=swap" rel="stylesheet" />
    </head>

    <body>
        <div class="dashboard-container">
            <div class="add-modal-cover hide" id="addmodal">
                <div class="add-modal">
                    <div class="add-modal-header">
                        <strong>Add New User</strong>
                        <span>Form to add new user here.</span>
                    </div>
                    <form action="addUser" method="get" autocomplete="off" spellcheck="false" class="add-form">
                        <div class="input-item">
                            <label for="fullname">What is user fullname?</label>
                            <input type="text" name="fullname" placeholder="Fullname" />
                        </div>
                        <div class="input-item">
                            <label for="username">Enter email</label>
                            <input type="text" name="email" placeholder="Email" />
                        </div>
                        <div class="input-item">
                            <label for="phone">Enter phone number</label>
                            <input type="text" name="phone" placeholder="Phone" />
                        </div>
                        <div class="input-item">
                            <label for="username">Enter username</label>
                            <input type="text" name="username" placeholder="Username" />
                        </div>
                        <div class="input-item">
                            <label for="password">Enter password.</label>
                            <input type="text" name="password" placeholder="Password" />
                        </div>
<!--                        <div class="select-role">
                            <p>Select user role.</p>
                            <div class="roles">
                                <div>
                                    <input type="radio" id="roleAdmin" value="admin" name="role" class="role-radio"></input>
                                    <label class="role-item" for="roleAdmin">
                                        <i class="bx bx-crown"></i>
                                        <p>
                                            Can manage users include employees and customer, access all
                                            advanced settings !
                                        </p>
                                        <span>Admin</span>
                                    </label>
                                </div>
                                <div>
                                    <input type="radio" id="roleCus" value="sell" name="role" class="role-radio"></input>
                                    <label class="role-item" for="roleCus">
                                        <i class='bx bx-user-circle'></i>
                                        <p>Can view products and received promotions. Cannot access here !</p>
                                        <span>Customer</span>
                                    </label>
                                </div>
                            </div>
                        </div>-->
                        <div class="buttons">
                            <span id="closeadd">Cancel</span>
                            <button type="submit">Create Employees</button>
                        </div>
                    </form>
                </div>
            </div>
            <header class="dashboard-nav-container">
                <div class="dashboard-nav-header">
                    <h2>SOCCERMATE.</h2>
                </div>
                <div class="main-menu">
                    <small>MAIN MENU</small>
                    <div id="accords-btn" class="accordion">
                        <div class="accordion-content">
                            <i class="bx bxs-dashboard"></i>
                            <span>Dashboard</span>
                        </div>
                        <i id="accords-icon" class="bx bx-chevron-up"></i>
                    </div>
                    <div id="accords-content" class="nav-items-accords">
                        <a href="productDashboard" class="nav-item-acc">
                            <i class="bx bx-package"></i>
                            <span>Product</span>
                        </a>
                        <a href="userDashboard" class="nav-item-acc" style="background: black; color: white;">
                            <i class="bx bx-user"></i>
                            <span>Account</span>
                        </a>
                        
                        <a href="loadInvoice?invoiceID=1" class="nav-item-acc">
                            <i class="bx bx-book-content"></i>
                            <span>Invoice</span>
                        </a>
                    </div>
                    <a href="#" class="nav-item">
                        <i class="bx bx-stats"></i>
                        <span>Statistic</span>
                    </a>
                    <a href="#" class="nav-item">
                        <i class="bx bx-notification"></i>
                        <span>Notification</span>
                    </a>
                </div>
                <div class="nav-ultilities">
                    <small>ACCOUNT</small>
                    <div class="ultil-item">
                        <i class="bx bx-help-circle"></i>
                        <span>Help</span>
                    </div>
                    <div class="ultil-item">
                        <i class="bx bx-cog"></i>
                        <span>Settings</span>
                    </div>
                    <a href="productPage" class="ultil-item">
                        <i class="bx bx-log-out"></i>
                        <span>Back to homepage</span>
                    </a>
                </div>
            </header>
            <div class="main-index">
                <div class="dashboard-header-title">
                    <h2>Admin Dashboard</h2>
                </div>
                <div class="cards">
                    <a href="userDashboard" class="card-item">
                        <p>Total users</p>
                        <div class="card-item-content">
                            <strong>${requestScope.countUser} users</strong>

                        </div>

                    </a>
                    <a href="productDashboard" class="card-item">
                        <p>Total products</p>
                        <div class="card-item-content">
                            <strong>${requestScope.countProduct} products</strong>

                        </div>

                    </a>
                    <a href="#" class="card-item">
                        <p>Total invoice</p>
                        <div class="card-item-content">
                            <strong>2 users</strong>

                        </div>

                    </a>
                </div>
                <div class="filter-container">
                    
                        <form name="search" method="get" action="searchUser">
                            <input style="width: 350px;" type="text" autocomplete="off" spellcheck="false" class="filter-search"
                                   placeholder="Search users..." onchange="submitFormSearch()" name="searchParam">
                        </form>
                        
                    <div class="filter">
                        <form name="filter" method="get" action="sortingForAccount">
                            <select name="filter" id="" onchange="submitForm()">
                                <option value="">Filter</option>
                                <option value="ascid">Acsending by ID</option>
                                <option value="descid">Descending by ID</option>
                                <option value="ascname">Acsending by Name</option>
                                <option value="descname">Descending by Name</option>
                            </select>

                        </form>
                        <i class="bx bx-expand-vertical"></i>
                    </div>
                    <button id="openadd">
                        <i class="bx bx-plus-circle"></i>
                        <span>Users</span>
                    </button>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th class="th">ID</th>
                            <th class="th">Username</th>
                            <th class="th">Display name</th>
                            <th class="th">Password</th>
                            <th class="th">Action</i></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}" var="o">
                            <tr>
                                <td class="td">${o.accountID}</td>
                                <td class="td">${o.username}</td>
                                <td class="td">${o.fullname}</td>
                                <td class="td">${o.password}</td>
                                <td class="td">
                                    <i class='bx bx-show-alt'></i>
                                    <i onclick="deleteUser(${o.accountID})" class='bx bx-trash-alt'></i>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <script>
            const accordionBtn = document.getElementById("accords-btn");
            const accordContent = document.getElementById("accords-content");
            const icon = document.getElementById("accords-icon");
            accordionBtn.addEventListener("click", () => {
                icon.classList.toggle("icon-open");
                accordContent.classList.toggle("accordion-open");
            });

            function sort(s) {
                var param = s.value;
                $.ajax({
                    url: "/SoccerMate/sortingForAccount", // replace with your server URL
                    type: "get", //send it through get method
                    data: {
                        filter: param
                    },
                    success: function (data) {
                        // process the response data here
                        console.log(data);
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                        console.log(xhr);
                    }
                });
            }
            
            function deleteUser(s) {
                
                $.ajax({
                    url: "/SoccerMate/deleteUser", // replace with your server URL
                    type: "get", //send it through get method
                    data: {
                        uid: s
                    },
                    success: function (data) {
                        // process the response data here
                        location.reload();
                        console.log(uid);
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                        console.log(xhr);
                    }
                });
            }
            
            
            function submitForm() {
                
                // You can also use document.abc.submit() instead of document.forms['abc'].submit()
                
                document.forms["filter"].submit();
            }
            function submitFormSearch() {
                
                // You can also use document.abc.submit() instead of document.forms['abc'].submit()
                
                document.forms["search"].submit();
            }
        </script>
        <script src="js/toggleAdd.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </body>

</html>