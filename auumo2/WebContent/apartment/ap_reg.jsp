<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../parts/header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/input.css">
<link rel="stylesheet" type="text/css" href="../css/Ap_reg.css">
<link rel="stylesheet" type="text/css" href="../css/tools.css">
<title>物件情報新規登録</title>
</head>
<body>

<form action="ApartmentRegister.action" method="post" onsubmit="return validate() "enctype="multipart/form-data">

<div class= wrapper>
		<h1>物件情報新規登録</h1>

		<p>
			<span class=announce>各項目に入力の上、確認をクリックしてください。<br>
			<span class= announce_necessary>必須</span>の項目はお手数ですが必ずご入力ください。</span>
		</p>
		<!-- 上のほう -->

		<h3>
		<c:if test="${!empty ap_reg_error_message}">
			${ap_reg_error_message }
		</c:if>
		</h3>
<br>
		<div class= inputs>
			<label class=label>物件名<span class=necessary>必須</span>
			<span class= note>※全角で1文字以上50文字以内</span></label><br>
			<input class=input_form type="text" name="apartment_name" value="${apbean.apartment_name}"
			placeholder="例）サンプルマンション" required><span class="error">※入力がありません</span><br>
		</div>

		<div class= inputs>
			<label class=label>住所<span class=necessary>必須</span></label><br>
			都道府県<br>
			<select class= input_form4 name= apartment_address1 size="1">
					<option value="北海道">北海道</option>
					<option value="青森県">青森県</option>
					<option value="岩手県">岩手県</option>
					<option value="宮城県">宮城県</option>
					<option value="秋田県">秋田県</option>
					<option value="山形県">山形県</option>
					<option value="福島県">福島県</option>
					<option value="茨城県">茨城県</option>
					<option value="栃木県">栃木県</option>
					<option value="群馬県">群馬県</option>
					<option value="埼玉県">埼玉県</option>
					<option value="千葉県">千葉県</option>
					<option value="東京都">東京都</option>
					<option value="神奈川県">神奈川県</option>
					<option value="新潟県">新潟県</option>
					<option value="富山県">富山県</option>
					<option value="石川県">石川県</option>
					<option value="福井県">福井県</option>
					<option value="山梨県">山梨県</option>
					<option value="長野県">長野県</option>
					<option value="岐阜県">岐阜県</option>
					<option value="静岡県">静岡県</option>
					<option value="愛知県">愛知県</option>
					<option value="三重県">三重県</option>
					<option value="滋賀県">滋賀県</option>
					<option value="京都府">京都府</option>
					<option value="大阪府">大阪府</option>
					<option value="兵庫県">兵庫県</option>
					<option value="奈良県">奈良県</option>
					<option value="和歌山県">和歌山県</option>
					<option value="鳥取県">鳥取県</option>
					<option value="島根県">島根県</option>
					<option value="岡山県">岡山県</option>
					<option value="広島県">広島県</option>
					<option value="山口県">山口県</option>
					<option value="徳島県">徳島県</option>
					<option value="香川県">香川県</option>
					<option value="愛媛県">愛媛県</option>
					<option value="高知県">高知県</option>
					<option value="福岡県">福岡県</option>
					<option value="佐賀県">佐賀県</option>
					<option value="長崎県">長崎県</option>
					<option value="熊本県">熊本県</option>
					<option value="大分県">大分県</option>
					<option value="宮崎県">宮崎県</option>
					<option value="鹿児島県">鹿児島県</option>
					<option value="沖縄県">沖縄県</option>
				</select> <br>
			市区町村<span class=necessary>必須</span>
			<span class= note>※全角で1文字以上50文字以内</span><br>
			<input class=input_form type="text" name="apartment_address2"
				value="${apbean.apartment_address2}" required><span class="error">※入力がありません</span><br>
			</div>

		<div class=inputs>
			<label class=label>賃料<span class=necessary>必須</span>
			<span class= note>※半角で10文字以内</span></label><br>
			<input class=input_form3 type="number" min="0" name="rent" placeholder="例）50000"
			value="${apbean.rent}" pattern="^[0-9]" required> 円<span class="error">※入力がありません</span><br>
		</div>

		<div class=inputs>
			<label class=label>敷金・礼金<span class=necessary>必須</span>
			<span class= note>※半角で10文字以内</span></label><br>
			<input class=input_form3 type="number" min="0" name="depsit_reward" placeholder="例）45000"
			value="${apbean.depsit_reward}" pattern="^[0-9]" required> 円<span class="error">※入力がありません</span><br>
		</div>

		<div class=inputs>
			<label class=label>管理先電話番号<span class=necessary>必須</span>
			<span class= note>※半角で20文字以内</span></label><br>
			<input class=input_form3 type="number" name="contact_telnumber"  value="${apbean.contact_telnumber}"
				placeholder="例）0335814321" required><span class="error">※入力がありません</span><br>
		</div>
		<div class=inputs>
			<label class=label>ペットの可否<span class=necessary>必須</span></label><br>
			<div class=radio>
				<input class= radio type="radio" name="pet_friendly" value="1" required> 可能<br>
				<input class= radio  type="radio" name="pet_friendly" value="0" checked required> 不可<br>
			</div>
		</div>

		<div class=inputs>
			<label class=label>物件画像<span class=necessary>必須</span>
			<span class= note>※16MB以内の画像</span></label><br>
			<input class= file name="apartment_image" type="file" required><br>
		</div>

		<div class=inputs>
			<label class=label>間取り<span class=necessary>必須</span></label><br>
				<select class=input_form4 name="floor_plan">
				<option value="1">ワンルーム</option>
				<option value="2">1K</option>
				<option value="3">1DK</option>
				<option value="4">1LDK</option>
				<option value="5">2K</option>
				<option value="6">2DK</option>
				<option value="7">2LDK</option>
				<option value="8">3DK</option>
				<option value="9">3LDK</option>
				<option value="10">4DK</option>
				<option value="11">4LDK</option>
			</select><br>
		</div>
		<div class=inputs>
			<label class=label>間取り画像<span class=necessary>必須</span>
			<span class= note>※16MB以内の画像</span></label><br>
		<input class=file name="floor_plan_image" type="file" required><br>
		</div>

		<div class= inputs>
			<label class=label>物件説明<span class=necessary>必須</span>
			<span class= note>※全角1000文字以内</span></label><br>
			<textarea class=input_form2 cols="20" rows="5"
				name="apartment_explanation" placeholder="例）最寄駅は新京成電鉄　鎌ヶ谷大仏駅　徒歩10分圏内となります。" required></textarea>
			<span class="error">※入力がありません</span><br>
		</div>
		<div class=inputs>
			<input class=submit type="submit" value="確認" id= send><br>
		</div>
		</div>
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
	<!-- formタグ -->
</body>
</html>
<%@include file="../parts/footer.jsp" %>


