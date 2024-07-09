<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cart</title>
        <link rel="stylesheet" href="css/global/base.css" type="text/css">
        <link rel="stylesheet" href="css/checkout/cartpage.css" type="text/css">
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" >
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" >
        <link rel="preconnect" href="https://fonts.googleapis.com" >
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin >
        <link href="https://fonts.googleapis.com/css2?family=Fira+Code:wght@300..700&display=swap" rel="stylesheet" >
    </head>

    <body>
        <div class="cart-container">
            <%@include file="stuff.jsp" %>
            <header class="navbar-container">
                <nav class="navbar">
                    <a href="productPage">SOCCERMATE</a>


                    <div class="ultilities">
                        <a href="">
                            <i class="bx bx-cart"></i>
                        </a>
                        <span>
                            <i id="opensetting" class="bx bx-cog"></i>
                        </span>
                    </div>

                </nav>
            </header>
            <div class="cart-index">
                <h2>Your Cart</h2>
                <div class="table-value">
                    <p>Item</p>
                    <p>Price</p>
                    <p>Qty</p>
                    <p>Total</p>
                </div>
                <div class="cart-list">
                    <c:forEach items="${sessionScope.listCart}" var="o">
                        <div class="cart-item">
                            <img src="${o.getProduct().getProductImg()}" alt="">
                            <div class="product-name">
                                <p>${o.getProduct().getProductName()}</p>
                                <a href="">Remove</a>
                            </div>
                            <p class="price-per-product">$${o.getProduct().getPrices()}</p>

                            <div class="quantity">
                                <p class="minus" onclick="updateQty(${o.getProduct().getProductID()}, -1,${o.getQty()})">-</p>

                                <input id="qty-${o.getProduct().getProductID()}" class="num" type="text" value="${o.getQty()}" disabled="">

                                <p class="plus" onclick="updateQty(${o.getProduct().getProductID().charAt(0)}, +1,${o.getQty()})">+</p>
                            </div>

                            <span class="cart-total-price">$${o.getQty() * o.getProduct().getPrices()}</span>
                        </div>
                    </c:forEach>
                </div>
                <div class="summary">
                    <strong>Order Summary</strong>
                    <div class="summary-item">
                        <p>SUBTOTAL</p>
                        <span>$0.00</span>
                    </div>
                    <div class="summary-item">
                        <p>TAX</p>
                        <span>$0.00</span>
                    </div>
                    <div class="summary-item">
                        <p>TOTAL</p>
                        <span>$0.00</span>
                    </div>
                    <a href="checkout">Checkout</a>
                </div>
            </div>
            <footer class="footer-container">
                <div class="inner-footer">
                    <div class="social">
                        <div class="social-logos">
                            <a href="">
                                <i class="bx bxl-github"></i>
                            </a>
                            <a href="">
                                <i class="bx bxl-facebook"></i>
                            </a>
                            <a href="">
                                <i class="bx bxl-instagram"></i>
                            </a>
                            <a href="">
                                <i class="bx bxl-dribbble"></i>
                            </a>
                            <a href="">
                                <i class="bx bxl-tiktok"></i>
                            </a>
                        </div>
                        <div class="foot-nav">
                            <a href="">TERMS</a>
                            <a href="">SITEMAPS</a>
                            <a href="">PRIVACY</a>
                        </div>
                    </div>
                    <div class="logo-container">
                        <h2>SOCCERMATE</h2>
                        <h2>SOCCERMATE</h2>
                        <h2>SOCCERMATE</h2>
                    </div>
                    <div class="copyright"></div>
                </div>
            </footer>
        </div>
        <script>
            const setting = document.getElementById("setting");
            const childsetting = document.getElementById("animatesetting");
            const opensetting = document.getElementById("opensetting");
            const closesetting = document.getElementById("exitsetting");
            opensetting.addEventListener("click", () => {
                setting.classList.add("opensetting");
                setting.classList.remove("closesetting");
                setTimeout(() => {
                    childsetting.classList.add("animated");
                    childsetting.classList.remove("non-animated");
                }, 200);
            });
            closesetting.addEventListener("click", () => {
                childsetting.classList.remove("animated");
                childsetting.classList.add("non-animated");
                setTimeout(() => {
                    setting.classList.remove("opensetting");
                    setting.classList.add("closesetting");
                }, 500);
            });



            function updateQty(itemId, qtyChange,currentQty1) {
                
                console.log(itemId);
                if (true) {
                    var currentQty = parseInt(currentQty1);
                    var newQty = currentQty + qtyChange;

                    // Update the quantity in the input field
                    
                    
                    // Send an AJAX request to update the quantity on the server
                    $.ajax({
                        url: "/SoccerMate/test", // replace with your server URL
                        type: "get",
                        data: {
                            itemId: itemId,
                            qty: newQty
                        },
                        success: function (data) {
                            // process the response data here
                            location.reload();
                        },
                        error: function (xhr) {
                            //Do Something to handle error
                            console.log(xhr);
                        }
                    });
                }}
        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="js/number.js"></script>
    </body>

</html>