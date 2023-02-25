<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../parts/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/input.css">
<link rel="stylesheet" type="text/css" href="../css/tools.css">
<title>利用者アカウント登録</title>
</head>
<script type="text/javascript" src="java.js"></script>
<body>

<div class= wrapper>
	<form action="AccountRegister.action" method="post" name="UserMst">
		<!-- onsubmit="return validate()" -->

		<h1>利用者アカウント登録</h1>

		<p>
			<span class=announce>各項目に入力の上、確認をクリックしてください。<br>
			<span class= announce_necessary>必須</span>の項目はお手数ですが必ずご入力ください。</span>
		</p>
		<!-- 上のほう -->

		<h3>
		<c:if test="${!empty ippan_reg_error_message}">
		${ippan_reg_error_message}
		</c:if>
		</h3>

<div class=inputs>
			<label class=label>ニックネーム<span class=necessary>必須</span>
			<span class= note>※1文字以上10文字以内</span></label><br>
			<input class=input_form type="text" name="nick_name" min="1" maxlength="10"  value="${reg_usermstbean.nick_name}"
	placeholder="例）スーモ" required><span class="error">※入力がありません</span><br>
</div>

<div class=inputs>
			<label class=label>ログインID<span class=necessary>必須</span>
			<span class=note>※半角英数字5文字以上10文字以内</span></label><br>
			<input class=input_form type="text" name="login_id" pattern="^[a-zA-Z0-9]+$" min="5" maxlength="10"  value="${reg_usermstbean.login_id}" placeholder="例）suumo0831" required><span class="error">※入力がありません</span><br>
</div>

<div class=inputs>
			<label class=label>パスワード<span class=necessary>必須</span>
			<span class= note>※半角英数字5文字以上10文字以内</span></label><br>
				<input type="password" name= password id="textPassword"
				 pattern="^[a-zA-Z0-9]+$" min="5" maxlength="10"
				 class=input_form value="${reg_usermstbean.password}" placeholder="例）123456AabC" required>
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

<div class=inputs>
			<label class=label>メールアドレス<br></label><br>
			<input class=input_form type="email" name="email_address" value="${reg_usermstbean.email_address}"
				placeholder="例）auumo@ateam.com"><br>
</div>

			<input type="hidden" name="role_id" value="2"><br>

<div class=inputs>
			<input class=submit type="submit" value="確認" id= send><br>
</div>

</form>

</div>

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

</body>
</html>
<%@include file="../parts/footer.jsp" %>