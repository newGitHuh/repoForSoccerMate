<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Checkout</title>
        <link rel="stylesheet" href="css/global/base.css" type="text/css">
        <link rel="stylesheet" href="css/checkout/checkout.css" type="text/css">
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Fira+Code:wght@300..700&display=swap" rel="stylesheet" />
    </head>

    <body>
        <div class="checkout-container">
            <form method="post" spellcheck="false" autocomplete="off" class="checkout-form" action="completeOrder">
                <strong>Checkout</strong>
                <div class="info">
                    <strong>Your Information</strong>
                    <div class="info-input">
                        <label for="">Email</label>
                        <input type="text" placeholder="Enter your email..." value="${sessionScope.user.email.trim()}" name="email" disabled="">
                    </div>
                    <div class="info-input">
                        <label for="">Address</label>
                        <input type="text" placeholder="Enter your address..." name="address" required>
                    </div>
                    <div class="info-input">
                        <label for="">Phone Number</label>
                        <input type="text" placeholder="Enter phone number..." value="${sessionScope.user.phone}" required name="phone">
                        <input type="hidden" name="totalPrice" value="${total}">
                    </div>
                </div>
                <div class="payment-method">
                    <strong>Payment Method</strong>
                    <div class="payment">
                        <!--                    <div class="payment-input">
                                                <input type="radio" name="payment" value="bank" id="bank">
                                                <label for="bank">
                                                    <p>Bank Transfer</p>
                                                    <i class='bx bxs-bank'></i>
                                                </label>
                                            </div>-->
                        <div class="payment-input">
                            <input type="radio" name="payment" value="cash" id="cash" required>
                            
                            <label for="cash">
                                <p>Cash</p>
                                <i class='bx bx-money'></i>
                            </label>
                        </div>
                    </div>

                </div>

                <div class="buttons">
                    <a href="productPage" class="cancel">Back to cart</a>
                    <button type="submit" class="confirm">Confirm payment</button>
                </div>
            </form>
            <div class="checkout-summary">
                <strong>Order Summary</strong>
                <div class="summary">
                    <div class="summary-item">
                        <p>CART</p>
                        <span>$${total}</span>
                    </div>
                    <div class="summary-item">
                        <p>DELIVERY FEE</p>
                        <span>$0</span>
                    </div>
                </div>
                <div class="total">
                    <p>TOTAL</p>
                    <span>$${total}</span>
                    
                </div>
            </div>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const bankRadio = document.getElementById('bank');
                const cashRadio = document.getElementById('cash');
                const onlyBankSection = document.querySelector('.only-bank');

                bankRadio.addEventListener('change', function () {
                    if (bankRadio.checked) {
                        onlyBankSection.classList.remove('hidden');
                    }
                });

                cashRadio.addEventListener('change', function () {
                    if (cashRadio.checked) {
                        onlyBankSection.classList.add('hidden');
                    }
                });
            });
        </script>

    </body>

</html>