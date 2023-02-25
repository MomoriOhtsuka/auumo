<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../parts/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/tools.css">
<meta charset="UTF-8">
<title>利用者アカウント管理</title>
</head>
<body>

<div class= wrapper>

<h3>検索されたユーザは存在しません。</h3>
<h3>別のアカウントを検索するか、新しいアカウントを作成してください。</h3>
<p>検索するユーザのニックネームやログインIDを入力してください。</p>
<p>未入力の場合は、すべて表示されます。</p>

<form action="AccountKanriSearch.action" method="post">
	ログインID：<input type="text" name="login_id">
	ニックネーム：<input type="text" name="nick_name">
	<input type="submit" value="検索">
</form>

<a href="ac_kanri_reg.jsp">管理者の新規登録</a>

<hr>

<table class="design16">

<tr>
  <th>ニックネーム</th>
  <th>ログインID</th>
  <th>パスワード</th>
  <th>権限</th>
  <th>メールアドレス</th>
  <th> </th>
  </tr>

<c:forEach var="usermstlist" items="${usermstlist }">

 <tr>
  <td>${usermstlist.nick_name }</td>
  <td>${usermstlist.login_id }</td>
  <td>${usermstlist.password }</td>
  <td>
  	<c:choose>
  	<c:when test="${usermstlist.role_id==1}">管理者ユーザ</c:when>
  	<c:when test="${usermstlist.role_id==2}">一般ユーザ</c:when>
  	<c:otherwise>権限がありません</c:otherwise>
	</c:choose>
  </td>
  <td>${usermstlist.email_address }</td>
  <c:if test="${login_usermstbean.login_id!=usermstlist.login_id }">
  <td><a href="../account/AccountDelete.action?account_code=${usermstlist.account_code}&login_id=${usermstlist.login_id}" onclick="return confirm('削除しますがよろしいですか？')">削除</a></td>
  </c:if>
 </tr>

</c:forEach>
</table>

</div>
</body>
</html>
<%@include file="../parts/footer.jsp" %>