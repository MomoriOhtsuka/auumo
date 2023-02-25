<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../parts/header.jsp" %><!-- ヘッダー呼び -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/detail.css">
<title>物件情報詳細</title>
</head>
<body>
<div class= wrapper>

<c:forEach var="aplist_dtail" items="${aplist_dtail }">
<div class=margin_b>
<div style="border: #008000 solid 1px; border-left: #008000 solid 10px; padding: 20px; margin-right:500px; background: #fff; font-size: 300%;">${aplist_dtail.apartment_name}</div>
</div>

<img src="data:image/png;base64,${aplist_dtail.apartment_imageBase64}" alt="画像" width="400px" height="400px">
<img src="data:image/png;base64,${aplist_dtail.floor_plan_imageBase64}" alt="画像" width="200px" height="auto">

<h3>物件説明</h3>
<p class= apartment_explanation>${aplist_dtail.apartment_explanation}</p>
<table class="table">
	<tr>
	<tr><th style="background-color: #519C00">物件名</th><td>${aplist_dtail.apartment_name}</td></tr>
	<tr><th style="background-color: #519C00">間取り</th>
		<td>
			<c:choose>
				<c:when test="${aplist_dtail.floor_plan==1}">ワンルーム</c:when>
				<c:when test="${aplist_dtail.floor_plan==2}">1K</c:when>
				<c:when test="${aplist_dtail.floor_plan==3}">1DK</c:when>
				<c:when test="${aplist_dtail.floor_plan==4}">1LDK</c:when>
				<c:when test="${aplist_dtail.floor_plan==5}">2K</c:when>
				<c:when test="${aplist_dtail.floor_plan==6}">2DK</c:when>
				<c:when test="${aplist_dtail.floor_plan==7}">2LDK</c:when>
				<c:when test="${aplist_dtail.floor_plan==8}">3DK</c:when>
				<c:when test="${aplist_dtail.floor_plan==9}">3LDK</c:when>
				<c:when test="${aplist_dtail.floor_plan==10}">4DK</c:when>
				<c:when test="${aplist_dtail.floor_plan==11}">4LDK</c:when>
				<c:otherwise>間取りがありません</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr><th style="background-color: #519C00">住所</th><td>${aplist_dtail.apartment_address1}${aplist_dtail.apartment_address2}</td></tr>
	<tr><th style="background-color: #519C00">家賃</th><td>${aplist_dtail.rent}</td></tr>
	<tr><th style="background-color: #519C00">敷金・礼金</th><td>${aplist_dtail.depsit_reward}</td></tr>
	<tr><th style="background-color: #519C00">管理先電話番号</th><td>${aplist_dtail.contact_telnumber}</td></tr>
	<tr><th style="background-color: #519C00">ペットの可否</th>
		<td>
			<c:choose>
				<c:when test="${aplist_dtail.pet_friendly==0}">不可</c:when>
				<c:when test="${aplist_dtail.pet_friendly==1}">可</c:when>
				<c:otherwise>ペット情報がありません</c:otherwise>
			</c:choose>
		</td>
	</tr>

</table>
	<c:if test="${!empty login_usermstbean}">
		<form action="../review/ReviewRegister.action" method="post" id="contact_form">
			<div class="inputs">
					<label class="label">口コミ投稿</label><br>
					<textarea class=input_form2 cols="20" rows="5" name="review" placeholder="例）感想を入れる" value=""></textarea><br>
					<input type="hidden" name="apartment_cord" value="${aplist_dtail.apartment_cord}">
				</div>
				<div class= review_check_message>
					<c:if test="${!empty review_check_message}">
					${review_check_message }
					</c:if>
				</div>
				<div class="btn">
				<input class= submit type="submit" value="確認">
				</div>
		</form>
	</c:if>
	<br>


</c:forEach>
<br>
<table style="margin-top:150px">
	<c:forEach var="rvuslist" items="${rvuslist }">
			<tr>
				<td>投稿者</td><td>${rvuslist.nick_name}</td><td>投稿日時</td><td>${rvuslist.review_insert_date}</td>
				<c:if test="${login_usermstbean.account_code==rvuslist.account_code || login_usermstbean.role_id==1}">
					<td><a href="../review/ReviewDelete.action?review_id=${rvuslist.review_id}&apartment_cord=${rvuslist.apartment_cord}" onclick="return confirm('この口コミを削除しますがよろしいですか？')">削除</a></td>
				</c:if>
			</tr>
			<table style="padding: 20px; margin-bottom: 20px; border: 1px solid #333333; width:400px">
				<tr><td>${rvuslist.message}</td>
			</tr>
			</table>
	</c:forEach>
</table>
</div>

</body>
</html>
<%@include file="../parts/footer.jsp" %><!-- フッター呼び -->
