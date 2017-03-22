<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>네이버 지역검색 API</title>
<script src="js/jquery-3.2.0.js"></script>




<script>
	$(document).ready(function(){
		
		// 페이지가 로딩될 때 'Loading 이미지'를 숨긴다. 
		$('#viewLoading').hide(); 
		// ajax 실행 및 완료시 'Loading 이미지'의 동작을 컨트롤하자. 
		$(window)
		   .ajaxStart(function() {
		      // 로딩이미지의 위치 및 크기조절 
		      $('#viewLoading').css('position', 'absolute'); 
		      //$('#viewLoading').css('left', $('#loadData').offset().left); 
		      //$('#viewLoading').css('top', $('#loadData').offset().top); 
		      $('#viewLoading').css('width', $('#loadData').css('width')); 
		      $('#viewLoading').css('height', $('#loadData').css('height')); 
		      //$(this).show(); 
		      $('#viewLoading').fadeIn(500); 
		   }) 
		   .ajaxStop(function() { 
		      //$(this).hide(); 
		      $('#viewLoading').fadeOut(500); 
		   }); 
		
		search();
		
		/*
		$.ajax({
			type : 'get'
			, url : 'testAjax.jsp'
			, dataType : 'json'
			, error: function(xhr, status, error){
				alert(error);
			 }
			, success : function(data){
				
				var html = "";
				$.each(data.items, function(index, entry) {
					html += "<tr>";
					html += "<td>"+entry.title+"</td>";
					html += "<td>"+entry.telephone+"</td>";
					html += "<td>"+entry.address+"</td>";
					html += "</tr>";
				});
				
				$("#table").html(html);
			 }
		});
		*/
		//end ajax
	});
	
	function search() {
		//$("#keyword").val();
		var param = {};
		param.keyword = $("#keyword").val();
		param.start = $("#start").val();
		param.display = $("#display").val();
		
		$.ajax({
			type : 'get'
			, url : 'testAjax.jsp'
			, dataType : 'json'
			, data : param
			, error: function(xhr, status, error){
				alert(error);
			 }
			, success : function(data){
				var html = "";
				$.each(data.items, function(index, entry) {
					html += "<tr>";
					html += "<td>"+entry.title+"</td>";
					html += "<td>"+entry.telephone+"</td>";
					html += "<td>"+entry.address+"</td>";
					html += "</tr>";
				});
				
				$("#table").html(html);//내용
				
				$("#total").html("Total : " + data.total);//총계
			 }
		});
		//end ajax
	}
</script>

<style> 
/* 로딩이미지 박스 꾸미기 */ 
div#viewLoading { 
   text-align: center;
   /* padding-top: 70px; */
   /* background: #FFFFF0; */
   filter: alpha(opacity=60);
   opacity: alpha*0.6; position:fixed; top:50%; left:50%;
} 
</style> 


</head>
<body>
	test 테스트3<br/>
	키워드 : <input type="text" id="keyword" name="keyword"></input><br/>
	시작 : <input type="text" id="start" name="start"></input>(MAX:1000)<br/>
	출력건수 : <input type="text" id="display" name="display"></input>(MAX:100)<br/>
	<button onclick="javasrcipt:search();">검색</button><br/><br/>
	
	<span id="total"></span><br/>
	<table id="table" border="1">
	</table>
	
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=50691a279b13c77501a86b0a53189539"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};
		var map = new daum.maps.Map(container, options);
	</script>
</body>

<!-- 로딩 이미지 --> 
<div id="viewLoading"> 
	<img src="img/ajax-loader.gif" /> 
</div> 


</html>