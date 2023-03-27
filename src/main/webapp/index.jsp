<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
         Velkommen til Olster!
    </jsp:attribute>

    <jsp:attribute name="footer">
        Velkommen til Olster!
    </jsp:attribute>

    <jsp:body>

        <c:if test="${sessionScope.user != null}">
            <p>You are logged in with the role of "${sessionScope.user.role}".</p>
        </c:if>

        <c:if test="${sessionScope.user == null}">
            <p>Du er ikke logget på endnu: <br/>
                <a href="login.jsp">Login</a></p>
        </c:if>
        <br>
        <p>Lav en bruger her:</p>
        <a href="signup.jsp">Opret ny bruger</a>

    </jsp:body>

</t:pagetemplate>