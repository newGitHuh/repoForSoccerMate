const addModal = document.getElementById("addmodal");
const closebtn = document.getElementById("closeadd");
const openbtn = document.getElementById("openadd");
openbtn.addEventListener("click", () => {
    addModal.classList.add("show");
    addModal.classList.remove("hide");
});
closebtn.addEventListener("click", () => {
    addModal.classList.remove("show");
    addModal.classList.add("hide")
})