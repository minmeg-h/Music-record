// when cliclk hamburger menu
document.querySelector('.navbar-toggler').onclick = function() {
    // if menu is opening, close menu
    if(document.getElementById('navbar').classList.contains('show')) {
        document.querySelector('#navbar').classList.remove('show');
    } else {
      document.querySelector('#navbar').classList.add('show');
    }
}
