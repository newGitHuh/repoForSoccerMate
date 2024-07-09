<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>SOCCERMATE</title>
        <link rel="stylesheet" href="css/global/base.css" type="text/css">
        <link rel="stylesheet" href="css/productspage/productpage.css" type="text/css">

        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Fira+Code:wght@300..700&display=swap" rel="stylesheet" />
     
        
    </head>

    <body>
        
        <div class="product-page-container">
            <%@include file="stuff.jsp" %>
            <header class="navbar-container">
                <nav class="navbar">
                    <a href="productPage">SOCCERMATE</a>
                    <form class="search-form" action="searchProduct">
                        <input type="text" placeholder="Search..." name="pid"/>
                        <button type="submit">
                            <i class="bx bx-search-alt"></i>
                        </button>
                    </form>

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
            <section class="hero-section">
                <img src="assets/hero2.jpg" alt="" />
                <div class="hero-content">
                    <h2>Passion first and everything will fall into place.</h2>
                </div>
            </section>
            <div class="inner-product-page">
                <div class="category">
                    <strong>Category</strong>
                    <div class="category-items">
                        <c:forEach items="${listCate}" var="a">
                            <a href="category?cid=${a.productCategory}" class="cate-item">${a.productCategory}</a>

                        </c:forEach>
                        <a href="#" class="empty">coming soon...</a>
                        <a href="#" class="empty">coming soon...</a>
                        <a href="#" class="empty">coming soon...</a>
                        <a href="#" class="empty">coming soon...</a>
                        <a href="#" class="empty">coming soon...</a>
                        <a href="#" class="empty">coming soon...</a>
                    </div>
                </div>
                <h2 class="product-header">SOCCERMATE PRODUCTS</h2>
                <div class="filter">
                    <div class="filter-items">
                        <form name="filter" action="sortProduct" method="get">
                            <select name="filter" onchange="submitForm()">
                                <option value="">FILTER BY</option>
                                <option  value="id">FILTER BY ID</option>
                                <option value="name">FILTER BY NAME</option>
                                <option value="price">FILTER BY PRICE</option>                                
                                <input name="productList" type="hidden" value="${productList}">
                            </select>
                        </form>
                    </div>
                    `
                    <span class="result">Result (${currentProduct})</span>
                </div>
                <div class="product-list">
                    <c:forEach items="${productList}" var="o">
                        <a href="detailProduct?pid=${o.productID}" class="item">
                            <img src="${o.productImg}" alt="" />
                            <strong>${o.productName}</strong>
                            <span>${o.prices}$</span>
                        </a>
                    </c:forEach>
                </div>
            </div>
            <div class="pagination">
                    <c:forEach begin="1" end="${endOfPage}" var="i">
                        <a href="productPage?page=${i}" class="${i == currentPage ? "pageActive" : ""}">${i}</a>
                    </c:forEach>
                </div>
            <%@include file="footer.jsp" %>
        </div>
        <%@include file="js.jsp" %>
        <script>

            function submitForm() {

                // You can also use document.abc.submit() instead of document.forms['abc'].submit()

                document.forms["filter"].submit();
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </body>

</html>