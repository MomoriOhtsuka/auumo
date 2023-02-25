<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../parts/header.jsp" %><!-- ヘッダー呼び -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/check.css">
</head>
<body>
<div class= center>

<h1>登録情報の確認</h1>
<p>
入力情報に誤りがないか、ご確認のうえ確定ボタンを押してください。<br>
</p>

<p><span class=label>ニックネーム：</span>${kanri_reg_usermstbean.nick_name}</p>
<p><span class=label>ログインID：</span>${kanri_reg_usermstbean.login_id}</p>
<p><span class=label>パスワード：</span>${kanri_reg_usermstbean.password}</p>
<p><span class=label>メールアドレス：</span>${kanri_reg_usermstbean.email_address}</p>

</div>

<div class= between2>
	<form >
		<button class= submit2 type="button" onclick="history.back()" >戻る</button>
	</form>

	<form action="AccountKanriInsert.action" method="post" >
		<button  class= submit2 type="submit" >登録</button>
	</form>
</div>

</body>
</html>
<%@include file="../parts/footer.jsp" %>