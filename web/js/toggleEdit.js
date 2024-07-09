const editModals = document.querySelectorAll(".edit-modal-cover");
const closeedit = document.querySelectorAll(".close-edit");
const openedit = document.querySelectorAll(".bx-edit-alt");

openedit.forEach((button) => {
  button.addEventListener('click', () => {
    const index = button.dataset.index;
    editModals[index].classList.add("show");
    editModals[index].classList.remove("hide");
  });
});

closeedit.forEach((button, index) => {
  button.addEventListener('click', () => {
    editModals[index].classList.remove("show");
    editModals[index].classList.add("hide");
  });
});