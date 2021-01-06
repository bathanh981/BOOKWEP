<%-- 
    Document   : listBook
    Created on : Apr 2, 2019, 6:32:12 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                margin: auto 100px;
                align-content: center;
            }
            table, th, td {
                border:1px solid black;
                text-align: center;
            }
            th{font-style: italic;}
            table{
                margin-top: 10px;
                width: 100%;

            }
        </style>
    </head>

    <body>
        <script>

            // [1] Load lên các thành phần cần thiết
            window.fbAsyncInit = function () {
                FB.init({
                    appId: '310302665968750',
                    cookie: true,
                    xfbml: true,
                    version: 'v2.5'
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
                window.location = 'http://graph.facebook.com/oauth/authorize?client_id=310302665968750&scope=public_profile,email,user_likes&redirect_uri=http://14.167.78.232:8084/BookMCV-JPA3/listBook';

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
       
        <!-- NÚT ĐĂNG NHẬP -->
        <input id="btb" type="button" value="ĐĂNG NHẬP" onclick="RequestLoginFB()" style="display:none" />
        <p id="lbl" style="display:none">BẠN ĐÃ ĐĂNG NHẬP THÀNH CÔNG!</p>
        <br />

        <div id="fb-root"></div>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v4.0&appId=2432248037045048&autoLogAppEvents=1"></script>
        <h2><input type="button" value="Add new" onclick="window.location = 'newBook'"/></h2>

        <form action="search" method="GET">
            <input type="search" name="value" placeholder="Search Name"/>
            <input type="submit" value="Search"/>
            <input type="button" value="Book List" onclick="window.location = 'listBook'"/>
        </form>

        <table>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Author</th>
                <th>ISBN</th>
                <th>Price</th>
                <th>Publishes Date</th>
                <th>Number Of Page</th>
                <th>Category</th>
                <th>DElETE</th>
                <th>EDIT</th>
            </tr>

            <c:forEach var="book" items="${listBook}">
                <tr>
                    <td>${book.id}</td>
                    <td>${book.name}</td>
                    <td>${book.author}</td>
                    <td>${book.bookDestails.isbn}</td>
                    <td>${book.bookDestails.price}</td>
                    <td>${book.bookDestails.puslishedDate}</td>
                    <td>${book.bookDestails.numberOfPage}</td>
                    <td>${book.category.name}</td>
                    <td><a href="delete?id=${book.id}"><input type="button" value="Delete"/></a></td>
                    <td><a href="edit?id=${book.id}"><input type="button" value="Edit"/></a></td>
                </tr>
            </c:forEach>
        </table>

        <div class="fb-like" data-href="http://14.167.78.232:8084/BookMCV-JPA3/listBook" data-width="80" data-layout="standard" data-action="like" data-size="large" data-show-faces="true" data-share="true"></div>
        <div class="fb-save" data-uri="http://14.167.78.232:8084/BookMCV-JPA3/listBook" data-size="large"></div>

        <div class="fb-group" data-href="https://www.facebook.com/groups/1081507065277376/" data-width="280" data-show-social-context="true" data-show-metadata="true"></div>

        <div class="fb-comments" data-href="http://14.167.78.232:8084/BookMCV-JPA3/listBook" data-width="100" data-numposts="5"></div>


    </body></html>
