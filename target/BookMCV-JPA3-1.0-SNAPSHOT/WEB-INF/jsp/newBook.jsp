<%-- 
    Document   : newProduct
    Created on : Mar 30, 2019, 9:09:35 PM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v4.0&appId=2432248037045048&autoLogAppEvents=1"></script>
        
        <div class="fb-login-button"  data-width="80" data-size="medium" data-button-type="login_with" data-auto-logout-link="true" data-use-continue-as="true"></div>
        <h2>${msg}</h2>
        <mvc:form modelAttribute="book" method="GET" action="save">
            <label>Category</label>
            <c:if test="${submit.equals('Update')}">
                <mvc:hidden path="id"/>
                <mvc:hidden path="bookDestails.id"/>
            </c:if>
            <mvc:select path="category.id" items="${listCategory}" itemValue="id" itemLabel="name">
            </mvc:select>
            <table>
                <tr>
                    <th>Name(*): </th>
                    <td><mvc:input path="name"/></td>
                </tr>
                <tr>
                    <th>Author(*): </th>
                    <td><mvc:input path="author"/></td>
                </tr>
                <tr>
                    <th>ISBN(*): </th>
                    <td><mvc:input path="bookDestails.isbn"/></td>
                </tr>
                <tr>
                    <th>Price(*): </th>
                    <td><mvc:input path="bookDestails.price"/></td>
                </tr>
                <tr>
                    <th>Publish Date(*): </th>
                    <td><mvc:input  path="bookDestails.puslishedDate" type="date"/></td>
                </tr>
                <tr>
                    <th>Number of Page(*): </th>
                    <td><mvc:input  path="bookDestails.numberOfPage" type="number"/></td>
                </tr>
                <tr>
                    <th>
                        <input type="submit" value="${submit}"/>
                    </th>
                    <th>
                        <input type="button" value="Cancle" onclick="window.location = 'listBook'"/>
                    </th>
                </tr>
            </table>
        </mvc:form>

            
    </body>
</html>
