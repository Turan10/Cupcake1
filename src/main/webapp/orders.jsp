<%@ page import="java.sql.*" %>
<%@ page import="dat.backend.model.persistence.ConnectionPool" %>
<%@ page import="dat.backend.model.config.ApplicationStart" %>
<HTML>
<HEAD>
    <TITLE>VIEW ALL ORDERS</TITLE>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
</HEAD>
<body class="bg-light" bgcolor="#ffc0cb">
<center><H1>VIEW ALL ORDERS </H1></center>
<%
    // Get the connection pool object from ApplicationStart
    ConnectionPool connectionPool = ApplicationStart.getConnectionPool();
    Connection connection = connectionPool.getConnection();
    Statement statement = connection.createStatement();
    ResultSet resultset = statement.executeQuery("SELECT * FROM Cupcake.Order");


%>
<table class="table table-striped" width="80%">
    <thead>
    <tr>
        <th>Created</th>
        <th>OrderID</th>
        <th>CustomerID</th>
        <th>CupcakeID</th>
        <th>Total price</th>
        <th>Remove button</th>
    </tr>
    </thead>
    <tbody>
    <% while(resultset.next()){ %>
    <tr>
        <td><%=resultset.getTimestamp("created") %></td>
        <td><%=resultset.getInt("orderID") %></td>
        <td><%=resultset.getInt("customerID") %></td>
        <td><%=resultset.getInt("cupcakeId") %></td>
        <td><%=resultset.getInt("totalPrice") %></td>
        <td>
            <form method="post" action="remove_order">
                <input type="hidden" name="orderID" value="<%=resultset.getInt("orderID") %>">
                <button type="submit" class="btn btn-danger">Remove</button>
            </form>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
</HTML>