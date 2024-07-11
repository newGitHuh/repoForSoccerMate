<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Invoice Dashboard</title>
        <link rel="stylesheet" href="css/global/base.css" type="text/css">
        <link rel="stylesheet" href="css/dashboard/invoicedashboard.css" type="text/css">
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Fira+Code:wght@300..700&display=swap" rel="stylesheet" />
    </head>

    <body>
        <div class="dashboard-container">
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
                        <a href="userDashboard" class="nav-item-acc">
                            <i class="bx bx-user"></i>
                            <span>Account</span>
                        </a>
                        
                        <a href="loadInvoice?invoiceID=1" class="nav-item-acc" style="background: black; color: white;">
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
            <div class="invoice-container">
                <strong class="invoice-header">Order List</strong>
                <div class="invoice-list">
                    <c:forEach items="${listInvoice}" var="o">
                        <a href="loadInvoice?invoiceID=${o.getId()}" class="invoice-item invoice-active">
                            <div>
                                <span>#${o.getId()}</span>
                                <i class='bx bx-notepad'></i>
                            </div>
                            <div>
                                <strong>$${o.getTotalPrice()}</strong>
                                <p>Status: ${o.getCompleteStatus()}</p>
                            </div>
                        </a>
                    </c:forEach>
                </div>
            </div>
            <div class="invoice-detail">
                <div class="invoice-detail-header">
                    <strong>Invoice #${invoice.getId()}</strong>
                    <form action="statusChange" method="get" name="filter">
                        <select id="invoice-status" onchange="submitForm()" style="background-color: white; color: black" name="status">
                            <option style="background-color: white; color: black" value="">Select status</option>
                            <option style="background-color: white; color: black" value="pending">Pending</option>                           
                            <option style="background-color: white; color: black" value="completed">Completed</option>
                            <option style="background-color: white; color: black" value="cancelled">Cancelled</option>
                        </select>
                        <input type="hidden" value="${invoice.getId()}" name="invoiceID">
                    </form>
                </div>

                <div class="customer-info">
                    <strong>Customer infomation</strong>
                    <div class="info-item">
                        <p>Name</p>
                        <span>${account.getFullname()}</span>
                    </div>
                    <div class="info-item">
                        <p>Address</p>
                        <span>${invoice.getAddress()}</span>
                    </div>
                    <div class="info-item">
                        <p>Phone</p>
                        <span>0${invoice.getPhone()}</span>
                    </div>
                    <div class="info-item">
                        <p>Email</p>
                        <span>${account.getEmail()}</span>
                    </div>
                </div>
                <div class="detail">
                    <strong>Order detail</strong>
                    <!--                <div class="order-detail">
                                        <p>Invoice created</p>
                                        <span>June 10, 2024</span>
                                    </div>-->
                    <div class="order-detail">
                        <p>Payment method</p>
                        <span>Ship COD</span>
                    </div>
                    <div class="order-detail">
                        <p>Delivery type</p>
                        <span>Fast</span>
                    </div>
                    <div class="order-detail">
                        <p>Order status</p>
                        <span>${invoice.getCompleteStatus()}</span>
                    </div>
                </div>
                <div class="items">
                    <strong>Items</strong>
                    <table>
                        <thead>
                            <tr>
                                <th class="th">Product</th>
                                <th class="th">Amount</th>
                                <th class="th">Qty</th>
                                <th class="th">Total Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listCart}" var="o">
                                <tr>
                                    <td class="td">${o.getProduct().getProductName()}</td>
                                    <td class="td">$${o.getProduct().getPrices()}</td>
                                    <td class="td">${o.getQty()}</td>
                                    <td class="td">$${o.getProduct().getPrices()*o.getQty()}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <tr class="total">
                            <th>Total</th>
                            <th>$${invoice.getTotalPrice()}</th>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                            const accordionBtn = document.getElementById("accords-btn");
                            const accordContent = document.getElementById("accords-content");
                            const icon = document.getElementById("accords-icon");
                            accordionBtn.addEventListener("click", () => {
                                icon.classList.toggle("icon-open");
                                accordContent.classList.toggle("accordion-open");
                            });

                            function submitForm() {

                                // You can also use document.abc.submit() instead of document.forms['abc'].submit()

                                document.forms["filter"].submit();
                            }
        </script>
    </body>

</html>