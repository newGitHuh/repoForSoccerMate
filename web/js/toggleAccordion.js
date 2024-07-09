const accordions = document.querySelectorAll(".accordion");
const contents = document.querySelectorAll(".accords-content");

accordions.forEach((accordion, index) => {
    accordion.addEventListener('click', () => {
        accordion.classList.toggle('accordion-close');
        const content = contents[index];
        content.classList.toggle('accords-close');
        const accordTitle = content.querySelector('.accord-title');
        if (content.classList.contains('accords-close')) {
            accordTitle.classList.add('acc-close');
        } else {
            accordTitle.classList.remove('acc-close');
        }
    });
});
