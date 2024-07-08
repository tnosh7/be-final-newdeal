document.addEventListener("DOMContentLoaded", function() {
    const accommodationId = document.getElementById('accommodationId').value;
    const contextPath = document.getElementById('contextPath').value;

    fetch(`${contextPath}/api/accommodations/${accommodationId}`)
        .then(response => response.json())
        .then(data => {
            document.getElementById('accommodation-name').innerText = data.name;
        });

    const heartIcon = document.getElementById('heartIcon');
    heartIcon.addEventListener('click', function() {
        if (heartIcon.classList.contains('unliked-mjp')) {
            heartIcon.classList.remove('unliked-mjp');
            heartIcon.classList.add('liked-mjp');
            heartIcon.innerText = '♥';

        } else {
            heartIcon.classList.remove('liked-mjp');
            heartIcon.classList.add('unliked-mjp');
            heartIcon.innerText = '♡';

        }
    });
});
