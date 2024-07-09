<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Products Dashboard</title>
        <link rel="stylesheet" href="css/global/base.css" type="text/css">
        <link rel="stylesheet" href="css/dashboard/productdashboard.css" type="text/css">
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
                        <strong>Add New Product</strong>
                        <span>Form to add new product here.</span>
                    </div>
                    <form action="addProduct" method="get" autocomplete="off" spellcheck="false" class="add-form">
                        <div class="input-item">
                            <label for="fullname">Product name *</label>
                            <input type="text" placeholder="PredatorX T-shirt" name="name"/>
                        </div>
                        <div class="input-item">
                            <label for="username">Image (URL) *</label>
                            <input type="text" placeholder="https://static.nike.com/a/images/shirt1.png" name="img"/>
                        </div>
                        <div class="input-item">
                            <label for="price">Price</label>
                            <input type="text" placeholder="299" name="price"/>
                        </div>
                        <div class="input-item">
                            <label for="des">Description</label>
                            <textarea name="des" id="" placeholder="Lorem ispum..."></textarea>
                        </div>
                        <div class="input-item">
                            <label for="password">Category</label>
                            <select name="category" id="">
                                <option value="">Select category</option>
                                <c:forEach items="${listCate}" var="c">
                                    <option value="${c.productCategory}">${c.productCategory}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="buttons">
                            <span id="closeadd">Cancel</span>
                            <button type="submit">Create A Product</button>
                        </div>
                    </form>
                </div>
            </div>


            <!-- dont change this -->
            <header class="dashboard-nav-container">
                <div class="dashboard-nav-header">
                    <h2>SOCCERMATE</h2>
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
                        <a href="productDashboard" class="nav-item-acc" style="background: black; color: white;">
                            <i class="bx bx-package"></i>
                            <span>Product</span>
                        </a>
                        <a href="userDashboard" class="nav-item-acc">
                            <i class="bx bx-user"></i>
                            <span>Account</span>
                        </a>
                        <a href="#" class="nav-item-acc">
                            <i class="bx bx-hive"></i>
                            <span>Category</span>
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
                    <h2>Production Dashboard</h2>
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


                    <form name="search" method="get" action="searchByProductForAdmin">
                        <input style="width: 350px;" type="text" autocomplete="off" spellcheck="false" class="filter-search"
                               placeholder="Search products..." onchange="submitFormSearch()" name="searchParam">
                    </form>
                    
                    <div class="filter">
                        <form action="sortingForProduct" method="get" name="filter">
                            <select name="sortBy" id="" onchange="submitForm()">
                                <option value="">Filter</option>
                                <option value="asc">Acsending by price</option>
                                <option value="desc">Descending by price</option>
                                <option value="">Sort by Category</option>

                            </select>
                        </form>
                        <i class="bx bx-expand-vertical"></i>
                    </div>
                    <button id="openadd">
                        <i class="bx bx-plus-circle"></i>
                        <span>Products</span>
                    </button>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th class="th">ID</th>
                            <th class="th">Name</th>
                            <th class="th">Price</th>
                            <th class="th">Category</th>
                            <th class="th">Action</i></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listProduct}" var="o">
                            <tr>
                                <td class="td">${o.productID}</td>
                                <td class="td">${o.productName}</td>
                                <td class="td">${o.prices}</td>
                                <td class="td">${o.productCategory}</td>
                                <td class="td">
                                    <i onclick="Edit(${o.productID})" class='bx bx-edit-alt'></i>
                                    <a href="deleteProduct?pid=${o.productID}">
                                        <i class='bx bx-trash-alt'></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <script src="js/toggleAdd.js"></script>



        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
                                        const accordionBtn = document.getElementById("accords-btn");
                                        const accordContent = document.getElementById("accords-content");
                                        const icon = document.getElementById("accords-icon");
                                        accordionBtn.addEventListener("click", () => {
                                            icon.classList.toggle("icon-open");
                                            accordContent.classList.toggle("accordion-open");
                                        });

                                        function Edit(s) {

                                            $.ajax({
                                                url: "/SoccerMate/editProduct",
                                                type: "post", //send it through get method
                                                data: {
                                                    pid: s
                                                },
                                                success: function (data) {
                                                    window.open("editProduct.jsp", "_blank");
                                                },
                                                error: function (xhr) {
                                                    //Do Something to handle error
                                                    console.log(xhr);
                                                }
                                            });
                                        }

                                        function deleteProduct(s) {

                                            $.ajax({
                                                url: "/SoccerMate/deleteProduct",
                                                type: "post", //send it through get method
                                                data: {
                                                    pid: s
                                                },
                                                success: function (data) {
                                                    location.reload();
                                                    console.log(s);
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
        </script>

    </body>

</html>