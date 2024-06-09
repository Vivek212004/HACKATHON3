document.querySelectorAll('.image-container img').forEach(image => {
    image.onclick = () => {
        document.querySelector('.pop-image').style.display = 'block';
        document.querySelector('.pop-image img').src = image.getAttribute('src');
    }
});

document.querySelector('.pop-image span').onclick = () => {
    document.querySelector('.pop-image').style.display = 'none';
}

document.getElementById('changePasswordBtn').addEventListener('click', () => {
    const changePasswordForm = document.getElementById('changePasswordForm');
    if (changePasswordForm.style.display === 'none') {
        changePasswordForm.style.display = 'block';
    } else {
        changePasswordForm.style.display = 'none';
    }
});
