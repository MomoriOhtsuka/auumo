<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../parts/header.jsp" %><!-- ヘッダー呼び -->
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/check.css">
<meta charset="UTF-8">
<title>物件登録確認画面</title>
</head>
<body>
<div class= body>
<div class=yohaku>
	<h1>更新情報の確認</h1>
	<p>
		物件情報を更新します。<br>
		入力情報に誤りがないか、ご確認のうえ更新ボタンを押してください。<br>
	</p>
</div>

	<div class=margin_b>
		<p><span class=label>物件名：</span>${apupdate.apartment_name}</p>
	</div>
	<div class=margin_b>
		<p><span class=label>物件住所（都道府県）：</span>${apupdate.apartment_address1}</p>
	</div>
	<div class=margin_b>
		<p><span class=label>物件住所（市区町村）：</span>${apupdate.apartment_address2}</p>
	</div>
	<div class=margin_b>
		<p><span class=label>管理先電話番号：</span>${apupdate.contact_telnumber}</p>
	</div>
	<div class=margin_b>
		<p><span class=label>家賃：</span>${apupdate.rent}</p>
	</div>
	<div class=margin_b>
		<p><span class=label>敷金・礼金：</span>${apupdate.depsit_reward}</p>
	</div>
	<div class=margin_b>
		<p><span class=label>ペット可否：</span><c:choose>
												<c:when test="${apupdate.pet_friendly==0}">不可</c:when>
												<c:when test="${apupdate.pet_friendly==1}">可</c:when>
												<c:otherwise>ペット情報がありません</c:otherwise>
												</c:choose></p>
	</div>
	<div class=margin_b>
		<p><span class=label>間取り：</span><c:choose>
					<c:when test="${apupdate.floor_plan==1}">ワンルーム</c:when>
					<c:when test="${apupdate.floor_plan==2}">1K</c:when>
					<c:when test="${apupdate.floor_plan==3}">1DK</c:when>
					<c:when test="${apupdate.floor_plan==4}">1LDK</c:when>
					<c:when test="${apupdate.floor_plan==5}">2K</c:when>
					<c:when test="${apupdate.floor_plan==6}">2DK</c:when>
					<c:when test="${apupdate.floor_plan==7}">2LDK</c:when>
					<c:when test="${apupdate.floor_plan==8}">3DK</c:when>
					<c:when test="${apupdate.floor_plan==9}">3LDK</c:when>
					<c:when test="${apupdate.floor_plan==10}">4DK</c:when>
					<c:when test="${apupdate.floor_plan==11}">4LDK</c:when>
					<c:otherwise>間取りがありません</c:otherwise>
											</c:choose></p>
	</div>
	<div class=margin_b>
		<p><span class=label>間取り画像：</span></p><br>
		<img class=label_img src="data:image/png;base64,${apupdate.floor_plan_imageBase64}" alt="画像"  width="300" height="200">
	</div>
	<div class=margin_b>
		<p><span class=label>物件説明：</span>${apupdate.apartment_explanation}</p>
	</div>
	<div class=margin_b>
		<p><span class=label>物件画像：</span></p><br>
		<img src="data:image/png;base64,${apupdate.apartment_imageBase64}" alt="画像"  width="300" height="200">
	</div>

<div class= between>
	<form >
		<button class= submit2 type="button" onclick="history.back()" >戻る</button>
	</form>

	<form action="ApartmentUpdate.action" method="post" >
		<button  class= submit2 type="submit" >更新</button>
	</form>


</div>
</div>
</body>
</html>
<%@include file="../parts/footer.jsp" %><!-- フッター呼び -->