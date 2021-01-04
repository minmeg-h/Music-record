// when cliclk hamburger menu
document.querySelector('.navbar-toggler').onclick = function() {
    // ボタンを押すたびにcssのshowが付いてメニューが開く、閉じたら外れる
    if(document.getElementById('navbar').classList.contains('show')) {
        document.querySelector('#navbar').classList.remove('show');
    } else {
      document.querySelector('#navbar').classList.add('show');
    }
}
