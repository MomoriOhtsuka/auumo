<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../parts/header.jsp" %><!-- ヘッダー呼び -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/input.css">
<title>sign up</title>
</head>
<body>

<div class=wrapper>

<form action="Login.action" method="post" name="UserMst">

		<h1>管理者ログイン</h1>
		<p class= announce>ログインID、パスワードを入力のうえ、ログインを押してください。</p>

<div class=inputs>
			<label class=label>ログインID</label><br>
				<input class=input_form type="text" name="login_id" value=""
				placeholder="例）suumo0831" required><span class="error">※入力がありません</span><br>
</div>

<div class=inputs>
			<label class=label>パスワード</label><br>
				<input type="password" name=password id="textPassword"
				class=input_form value="" placeholder="例）123456AabC" required>
				<span class="error">※入力がありません</span>
				<input type="button" id="buttonPassword" class=btn value="表示"
				onclick="pushHideButton();">
	<script type="text/javascript" class=input_form>
      			function pushHideButton() {
        		var txtPass = document.getElementById("textPassword");
        		var btnPass = document.getElementById("buttonPassword");
        		if (txtPass.type === "text") {
          		txtPass.type = "password";
          		btnPass.value = "表示";
       			 } else {
          		txtPass.type = "text";
          		btnPass.value = "非表示";
       		 }
     	 }
    </script>
</div>
		<input type="hidden" name="role_id" value="1"><br>
		<input class=submit type="submit" value="ログイン" id= send>

	</form>
	<style>
  input.invalid{
    background-color: #ffe1e1;
  }
  .error{
    color: #ff7676;
    font-size: .8em;
    display: none;
  }
  .error.invalid{
    display: block;
  }
</style>

<!-- jQuery読み込み -->
<script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>

<script>
jQuery(function($){
  $('#send').on("click", function() {
    $('form').find('.invalid').removeClass('invalid');// 初期化
    $('input[required]:invalid,textarea[required]:invalid').each(function(){// 項目が空だったらエラー表示をする
      $(this).addClass('invalid');
      $(this).next().addClass('invalid');
    });
    if($('.invalid').length == 0){// 未入力がない時
      $('form').submit();
      console.log('送信しました');
    }else{// 未入力がある時
      console.log('未入力があります');
    }
    return false;// submitの送信中止用
  });
});
</script>
</div>
</body>
</html>
<%@include file="../parts/footer.jsp" %><!-- フッター呼び -->