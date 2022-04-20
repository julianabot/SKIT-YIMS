const togglePassword3 = document.querySelector('#togglePassword-3');
const password3 = document.querySelector('#password-3');

togglePassword3.addEventListener('click', function (e) {
    // toggle the type attribute
    const type = password3.getAttribute('type') === 'password' ? 'text' : 'password';
    password3.setAttribute('type', type);
    // toggle the eye slash icon
    this.classList.toggle('fa-eye-slash');
});