const plusButtons = document.querySelectorAll(".plus");
const minusButtons = document.querySelectorAll(".minus");

plusButtons.forEach((button) => {
    button.addEventListener('click', () => {
        const input = button.previousElementSibling; 
        let quantity = parseInt(input.value);
        quantity++;
        input.value = quantity;
        updateTotalPrice(button, quantity);
        updateSummary();
    });
});

minusButtons.forEach((button) => {
    button.addEventListener('click', () => {
        const input = button.nextElementSibling;
        let quantity = parseInt(input.value);
        if (quantity > 1) {
            quantity--;
            input.value = quantity;
            updateTotalPrice(button, quantity);
            updateSummary();
        }
    });
});

function updateTotalPrice(button, quantity) {
    // selector nao gan button se update price
    const cartItem = button.closest('.cart-item');
    // xoa ky tu $ de convert thanh dang float
    const pricePerProduct = parseFloat(cartItem.querySelector('.price-per-product').textContent.replace('$', ''));
    const totalPriceElement = cartItem.querySelector('.cart-total-price');
    const totalPrice = pricePerProduct * quantity;
    totalPriceElement.textContent = `$${totalPrice.toFixed(2)}`;
}

function updateSummary() {
    const cartItems = document.querySelectorAll('.cart-item');
    let subtotal = 0;

    cartItems.forEach(item => {
        const totalPriceElement = item.querySelector('.cart-total-price');
    // xoa ky tu $ de convert thanh dang float
        const totalPrice = parseFloat(totalPriceElement.textContent.replace('$', ''));
        subtotal += totalPrice;
    });

    
    const total = subtotal;

    document.querySelector('.summary-item:nth-child(2) span').textContent = `$${subtotal.toFixed(2)}`;
    document.querySelector('.summary-item:nth-child(3) span').textContent = ``;
    document.querySelector('.summary-item:nth-child(4) span').textContent = `$${total.toFixed(2)}`;
}
updateSummary();
