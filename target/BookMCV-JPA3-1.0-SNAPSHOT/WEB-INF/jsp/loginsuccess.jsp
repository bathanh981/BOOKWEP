<%-- 
    Document   : loginsuccess
    Created on : Oct 4, 2019, 12:39:59 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <form id="form1" action="token" method="post">            
            <input type="text" value="thanh" name="token" id="a"/>
        </form>
        <script>
            var a = location.href;
            var end = a.indexOf('&');
            var start = a.indexOf('=');
            var token = a.substring(start + 1, end);

          document.getElementById('a').innerHTML=token;   
          document.getElementById('form1').submit();
        </script>
</body>
</html>
