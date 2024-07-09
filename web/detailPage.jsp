<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Name</title>
        <link rel="stylesheet" href="css/global/base.css" type="text/css">
        <link rel="stylesheet" href="css/detailpage/detailpage.css" type="text/css">
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Fira+Code:wght@300..700&display=swap" rel="stylesheet" />
    </head>

    <body>
        <div class="detailpage-container">
            <%@include file="stuff.jsp" %>
            <header class="navbar-container">
                <nav class="navbar">
                    <a href="productPage">SOCCERMATE</a>
                    <form class="search-form" action="">
                        <input type="text" placeholder="Search..." />
                        <button type="submit">
                            <i class="bx bx-search-alt"></i>
                        </button>
                    </form>
                    <!--                    <div class="navigation">
                                            <a href="productspage.html">Stores</a>
                                            <a href="">Collection</a>
                                            <a href="">Company</a>
                                            <a href="">Contact us</a>
                                        </div>-->
                    <div class="ultilities">
                        <a href="cartPage.jsp">
                            <i class="bx bx-cart"></i>
                        </a>
                        <span>
                            <i id="opensetting" class="bx bx-cog"></i>
                        </span>
                    </div>
                </nav>
            </header>
            <div class="main-detailpage">

                <div class="main-site">
                    <div class="product-img">
                        <img src="${productDetail.productImg}" alt="">
                    </div>
                    <div class="product-content">
                        <small>Product</small>
                        <strong>${productDetail.productName}</strong>
                        <div class="rating">
                            <div>
                                <i class='bx bxs-star'></i>
                                <p>4.5/5.0</p>
                            </div>
                            <p>(40 Reviews)</p>
                        </div>
                        <div class="price">
                            <strong>${productDetail.prices}$</strong>

                        </div>
                        <div class="size">
                            <small>Select Size</small>
                            <div class="size-list">
                                <div class="size-item">
                                    <input type="radio" name="size" value="sm" id="sm">
                                    <label for="sm">S</label>
                                </div>
                                <div class="size-item">
                                    <input type="radio" name="size" value="md" id="md">
                                    <label for="md">M</label>
                                </div>
                                <div class="size-item">
                                    <input type="radio" name="size" value="lg" id="lg">
                                    <label for="lg">L</label>
                                </div>
                                <div class="size-item">
                                    <input type="radio" name="size" value="xl" id="xl">
                                    <label for="xl">XL</label>
                                </div>
                                <div class="size-item">
                                    <input type="radio" name="size" value="xxl" id="xxl">
                                    <label for="xxl">XXL</label>
                                </div>
                            </div>
                        </div>
                        <div class="others">
                            <div class="other-item">
                                <i class='bx bx-check'></i>
                                <small>IN STOCK</small>
                            </div>
                            <div class="other-item">
                                <i class='bx bxs-truck'></i>
                                <small>FREE SHIPPING</small>
                            </div>
                        </div>
                        <div class="buttons">
                            
                            <button onclick="addToCart(this)" value="${productDetail.productID}">ADD TO BAG</button>
                        </div>

                    </div>
                </div>
                <div class="description-site">
                    <strong class="des-header">PRODUCT DESCRIPTION</strong>
                    <div class="description-content">
                        <div class="accordion-container">
                            <div class="accordion accordion-close">
                                <span>Description</span>
                                <i class='bx bx-plus'></i>
                            </div>
                            <div class="accords-content accords-close">
                                <span class="accord-title acc-close">${productDetail.productDes}</span>
                            </div>
                            <div class="accordion accordion-close">
                                <span>SIZE CHART</span>
                                <i class='bx bx-plus'></i>
                            </div>
                            <div class="accords-content accords-close">
                                <img src="assets/sizechart.webp" class="accord-title acc-close"></img>
                            </div>

                        </div>

                    </div>
                </div>
                <div class="feedback-site">
                    <strong class="feedback-header">CUSTOMER REVIEWS</strong>
                    <div class="feedback-container">
                        <div class="feedback-rating">
                            <div class="rating-total">
                                <strong>4.5/5.0</strong>
                                <div class="stars">
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star-half'></i>
                                </div>
                            </div>
                            <small>The product has been reviewed by 40 customers</small>
                            <!--                            <div class="list-stars">
                                                            <div class="star-item">
                                                                <div>
                                                                    <i class='bx bxs-star'></i>
                                                                    <i class='bx bxs-star'></i>
                                                                    <i class='bx bxs-star'></i>
                                                                    <i class='bx bxs-star'></i>
                                                                    <i class='bx bxs-star'></i>
                                                                </div>
                                                                <span>85%</span>
                                                            </div>
                                                            <div class="star-item">
                                                                <div>
                                                                    <i class='bx bxs-star'></i>
                                                                    <i class='bx bxs-star'></i>
                                                                    <i class='bx bxs-star'></i>
                                                                    <i class='bx bxs-star'></i>
                                                                    <i class='bx bx-star'></i>
                                                                </div>
                                                                <span>5%</span>
                                                            </div>
                                                            <div class="star-item">
                                                                <div>
                                                                    <i class='bx bxs-star'></i>
                                                                    <i class='bx bxs-star'></i>
                                                                    <i class='bx bxs-star'></i>
                                                                    <i class='bx bx-star'></i>
                                                                    <i class='bx bx-star'></i>
                                                                </div>
                                                                <span>3%</span>
                                                            </div>
                                                            <div class="star-item">
                                                                <div>
                                                                    <i class='bx bxs-star'></i>
                                                                    <i class='bx bxs-star'></i>
                                                                    <i class='bx bx-star'></i>
                                                                    <i class='bx bx-star'></i>
                                                                    <i class='bx bx-star'></i>
                                                                </div>
                                                                <span>6%</span>
                                                            </div>
                                                            <div class="star-item">
                                                                <div>
                                                                    <i class='bx bxs-star'></i>
                                                                    <i class='bx bx-star'></i>
                                                                    <i class='bx bx-star'></i>
                                                                    <i class='bx bx-star'></i>
                                                                    <i class='bx bx-star'></i>
                                                                </div>
                                                                <span>1%</span>
                                                            </div>
                                                        </div>-->
                        </div>
                        <div class="feedback-comment">
                            <form autocomplete="off" spellcheck="false" class="comment-form" action="getFeedback" method="post">
                                <input type="text" placeholder="Comment here..." name="comment" required>
                                <input type="hidden" value="${productDetail.productID}" name="pid">
                                <select id="" name="rating">
                                    <option value="">Rating</option>
                                    <option value="5">
                                        5 stars
                                    </option>
                                    <option value="4">
                                        4 stars
                                    </option>
                                    <option value="3">
                                        3 stars
                                    </option>
                                    <option value="2">
                                        2 stars
                                    </option>
                                    <option value="1">
                                        1 stars
                                    </option>
                                </select>
                                <button>
                                    <i class='bx bxs-send'></i>
                                </button>
                            </form>

                            <div class="comment-container">
                                <c:forEach items="${list}" var="o">
                                    <div class="comment-item">
                                        <div class="comment-header">
                                            <strong>${o.displayName}</strong>
                                            <div class="stars">
                                                <!--                                            <i class='bx bxs-star'></i>
                                                                                            <i class='bx bxs-star'></i>
                                                                                            <i class='bx bxs-star'></i>
                                                                                            <i class='bx bxs-star'></i>
                                                                                            <i class='bx bxs-star'></i>-->
                                            </div>
                                        </div>
                                        <p>${o.comment}</p>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="footer.jsp" %>
        </div>
        <%@include file="js.jsp" %>
        <script src="js/toggleAccordion.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
                                function addToCart(s) {
                                    var param = s.value;
                                    $.ajax({
                                        url: "/SoccerMate/addProductToCart", // replace with your server URL
                                        type: "get", //send it through get method
                                        data: {
                                            pid: param
                                        },
                                        success: function (data) {
                                            // process the response data here
                                            console.log(param);
                                            window.alert("product added to your shopping cart");
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