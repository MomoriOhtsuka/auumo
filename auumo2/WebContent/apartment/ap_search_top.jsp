<!-- レイアウトとか色々、制作中 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="apartment.ApartmentSearchTop5" %>
<%@page import="bean.ApertmentMstBean" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/Toppage.css">
<title>物件情報検索</title>
</head>
<body background="../img/bg.jpg">
<nav class="gnav">
<ul class="gnav_wrapper">
<li><a href="#">企業情報</a></li>
<li><a href="#">採用情報</a></li>
<li><a href="#">店舗検索</a></li>
<li><a href="#">ブログ</a></li>
<li><a href="#">Instagram</a></li>
<li><a href="#">FAQ</a></li>
<li><a href="#">お問い合わせ</a></li>
</ul>
</nav>

<form action="../apartment/ApartmentSearch.action" method="post" name="ApartmentMst">

<div class= wrapper><!-- ここからメイン -->

<div class= left_img>
</div>

<section class= search><!-- ここから検索 -->

<div class=search_element>
<label>都道府県</label><br>
	<select name="apartment_address1">
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
	</select><br>
</div>
<div class=search_element>
<label for="search-pass">市区町村</label><br>
<input id="search-pass" type="text" name="apartment_address2" value="" placeholder="例）札幌市">
</div><br>

<div class=search_element>
<label>家賃</label><br>
<input type="number" name="priceL" value="" size="10" pattern="^[0-9]"><br>
～<br>

<input type="number" name="priceH" value="" size="10" pattern="^[0-9]">&nbsp;円
</div><br>

<div class= search_element>
	<label>ペットの可否</label><br>
<div class=checkbox>
			<input type="checkbox" name="pet_friendly" value="1" checked> 可能
			<input type="checkbox" name="pet_friendly" value="2" checked> 不可
</div>
</div><br>

<div class=search_element>
	<label>間取り</label><br>
<select class=input_form3 name="floor_plan">
		<option value="">未選択</option>
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
</div><br>

<button class ="submit" name="search" type="submit">検索</button>

</section><!-- ここまで検索 -->

<nav class="menu">
<div class="height">

<%
ArrayList<ApertmentMstBean> aplist=ApartmentSearchTop5.showTop5();
pageContext.setAttribute("aplist",aplist);
%>
<c:forEach  items="${pageScope.aplist}" var="aplist">

<section class= search_results><!-- ここから検索結果 -->

<h2><c:out value="${ aplist.apartment_name}" /></h2>

<div class="flex">

<img class= ap_img src="data:image/png;base64,${aplist.apartment_imageBase64}" alt="物件画像">

<table class= "koumoku">
	<tbody>
	<tr>
		<th class="item">所在地</th>
		<td class="value"><c:out value="${ aplist.apartment_address1}" /><c:out value="${ aplist.apartment_address2}" /></td>
	</tr>
	<tr>
		<th class="item">賃料</th>
		<td class="value">\ <span class= strong><c:out value="${ aplist.rent}" /></span>円</td>
	</tr>

	<tr>
		<th class="item">間取り</th>
		<td class="value">

		<c:choose>
			<c:when test="${aplist.floor_plan==1}">ワンルーム</c:when>
			<c:when test="${aplist.floor_plan==2}">1K</c:when>
			<c:when test="${aplist.floor_plan==3}">1DK</c:when>
			<c:when test="${aplist.floor_plan==4}">1LDK</c:when>
			<c:when test="${aplist.floor_plan==5}">2K</c:when>
			<c:when test="${aplist.floor_plan==6}">2DK</c:when>
			<c:when test="${aplist.floor_plan==7}">2LDK</c:when>
			<c:when test="${aplist.floor_plan==8}">3DK</c:when>
			<c:when test="${aplist.floor_plan==9}">3LDK</c:when>
			<c:when test="${aplist.floor_plan==10}">4DK</c:when>
			<c:when test="${aplist.floor_plan==11}">4LDK</c:when>
			<c:otherwise>間取りがありません</c:otherwise>
		</c:choose>

		</td>
	</tr>
	<tr>
		<th class="item">物件説明</th>
		<td class="value"><c:out value="${ aplist.apartment_explanation}" /></td>
	</tr>

	</tbody>
</table>
</div>
							<table>
								<tr>
									<td class="detail"><a
										href="../apartment/ApartmentDetail.action?apartment_cord=${aplist.apartment_cord}"
										target="_blank">物件詳細</a></td>
								</tr>
							</table>




</section><!-- ここまで検索結果 -->
</c:forEach>

</div>
</nav>

<div class= right_img>

			<c:choose>
				<c:when test="${!empty login_usermstbean }">
					<c:choose>
						<c:when test="${login_usermstbean.role_id==1 }">
							<img src="../img/admin_now.png" alt="管理者なう" width="400px" height="auto">
						</c:when>
						<c:otherwise>
							<img src="../img/login.png" alt="ログインなう" width="400px" height="auto">
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<a href="../login/kanri_login.jsp"><img src="../img/admin_login.png" alt="管理者はこちら" width="400px" height="auto"></a>
				</c:otherwise>
			</c:choose>

<img class= img2 src="../img/bgimg.png"width="400px" height="224px">

</div>

</div>
</form>
</body>
</html>