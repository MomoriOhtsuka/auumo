<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../parts/header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="bean.ApertmentMstBean" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/input.css">
<link rel="stylesheet" type="text/css" href="../css/Ap_reg.css">
<link rel="stylesheet" type="text/css" href="../css/tools.css">
<title>物件情報新規登録</title>
</head>
<body onLoad=shokichi()>

<form action="ApartmentUpdateCheck.action" method="post" onsubmit="return validate() "enctype="multipart/form-data">

<div class= wrapper>

		<h1>物件情報編集</h1>
		<p>
			<span class=announce>各項目に入力の上、確認をクリックしてください。<br>
			<span class= announce_necessary>必須</span>の項目はお手数ですが必ずご入力ください。</span>
		</p>

		<!-- 上のほう -->

		<h3>
		<c:if test="${!empty ap_update_error_message}">
			${ap_update_error_message }
		</c:if>
		</h3>
<br>
		<div class= inputs>
			<label class=label>物件名<span class=necessary>必須</span>
			<span class= note>※全角で1文字以上50文字以内</span></label><br>
			<input class=input_form type="text" name="apartment_name" value="${apupdate.apartment_name}"
			placeholder="例）サンプルマンション" required><span class="error">※入力がありません</span><br>
		</div>

		apupdate

		<div class= inputs>
			<label class=label>住所<span class=necessary>必須</span></label><br>
			都道府県<br>
			<select  class=input_form4 name="apartment_address1"  size="1">
					<c:choose>
						<c:when test="${apupdate.apartment_address1=='北海道'}">
							<option value="北海道" selected>北海道</option>
						</c:when>
						<c:otherwise>
						<option value="北海道">北海道</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${apupdate.apartment_address1=='青森県'}">
							<option value="青森県" selected>青森県</option>
						</c:when>
						<c:otherwise>
						<option value="青森県">青森県</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${apupdate.apartment_address1=='岩手県'}">
							<option value="岩手県" selected>岩手県</option>
						</c:when>
						<c:otherwise>
						<option value="岩手県">岩手県</option>
						</c:otherwise>
					</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='宮城県'}">
								<option value="宮城県" selected>宮城県</option></c:when>
							<c:otherwise><option value="宮城県">宮城県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='秋田県'}">
								<option value="秋田県" selected>秋田県</option></c:when>
							<c:otherwise><option value="秋田県">秋田県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='山形県'}">
								<option value="山形県" selected>山形県</option></c:when>
							<c:otherwise><option value="山形県">山形県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='福島県'}">
								<option value="福島県" selected>福島県</option></c:when>
							<c:otherwise><option value="福島県">福島県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='茨城県'}">
								<option value="茨城県" selected>茨城県</option></c:when>
							<c:otherwise><option value="茨城県">茨城県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='栃木県'}">
								<option value="栃木県" selected>栃木県</option></c:when>
							<c:otherwise><option value="栃木県">栃木県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='群馬県'}">
								<option value="群馬県" selected>群馬県</option></c:when>
							<c:otherwise><option value="群馬県">群馬県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='埼玉県'}">
								<option value="埼玉県" selected>埼玉県</option></c:when>
							<c:otherwise><option value="埼玉県">埼玉県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='千葉県'}">
								<option value="千葉県" selected>千葉県</option></c:when>
							<c:otherwise><option value="千葉県">千葉県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='東京都'}">
								<option value="東京都" selected>東京都</option></c:when>
							<c:otherwise><option value="東京都">東京都</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='神奈川県'}">
								<option value="神奈川県" selected>神奈川県</option></c:when>
							<c:otherwise><option value="神奈川県 ">神奈川県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='新潟県'}">
								<option value="新潟県" selected>新潟県</option></c:when>
							<c:otherwise><option value="新潟県">新潟県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='富山県'}">
								<option value="富山県" selected>富山県</option></c:when>
							<c:otherwise><option value="富山県">富山県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='石川県'}">
								<option value="石川県" selected>石川県</option></c:when>
							<c:otherwise><option value="石川県">石川県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='福井県'}">
								<option value="福井県" selected>福井県</option></c:when>
							<c:otherwise><option value="福井県">福井県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='山梨県'}">
								<option value="山梨県" selected>山梨県</option></c:when>
							<c:otherwise><option value="山梨県">山梨県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='長野県'}">
								<option value="長野県" selected>長野県</option></c:when>
							<c:otherwise><option value="長野県">長野県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='岐阜県'}">
								<option value="岐阜県" selected>岐阜県</option></c:when>
							<c:otherwise><option value="岐阜県">岐阜県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='静岡県'}">
								<option value="静岡県" selected>静岡県</option></c:when>
							<c:otherwise><option value="静岡県">静岡県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='愛知県'}">
								<option value="愛知県" selected>愛知県</option></c:when>
							<c:otherwise><option value="愛知県">愛知県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='三重県'}">
								<option value="三重県" selected>三重県</option></c:when>
							<c:otherwise><option value="三重県">三重県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='滋賀県'}">
								<option value="滋賀県" selected>滋賀県</option></c:when>
							<c:otherwise><option value="滋賀県">滋賀県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='京都府'}">
								<option value="京都府" selected>京都府</option></c:when>
							<c:otherwise><option value="京都府">京都府</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='大阪府'}">
								<option value="大阪府" selected>大阪府</option></c:when>
							<c:otherwise><option value="大阪府">大阪府</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='兵庫県'}">
								<option value="兵庫県" selected>兵庫県</option></c:when>
							<c:otherwise><option value="兵庫県">兵庫県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='奈良県'}">
								<option value="奈良県" selected>奈良県</option></c:when>
							<c:otherwise><option value="奈良県">奈良県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='和歌山県'}">
								<option value="和歌山県" selected>和歌山県</option></c:when>
							<c:otherwise><option value="和歌山県">和歌山県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='鳥取県'}">
								<option value="鳥取県" selected>鳥取県</option></c:when>
							<c:otherwise><option value="鳥取県">鳥取県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='島根県'}">
								<option value="島根県" selected>島根県</option></c:when>
							<c:otherwise><option value="島根県">島根県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='岡山県'}">
								<option value="岡山県" selected>岡山県</option></c:when>
							<c:otherwise><option value="岡山県">岡山県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='広島県'}">
								<option value="広島県" selected>広島県</option></c:when>
							<c:otherwise><option value="広島県">広島県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='山口県'}">
								<option value="山口県" selected>山口県</option></c:when>
							<c:otherwise><option value="山口県">山口県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='徳島県'}">
								<option value="徳島県" selected>徳島県</option></c:when>
							<c:otherwise><option value="徳島県">徳島県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='香川県'}">
								<option value="香川県" selected>香川県</option></c:when>
							<c:otherwise><option value="香川県">香川県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='愛媛県'}">
								<option value="愛媛県" selected>愛媛県</option></c:when>
							<c:otherwise><option value="愛媛県">愛媛県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='高知県'}">
								<option value="高知県" selected>高知県</option></c:when>
							<c:otherwise><option value="高知県">高知県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='福岡県'}">
								<option value="福岡県" selected>福岡県</option></c:when>
							<c:otherwise><option value="福岡県">福岡県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='佐賀県'}">
								<option value="佐賀県" selected>佐賀県</option></c:when>
							<c:otherwise><option value="佐賀県">佐賀県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='長崎県'}">
								<option value="長崎県" selected>長崎県</option></c:when>
							<c:otherwise><option value="長崎県">長崎県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='熊本県'}">
								<option value="熊本県" selected>熊本県</option></c:when>
							<c:otherwise><option value="熊本県">熊本県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='大分県'}">
								<option value="大分県" selected>大分県</option></c:when>
							<c:otherwise><option value="大分県">大分県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='宮崎県'}">
								<option value="宮崎県" selected>宮崎県</option></c:when>
							<c:otherwise><option value="宮崎県">宮崎県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='鹿児島県'}">
								<option value="鹿児島県" selected>鹿児島県</option></c:when>
							<c:otherwise><option value="鹿児島県">鹿児島県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${apupdate.apartment_address1=='沖縄県'}">
								<option value="沖縄県" selected>沖縄県</option></c:when>
							<c:otherwise><option value="沖縄県">沖縄県</option>
							</c:otherwise>
						</c:choose>
					</select> <br>
			市区町村<span class=necessary>必須</span>
			<span class= note>※全角で1文字以上50文字以内</span><br>
			<input class=input_form type="text" name="apartment_address2"
				value="${apupdate.apartment_address2}" required><span class="error">※入力がありません</span><br>
			</div>

		<div class=inputs>
			<label class=label>賃料<span class=necessary>必須</span>
			<span class= note>※半角で10文字以内</span></label><br>
			<input class=input_form3 type="number" min="0" name="rent" placeholder="例）50000"
			value="${apupdate.rent}" pattern="^[0-9]" required> 円<span class="error">※入力がありません</span><br>
		</div>

		<div class=inputs>
			<label class=label>敷金・礼金<span class=necessary>必須</span>
			<span class= note>※半角で10文字以内</span></label><br>
			<input class=input_form3 type="number" min="0" name="depsit_reward" placeholder="例）45000"
			value="${apupdate.depsit_reward}" pattern="^[0-9]" required> 円<span class="error">※入力がありません</span><br>
		</div>

		<div class=inputs>
			<label class=label>管理先電話番号<span class=necessary>必須</span>
			<span class= note>※半角で20文字以内</span></label><br>
			<input class=input_form3 type="number" name="contact_telnumber"  value="${apupdate.contact_telnumber}"
				placeholder="例）0335814321" required><span class="error">※入力がありません</span><br>
		</div>

		<div class=inputs>
			<label class=label>ペットの可否<span class=necessary>必須</span></label><br>
			<div class=radio>
				<c:choose>
					<c:when test="${apupdate.pet_friendly=='1'}">
						<input class= radio type="radio" id="petok" name="pet_friendly" value="1" checked> 可能<br>
						<input class= radio  type="radio" id="petng" name="pet_friendly" value="0" > 不可<br>
					</c:when>
					<c:when test="${apupdate.pet_friendly=='0'}">
						<input class= radio type="radio" id="petok" name="pet_friendly" value="1" > 可能<br>
						<input class= radio  type="radio" id="petng" name="pet_friendly" value="0" checked > 不可<br>
					</c:when>
					<c:otherwise>
						<input class= radio type="radio" id="petok" name="pet_friendly" value="1"  > 可能<br>
						<input class= radio  type="radio" id="petng" name="pet_friendly" value="0" > 不可<br>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<div class=inputs>
			<label class=label>物件画像
			<span class= note>※16MB以内の画像</span></label><br>
			<input class= file name="apartment_image" type="file"><br>
			現在の物件画像はこちらです。変更する場合は、ファイルを再度選択して下さい。<br>
			<img class=ap_img src="data:image/png;base64,${apupdate.apartment_imageBase64}" alt="物件画像" width=300px height=300px><br>
			<input type="hidden" name="apartment_imageBase64_before" value="${apupdate.apartment_imageBase64}">
			<br>
		</div>
		<div class=inputs>
			<label class=label>間取り<span class=necessary>必須</span></label><br>
				<select class=input_form4 name="floor_plan">
					<c:choose>
						<c:when test="${apupdate.floor_plan==''}">
							<option value="" selected>未選択</option>
						</c:when>
						<c:otherwise>
						<option value="">未選択</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${apupdate.floor_plan=='1'}">
							<option value="1" selected>ワンルーム</option>
						</c:when>
						<c:otherwise>
						<option value="1">ワンルーム</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${apupdate.floor_plan=='2'}">
							<option value="2" selected>1K</option>
						</c:when>
						<c:otherwise>
						<option value="2">1K</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${apupdate.floor_plan=='3'}">
							<option value="3" selected>1DK</option>
						</c:when>
						<c:otherwise>
						<option value="3">1DK</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${apupdate.floor_plan=='4'}">
							<option value="4" selected>1LDK</option>
						</c:when>
						<c:otherwise>
						<option value="4">1LDK</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${apupdate.floor_plan=='5'}">
							<option value="5" selected>2K</option>
						</c:when>
						<c:otherwise>
						<option value="5">2K</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${apupdate.floor_plan=='6'}">
							<option value="6" selected>2DK</option>
						</c:when>
						<c:otherwise>
						<option value="6">2DK</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${apupdate.floor_plan=='7'}">
							<option value="7" selected>2LDK</option>
						</c:when>
						<c:otherwise>
						<option value="7">2LDK</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${apupdate.floor_plan=='8'}">
							<option value="8" selected>3DK</option>
						</c:when>
						<c:otherwise>
						<option value="8">3DK</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${apupdate.floor_plan=='9'}">
							<option value="9" selected>3LDK</option>
						</c:when>
						<c:otherwise>
						<option value="9">3LDK</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${apupdate.floor_plan=='10'}">
							<option value="10" selected>4DK</option>
						</c:when>
						<c:otherwise>
						<option value="10">4DK</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${apupdate.floor_plan=='11'}">
							<option value="11" selected>4LDK</option>
						</c:when>
						<c:otherwise>
						<option value="11">4LDK</option>
						</c:otherwise>
					</c:choose>
			</select><br>
		</div>
		<div class=inputs>
			<label class=label>間取り画像
			<span class= note>※16MB以内の画像</span></label><br>
		<input class=file name="floor_plan_image" type="file"><br>
		現在の物件画像はこちらです。変更する場合は、ファイルを再度選択して下さい。<br>
		<img class=ap_img src="data:image/png;base64,${apupdate.floor_plan_imageBase64}" alt="間取り画像" 	width=300px height=300px><br>
		<input type="hidden" name="floor_plan_imageBase64_before" value="${apupdate.floor_plan_imageBase64}">
		<br>
		</div>

		<div class= inputs>
			<label class=label>物件説明<span class=necessary>必須</span>
			<span class= note>※全角1000文字以内</span></label><br>
			<textarea class=input_form2 cols="20" rows="5"
				name="apartment_explanation" placeholder="例）最寄駅は新京成電鉄　鎌ヶ谷大仏駅　徒歩10分圏内となります。"
				required>${apupdate.apartment_explanation}</textarea>
			<span class="error">※入力がありません</span><br>
		</div>
		<div class=inputs>
			<input type="hidden" name="apartment_cord" value="${apupdate.apartment_cord}">
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


