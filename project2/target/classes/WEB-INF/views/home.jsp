<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!
	<br>If you want to see board, please connect to <a href = "/board/list">"http://localhost:8080/board/list"</a></br>
</h1>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
