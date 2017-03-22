<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page session="true"%>

<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">

<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<meta http-equiv="X-UA-Compatible" content="IE=Edge">

<meta http-equiv="content-Type" content="text/html; charset=utf-8" />

<meta name="format-detection" content="telephone=no">

<meta http-equiv="Pragma" content="no-cache">

<meta http-equiv="Cache-Control" content="No-Cache">




<title>번호 안내 서비스</title>

<link href="${contextPath}/poi/css/oem114.css" type="text/css" rel="stylesheet">

<script type="text/javascript">

var imageUrl = "${imageUrl}";

var comInfo = "${comInfo}";

var appkey = "${appkey}";

var hash = "${hash}";

</script>

<script src="js/jquery-3.2.0.js"></script>
<script type="text/javascript" src="js/test2.js" charset="utf-8"></script>

</head>

<body class="oem114Wrap">

<div class="oem114Wrap_in">

<h1 class="mOllehHideTxt">번호 안내 서비스</h1>




<div class="oem114_topPD">

<!-- 상단 고정영역 있는 경우 -->

<!-- 상단 타이틀 -->

<div class="topTitWrap">

<div class="topTit_in">

<!--타이틀이 긴 경우 topTxtL 클래스 추가(이동통신단말장치 정보·기능 접근 동의)-->

<a href="javascript:closeApp();" class="topS_leftBtn"> <img src="<%-- ${contextPath} --%>/poi/images/oem114/topPrev.png" alt="이전">

</a>

<!--이전버튼-->

<h2 class="topTit">번호안내 서비스 이용약관</h2>

</div>

</div>

<!--// 상단 타이틀 -->




<!-- 약관 -->

<div class="con_bgWhite agreeSelects">




<p class="termsTxt termShowHide1">본 약관은 번호안내 서비스 이용에 필수적으로 필요하며, 하나의 약관이라도 철회 시 서비스 이용이 해지됩니다.</p>

<p class="termsTxt termShowHide2" style="display: none">본 약관은 번호안내 서비스 이용에 필수적으로 필요하며, 하나의 약관이라도 철회 시 서비스 이용이 해지됩니다.</p>

<!--전체약관 선택 O-->

<%-- data : ${termsList}<br> 약관 동의 목록 조회 및 변경. --%>

<ul class="termList" id="termList">
	<li>
		<input type="checkbox" id="terms11" class="smallDataGroup" checked="checked" />
		<input type="checkbox" id="terms12" class="smallDataGroup" checked="checked" />
	</li>
	
<c:forEach var="item" items="${termsList}" varStatus="status">

	<li id="termsLi${status.count}" data-terms-id="${item.termsId}" data-version="${item.termsVersion}" data-mandatory-yn="${item.mandatoryYn}">
	<c:choose>
	
	<c:when test="${item.agreeYn eq 'Y'}">
	
	<input type="checkbox" id="terms${status.count}" class="smallDataGroup" checked="checked">
	
	</c:when>
	
	<c:otherwise>
	
	<input type="checkbox" id="terms${status.count}" class="smallDataGroup">
	
	</c:otherwise>
	
	</c:choose> <label for="terms${status.count}"></label> <span> <c:url var="detailLink" value="/terms/${item.termsId}" /> <a href="${detailLink}">${item.termsTitle}</a> <c:choose>
	
	<c:when test="${item.mandatoryYn eq 'Y'}">(필수)</c:when>
	
	<c:otherwise>(선택)</c:otherwise>
	
	</c:choose>
	
	</span></li>
	
	</c:forEach>

</ul>

<p class="termsTxt termShowHide1">* 서비스 해지 시에는 주소록에서 번호안내 서비스 검색기능을 이용할 수 없으며, 서비스 이용기록(My Page, 즐겨찾는 가게 등)이 삭제됩니다.</p>

<!--전체약관 선택 X-->

<p class="termsTxt termShowHide2" style="display: none">* 서비스 해지 시에는 주소록에서 번호안내 서비스 검색기능을 이용할 수 없으며, 서비스 이용기록(My Page, 즐겨찾는 가게 등)이 삭제됩니다.</p>

<!--전체약관 선택 O-->

<ul class="termList2" id="checkBtn">

<li class="checkShowHide1" style="display: block">

	<!--전체약관 선택 X--> <input type="checkbox" id="agreement" class="checkAll"> <label for="agreement"></label> <span>모두 철회하기1</span>

</li>

<li class="checkShowHide2">

	<!--전체약관 선택 O--> <input type="checkbox" id="withdraw" class="removeAll"> <label for="withdraw"></label> <span>모두 철회하기2</span>

</li>

</ul>

<!--버튼-->

<div class="agreeBtnWrap" id="agreeBtnWrap">

<div>

<a href="javascript:closeApp();" class="agBtnCancle"> <span>취소</span>

</a> <a href="javascript:agreeProp();" class="agBtnconfirm"> <span>확인</span>

</a>

</div>

</div>

<!--//버튼-->

</div>

<!--// 약관 -->

</div>




</div>

</body>

