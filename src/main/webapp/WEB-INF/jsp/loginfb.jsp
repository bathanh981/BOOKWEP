?<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
</head>
<body>
    <script>

        // [1] Load lên các thành ph?n c?n thi?t
        window.fbAsyncInit = function () {
            FB.init({
                appId: '2432248037045048',
                cookie: true,
                xfbml: true,
                version: 'v4.0'
            });
            // Ki?m tra tr?ng thái hi?n t?i
            FB.getLoginStatus(function (response) {
                statusChangeCallback(response);
            });

        };

        // [2] X? lý tr?ng thái ??ng nh?p
        function statusChangeCallback(response) {
            // Ng??i dùng ?ã ??ng nh?p FB và ?ã ??ng nh?p vào ?ng d?ng
            if (response.status === 'connected') {
                ShowWelcome();
            }
            // Ng??i dùng ?ã ??ng nh?p FB nh?ng ch?a ??ng nh?p ?ng d?ng
            else if (response.status === 'not_authorized') {
                ShowLoginButton();
            }
            // Ng??i dùng ch?a ??ng nh?p FB
            else {
                ShowLoginButton();
            }
        }

        // [3] Yêu c?u ??ng nh?p FB
        function RequestLoginFB() {
            window.location = 'http://graph.facebook.com/v4.0/oauth/authorize?client_id=2432248037045048&scope=public_profile,email,user_likes&redirect_uri=http://localhost:8084/BookMCV-JPA3/listBook&response_type=token';
        }

        // [4] Hi?n th? nút ??ng nh?p
        function ShowLoginButton() {
            document.getElementById('btb').setAttribute('style', 'display:block');
            document.getElementById('lbl').setAttribute('style', 'display:none');
        }

        // [5] Chào m?ng ng??i dùng ?ã ??ng nh?p
        function ShowWelcome() {
            document.getElementById('btb').setAttribute('style', 'display:none');            
            FB.api('/me', function (response) {
                var name = response.name;
                var username = response.username;
                var id = response.id;
                document.getElementById('lbl').innerHTML = 'Tên=' + name + ' | username=' + username + ' | id=' + id;
                document.getElementById('lbl').setAttribute('style', 'display:block');
            });
        }

    </script>
    <div id="fb-root"></div>
    <script>
    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.7&appId=2432248037045048";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));</script>



    <!-- NÚT ??NG NH?P -->
    <input id="btb" type="button" value="??NG NH?P" onclick="RequestLoginFB()" style="display:none" />
    <p id="lbl" style="display:none">B?N ?Ã ??NG NH?P THÀNH CÔNG!</p>
    <br />

</body>
</html>