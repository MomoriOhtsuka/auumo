<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
function deletesession_aplist_search() {
	window.sessionStorage.removeItem([aplist_search]);
	}

function clickDisplayAlert() {
  alert("ボタンがクリックされました！");
}
</script>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/Header.css">
<title>!!! AUUMO !!!</title>
</head>

<body>
<header class= header><!-- ヘッダー -->
		<div class="header_wrapper">
			<h1>
				<a href="../toppage/index.jsp"><img class= logo src="../img/AUUMO_ロゴ_header-removebg-preview.png" alt="AUUMOロゴ"></a>
			</h1>
		</div>

		<div class= right>
			<c:choose>
				<c:when test="${!empty login_usermstbean }">
					<c:choose>
						<c:when test="${login_usermstbean.role_id==1 }">
							<div class=nickname><p>ようこそ管理者の&nbsp;&nbsp;${login_usermstbean.nick_name }様&nbsp;&nbsp;&nbsp;&nbsp;</p></div>
						</c:when>
						<c:otherwise>
							<div class=nickname><p>ようこそ&nbsp;&nbsp;${login_usermstbean.nick_name }さん&nbsp;&nbsp;&nbsp;&nbsp;</p></div>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<div class=nickname><p>ようこそ&nbsp;&nbsp;ゲストさん&nbsp;&nbsp;&nbsp;&nbsp;</p></div>
				</c:otherwise>
			</c:choose>

			<a href="../apartment/ap_search.jsp">&nbsp;&nbsp;物件情報&nbsp;&nbsp;</a>

			<c:if test="${login_usermstbean.role_id==1 }">
			<a href="../apartment/ap_reg.jsp">&nbsp;&nbsp;物件情報新規登録&nbsp;&nbsp;</a>
			<a href="../account/ac_kanri_reg.jsp">&nbsp;&nbsp;管理者アカウント新規登録&nbsp;&nbsp;</a>
			<a href="../account/ac_kanri_search.jsp">&nbsp;&nbsp;アカウント検索・削除&nbsp;&nbsp;</a>
			</c:if>
			<c:if test="${empty login_usermstbean  }">
				<a href="../account/ac_ippan_reg.jsp">&nbsp;&nbsp;利用者アカウント登録&nbsp;&nbsp;</a>
				<a href="../login/login.jsp">&nbsp;&nbsp;ログイン&nbsp;&nbsp;</a>
				<a href="../login/kanri_login.jsp">&nbsp;&nbsp;管理者の方はこちら&nbsp;&nbsp;</a>
			</c:if>
			<c:if test="${!empty login_usermstbean  }">
					<a href="../logout/Logout.action">&nbsp;&nbsp;ログオフ&nbsp;&nbsp;</a>
			</c:if>
			<c:if test="${!empty login_usermstbean  }">
				<c:if test="${login_usermstbean.role_id==2 }">
					<a href="../account/Withdrawal.action?account_code=${login_usermstbean.account_code}"  onclick="return confirm('退会しますがよろしいですか？　退会後は、アカウント情報及び口コミ情報が破棄されます。')">&nbsp;&nbsp;退会&nbsp;&nbsp;</a>
				</c:if>
			</c:if>

		</div>
</header><!-- ヘッダー〆 -->

</body>
</html>