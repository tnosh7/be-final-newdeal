document.addEventListener("DOMContentLoaded", function() {
    const accommodationId = document.getElementById('accommodationId').value;

    const heartIcon = document.getElementById('heartIcon');
    heartIcon.addEventListener('click', function() {
        if (heartIcon.classList.contains('unliked')) {
            heartIcon.classList.remove('unliked');
            heartIcon.classList.add('liked');
            heartIcon.innerText = '♥';
        } else {
            heartIcon.classList.remove('liked');
            heartIcon.classList.add('unliked');
            heartIcon.innerText = '♡';
        }
    });
});