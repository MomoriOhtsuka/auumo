<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../parts/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/Message.css">
<title>アカウント削除</title>
</head>
<body>
<div class= message>
<h1>アカウント(${account_code}:${login_id})を削除しました。</h1>
</div>
</body>
</html>
<%@include file="../parts/footer.jsp" %>