<!-- レイアウトとか色々、制作中 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>
<%@include file="../parts/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/ap_search.css">
<link rel="stylesheet" type="text/css" href="../css/Message.css">

<title>物件情報検索</title>
</head>
<body>
<form action="../apartment/ApartmentSearch.action" method="post"name="ApartmentMst" id="search">

		<div class=wrapper>
			<!-- ここからメイン -->

			<section class=search>
				<!-- ここから検索 -->
<div class= inline>
				<div class=search_element>
					<label>都道府県</label><br> <select  class= input_form name="apartment_address1">
					<c:choose>
						<c:when test="${searchMap.apartment_address1=='北海道'}">
							<option value="北海道" selected>北海道</option>
						</c:when>
						<c:otherwise>
						<option value="北海道">北海道</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${searchMap.apartment_address1=='青森県'}">
							<option value="青森県" selected>青森県</option>
						</c:when>
						<c:otherwise>
						<option value="青森県">青森県</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${searchMap.apartment_address1=='岩手県'}">
							<option value="岩手県" selected>岩手県</option>
						</c:when>
						<c:otherwise>
						<option value="岩手県">岩手県</option>
						</c:otherwise>
					</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='宮城県'}">
								<option value="宮城県" selected>宮城県</option></c:when>
							<c:otherwise><option value="宮城県">宮城県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='秋田県'}">
								<option value="秋田県" selected>秋田県</option></c:when>
							<c:otherwise><option value="秋田県">秋田県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='山形県'}">
								<option value="山形県" selected>山形県</option></c:when>
							<c:otherwise><option value="山形県">山形県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='福島県'}">
								<option value="福島県" selected>福島県</option></c:when>
							<c:otherwise><option value="福島県">福島県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='茨城県'}">
								<option value="茨城県" selected>茨城県</option></c:when>
							<c:otherwise><option value="茨城県">茨城県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='栃木県'}">
								<option value="栃木県" selected>栃木県</option></c:when>
							<c:otherwise><option value="栃木県">栃木県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='群馬県'}">
								<option value="群馬県" selected>群馬県</option></c:when>
							<c:otherwise><option value="群馬県">群馬県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='埼玉県'}">
								<option value="埼玉県" selected>埼玉県</option></c:when>
							<c:otherwise><option value="埼玉県">埼玉県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='千葉県'}">
								<option value="千葉県" selected>千葉県</option></c:when>
							<c:otherwise><option value="千葉県">千葉県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='東京都'}">
								<option value="東京都" selected>東京都</option></c:when>
							<c:otherwise><option value="東京都">東京都</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='神奈川県'}">
								<option value="神奈川県" selected>神奈川県</option></c:when>
							<c:otherwise><option value="神奈川県 ">神奈川県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='新潟県'}">
								<option value="新潟県" selected>新潟県</option></c:when>
							<c:otherwise><option value="新潟県">新潟県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='富山県'}">
								<option value="富山県" selected>富山県</option></c:when>
							<c:otherwise><option value="富山県">富山県</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='石川県'}">
								<option value="石川県" selected>石川県</option></c:when>
							<c:otherwise><option value="石川県">石川県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='福井県'}">
								<option value="福井県" selected>福井県</option></c:when>
							<c:otherwise><option value="福井県">福井県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='山梨県'}">
								<option value="山梨県" selected>山梨県</option></c:when>
							<c:otherwise><option value="山梨県">山梨県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='長野県'}">
								<option value="長野県" selected>長野県</option></c:when>
							<c:otherwise><option value="長野県">長野県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='岐阜県'}">
								<option value="岐阜県" selected>岐阜県</option></c:when>
							<c:otherwise><option value="岐阜県">岐阜県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='静岡県'}">
								<option value="静岡県" selected>静岡県</option></c:when>
							<c:otherwise><option value="静岡県">静岡県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='愛知県'}">
								<option value="愛知県" selected>愛知県</option></c:when>
							<c:otherwise><option value="愛知県">愛知県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='三重県'}">
								<option value="三重県" selected>三重県</option></c:when>
							<c:otherwise><option value="三重県">三重県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='滋賀県'}">
								<option value="滋賀県" selected>滋賀県</option></c:when>
							<c:otherwise><option value="滋賀県">滋賀県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='京都府'}">
								<option value="京都府" selected>京都府</option></c:when>
							<c:otherwise><option value="京都府">京都府</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='大阪府'}">
								<option value="大阪府" selected>大阪府</option></c:when>
							<c:otherwise><option value="大阪府">大阪府</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='兵庫県'}">
								<option value="兵庫県" selected>兵庫県</option></c:when>
							<c:otherwise><option value="兵庫県">兵庫県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='奈良県'}">
								<option value="奈良県" selected>奈良県</option></c:when>
							<c:otherwise><option value="奈良県">奈良県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='和歌山県'}">
								<option value="和歌山県" selected>和歌山県</option></c:when>
							<c:otherwise><option value="和歌山県">和歌山県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='鳥取県'}">
								<option value="鳥取県" selected>鳥取県</option></c:when>
							<c:otherwise><option value="鳥取県">鳥取県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='島根県'}">
								<option value="島根県" selected>島根県</option></c:when>
							<c:otherwise><option value="島根県">島根県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='岡山県'}">
								<option value="岡山県" selected>岡山県</option></c:when>
							<c:otherwise><option value="岡山県">岡山県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='広島県'}">
								<option value="広島県" selected>広島県</option></c:when>
							<c:otherwise><option value="広島県">広島県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='山口県'}">
								<option value="山口県" selected>山口県</option></c:when>
							<c:otherwise><option value="山口県">山口県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='徳島県'}">
								<option value="徳島県" selected>徳島県</option></c:when>
							<c:otherwise><option value="徳島県">徳島県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='香川県'}">
								<option value="香川県" selected>香川県</option></c:when>
							<c:otherwise><option value="香川県">香川県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='愛媛県'}">
								<option value="愛媛県" selected>愛媛県</option></c:when>
							<c:otherwise><option value="愛媛県">愛媛県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='高知県'}">
								<option value="高知県" selected>高知県</option></c:when>
							<c:otherwise><option value="高知県">高知県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='福岡県'}">
								<option value="福岡県" selected>福岡県</option></c:when>
							<c:otherwise><option value="福岡県">福岡県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='佐賀県'}">
								<option value="佐賀県" selected>佐賀県</option></c:when>
							<c:otherwise><option value="佐賀県">佐賀県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='長崎県'}">
								<option value="長崎県" selected>長崎県</option></c:when>
							<c:otherwise><option value="長崎県">長崎県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='熊本県'}">
								<option value="熊本県" selected>熊本県</option></c:when>
							<c:otherwise><option value="熊本県">熊本県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='大分県'}">
								<option value="大分県" selected>大分県</option></c:when>
							<c:otherwise><option value="大分県">大分県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='宮崎県'}">
								<option value="宮崎県" selected>宮崎県</option></c:when>
							<c:otherwise><option value="宮崎県">宮崎県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='鹿児島県'}">
								<option value="鹿児島県" selected>鹿児島県</option></c:when>
							<c:otherwise><option value="鹿児島県">鹿児島県</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${searchMap.apartment_address1=='沖縄県'}">
								<option value="沖縄県" selected>沖縄県</option></c:when>
							<c:otherwise><option value="沖縄県">沖縄県</option>
							</c:otherwise>
						</c:choose>
					</select>
				</div>
				<div class=search_element>
					<label for="search-pass">市区町村</label><br> <input class= input_form
						id="search-pass" type="text" name="apartment_address2" value="${searchMap.apartment_address2}"
						placeholder="例）札幌市">
				</div>


				<div class=search_element>
					<label>家賃</label><br> <input  class= input_form type="number" name="priceL"
						size="10" value="${searchMap.priceL}" pattern="^[0-9]">～ <input class=input_form type="number"
						name="priceH" size="10" value="${searchMap.priceH}" pattern="^[0-9]">&nbsp;円
				</div>


				<div class=search_element>

					<label>ペットの可否</label>
					<div class=checkbox>
						<input type="checkbox"  name="pet_friendly" id="petok" value="1" checked>可能
						<input type="checkbox" name="pet_friendly" id="petng"value="2"checked> 不可
					</div>
				</div>


				<div class=search_element>
					<label>間取り</label><br> <select class= input_form class=input_form3 name="floor_plan">
					<c:choose>
						<c:when test="${searchMap.floor_plan==''}">
							<option value="" selected>未選択</option>
						</c:when>
						<c:otherwise>
						<option value="">未選択</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${searchMap.floor_plan=='1'}">
							<option value="1" selected>ワンルーム</option>
						</c:when>
						<c:otherwise>
						<option value="1">ワンルーム</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${searchMap.floor_plan=='2'}">
							<option value="2" selected>1K</option>
						</c:when>
						<c:otherwise>
						<option value="2">1K</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${searchMap.floor_plan=='3'}">
							<option value="3" selected>1DK</option>
						</c:when>
						<c:otherwise>
						<option value="3">1DK</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${searchMap.floor_plan=='4'}">
							<option value="4" selected>1LDK</option>
						</c:when>
						<c:otherwise>
						<option value="4">1LDK</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${searchMap.floor_plan=='5'}">
							<option value="5" selected>2K</option>
						</c:when>
						<c:otherwise>
						<option value="5">2K</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${searchMap.floor_plan=='6'}">
							<option value="6" selected>2DK</option>
						</c:when>
						<c:otherwise>
						<option value="6">2DK</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${searchMap.floor_plan=='7'}">
							<option value="7" selected>2LDK</option>
						</c:when>
						<c:otherwise>
						<option value="7">2LDK</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${searchMap.floor_plan=='8'}">
							<option value="8" selected>3DK</option>
						</c:when>
						<c:otherwise>
						<option value="8">3DK</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${searchMap.floor_plan=='9'}">
							<option value="9" selected>3LDK</option>
						</c:when>
						<c:otherwise>
						<option value="9">3LDK</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${searchMap.floor_plan=='10'}">
							<option value="10" selected>4DK</option>
						</c:when>
						<c:otherwise>
						<option value="10">4DK</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${searchMap.floor_plan=='11'}">
							<option value="11" selected>4LDK</option>
						</c:when>
						<c:otherwise>
						<option value="11">4LDK</option>
						</c:otherwise>
					</c:choose>
					</select><br>
				</div>
				</div>
				<br>

			<button class="submit" name="search" type="submit">検索</button>
			</section>
			</div>
			</form>

			<form action="../apartment/ApartmentSearchReset.action" method="post" id="search">
				<input class= reset type="submit" value="リセット">
			</form>

			<!-- ここまで検索 -->
			<div class="message_ap_search">
				<c:if test="${login_usermstbean.role_id==1 }">
					<a href="../apartment/ap_reg.jsp">新規登録</a><br>
				</c:if>

				<!-- 物件検索結果の件数のメッセージエリア -->
				<c:if test="${!empty search_result_message}">
					${search_result_message }<br>
				</c:if>

				<!-- 物件削除時のメッセージエリア -->
				<c:if test="${!empty ap_del_comp_message}">
					${ap_del_comp_message }<br>
				</c:if>
			</div>

			<div class="height">
				<c:forEach var="aplist" items="${aplist_search }">

					<section class=search_results>
						<!-- ここから検索結果 -->

						<h2>
							<c:out value="${aplist.apartment_name}" />
						</h2>

						<div class="flex">

							<img class=ap_img
								src="data:image/png;base64,${aplist.apartment_imageBase64}" alt="物件画像">

							<table class="koumoku">
								<tbody>
									<tr>
										<th class="item">所在地</th>
										<td class="value">${aplist.apartment_address1}${aplist.apartment_address2}</td>
									</tr>
									<tr>
										<th class="item">賃料</th>
										<td class="value">\ <span class=strong>${aplist.rent}</span>円
										</td>
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
											</c:choose></td>
									</tr>
									<tr>
										<th class="item">物件説明</th>
										<td class="value">${aplist.apartment_explanation}</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class=flex>
							<table>
								<tr>
									<td class="detail"><a
										href="../apartment/ApartmentDetail.action?apartment_cord=${aplist.apartment_cord}"
										target="_blank">物件詳細</a></td>
								</tr>
							</table>
							<table>
								<tr>
									<c:if test="${login_usermstbean.role_id==1 }">
										<td class="edit"><a
											href="../apartment/ApartmentBeforeUpdate.action?apartment_cord=${aplist.apartment_cord}">編集</a></td>
								</c:if>
								</tr>
							</table>
							<table>
								<tr>
								<c:if test="${login_usermstbean.role_id==1 }">
										<td class="delete"><a
											href="../apartment/ApartmentDelete.action?apartment_cord=${aplist.apartment_cord}&apartment_name=${aplist.apartment_name}"
											onclick="return confirm('削除しますがよろしいですか？')">削除</a></td>
									</c:if>
								</tr>
							</table>
						</div>


					</section>
					<!-- ここまで検索結果 -->
				</c:forEach>
			</div>


</body>
<script>
function formReset() {
	document.getElementById('search').reset();
}
</script>
</html>

<%@include file="../parts/footer.jsp" %><!-- フッター呼び -->