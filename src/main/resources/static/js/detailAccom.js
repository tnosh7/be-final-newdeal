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

function submitReservation() {
    const accommodationId = document.getElementById('accommodationId').value;
    const checkInDate = document.getElementById('checkInDate').value;
    const checkOutDate = document.getElementById('checkOutDate').value;
    const guests = document.getElementById('guests').value;
    const contextPath = document.getElementById('contextPath').value;

    const reserveDto = {
        accommodationId: accommodationId,
        checkInDate: checkInDate,
        checkOutDate: checkOutDate,
        guests: guests
    };

    fetch(`${contextPath}/reserve`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(reserveDto)
    })
        .then(response => response.text())
        .then(data => {
            console.log(data);
            window.location.href = `${contextPath}/reserveComplete`;
        })
        .catch(error => console.error('Error:', error));
}
