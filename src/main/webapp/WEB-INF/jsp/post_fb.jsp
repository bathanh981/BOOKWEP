
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>﻿
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title></title>
    </head>
    <body>
        <script>

            // [1] Load lên các thành phần cần thiết
            window.fbAsyncInit = function () {
                FB.init({
                    appId: '2432248037045048',
                    cookie: true,
                    xfbml: true,
                    version: 'v4.0'
                });
                // Kiểm tra trạng thái hiện tại
                FB.getLoginStatus(function (response) {
                    statusChangeCallback(response);
                });

            };

            // [2] Xử lý trạng thái đăng nhập
            function statusChangeCallback(response) {
                // Người dùng đã đăng nhập FB và đã đăng nhập vào ứng dụng
                if (response.status === 'connected') {
                    ShowWelcome();
                }
                // Người dùng đã đăng nhập FB nhưng chưa đăng nhập ứng dụng
                else if (response.status === 'not_authorized') {
                    ShowLoginButton();
                }
                // Người dùng chưa đăng nhập FB
                else {
                    ShowLoginButton();
                }
            }

            // [3] Yêu cầu đăng nhập FB
            function RequestLoginFB() {
                window.location = 'http://graph.facebook.com/v4.0/oauth/authorize?client_id=2432248037045048&scope=public_profile,email,user_likes,user_birthday,user_education_history,user_work_history,user_posts,user_photos,user_location,publish_actions&redirect_uri=http://localhost:8084/BookMCV-JPA3/listBook&response_type=token';
            }

            // [4] Hiển thị nút đăng nhập
            function ShowLoginButton() {
                document.getElementById('btb').setAttribute('style', 'display:block');
                document.getElementById('lbl').setAttribute('style', 'display:none');
            }

            // [5] Chào mừng người dùng đã đăng nhập
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
            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.7&appId=310302665968750";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>

 <!-- NÚT ??NG NH?P -->
    <input id="btb" type="button" value="??NG NH?P" onclick="RequestLoginFB()" style="display:none" />
    <p id="lbl" style="display:none">B?N ?Ã ??NG NH?P THÀNH CÔNG!</p>
    <br />
        <p>POST THỬ</p>

        <form action="https://graph.facebook.com/me/feed" method="post" enctype="multipart/form-data">
            message<br />
            <input type="text" name="message" />
            <br /><br />
            link<br />
            <input type="text" name="link" />
            <br /><br />
            picture<br />
            <input type="text" name="picture" />
            <br /><br />
            description<br />
            <input type="text" name="description" />
            <br /><br />
            caption<br />
            <input type="text" name="caption" />
            <br /><br />
            name<br />
            <input type="text" name="name" />
            <br /><br />
            access_token<br />
            <input type="text" name="access_token" />
            <input type="submit" />

        </form>

    </body>
</html>