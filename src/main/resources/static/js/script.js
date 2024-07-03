// script.js
document.addEventListener("DOMContentLoaded", function() {
    var dropdown = document.querySelector(".dropdown");
    var dropdownContent = document.querySelector(".dropdown-content");

    dropdown.addEventListener("click", function() {
        dropdown.classList.toggle("active");
    });

    // Close the dropdown if the user clicks outside of it
    document.addEventListener("click", function(event) {
        if (!dropdown.contains(event.target)) {
            dropdown.classList.remove("active");
        }
    });
});
