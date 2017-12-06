<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Academia UCAV</title>
</head>
<body>

<h1>Se ha produccido el siguiente error:</h1>

<%@ page isErrorPage = "true"%>
<% if (exception != null) {
exception.printStackTrace(new java.io.PrintWriter(out));
} %>


</body>
</html>