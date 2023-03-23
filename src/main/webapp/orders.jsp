<%@ page import="java.sql.*" %>
<%@ page import="dat.backend.model.persistence.ConnectionPool" %>
<HTML>
<HEAD>
    <TITLE>VIEW ALL ORDERS</TITLE>
</HEAD>
<BODY BGCOLOR="#ffc0cb">
<H1>VIEW ALL ORDERS </H1>
<%
    ConnectionPool connectionPool = new ConnectionPool("root","martin123","jdbc:mysql://localhost:3306/Cupcake");
    Statement statement = connectionPool.getConnection().createStatement(); ;
    ResultSet resultset = statement.executeQuery("select * from Cupcake.Order");
%>
<TABLE BORDER="1">
    <TR>
        <TH>Created</TH>
        <TH>OrderID</TH>
        <TH>CustomerID</TH>
        <TH>CupcakeID</TH>
        <TH>Total price</TH>
    </TR>
    <% while(resultset.next()){ %>
    <TR>
        <td><%=resultset.getTimestamp("created") %></td>
        <td><%=resultset.getInt("orderID") %></td>
        <td><%=resultset.getInt("customerID") %></td>
        <td><%=resultset.getInt("cupcakeId") %></td>
        <td><%=resultset.getInt("totalPrice") %></td>
    </TR>
    <% } %>
</TABLE>
</BODY>
</HTML>