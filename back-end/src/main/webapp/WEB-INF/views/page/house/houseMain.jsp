<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel=" shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<title>Happy House Process</title>

<!-- Bootstrap CSS -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="img/favicon.ico">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Place css -->
<link rel="stylesheet" href="<%=path%>/css/house.css" />
</head>
<body>
	<%@ include file="../header.jsp"%>

	<section class="houseHeader">
		<h1>실거래가 상세정보</h1>
		<div class="searchBtns d-flex justify-content-center">
			<button type="button" class="btn btn-danger">아파트별 검색</button>
			<button type="button" class="btn btn-danger">동별 검색</button>
		</div>
	</section>


	<section id="index_section">
		<div class="card col-sm-12 mt-1" style="min-height: 850px;">
			<div class="card-body">

				<div id="searchSelect">
					시도 : <select id="sido">
						<option value="0">선택</option>
					</select> 구군 : <select id="gugun">
						<option value="0">선택</option>
					</select> 읍면동 : <select id="dong">
						<option value="0">선택</option>
					</select>
				</div>

				<table class="table mt-2">
					<thead>
						<tr>
							<th>번호</th>
							<th>법정동</th>
							<th>아파트이름</th>
							<th>지번</th>
							<th>지역코드</th>
							<th>위도</th>
							<th>경도</th>
						</tr>
					</thead>
					<tbody id="resultSearch">
					</tbody>
				</table>

				<div id="map" style="width: 100%; height: 500px; margin: auto;"></div>
				<script
					src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
				<script defer
					src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCagXrDBTexTCeFvAKOtsye8wNYahnuY4c&callback=initMap"></script>
				<script>
					var multi = {lat: 37.5665734, lng: 126.978179};
					var map;
					function initMap() {
						map = new google.maps.Map(document.getElementById('map'), {
							center: multi, zoom: 12
						});
						var marker = new google.maps.Marker({position: multi, map: map});
					}
					function addMarker(tmpLat, tmpLng, aptName) {
						var marker = new google.maps.Marker({
							position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
							label: aptName,
							title: aptName
						});
						marker.addListener('click', function() {
							map.setZoom(17);
							map.setCenter(marker.getPosition());
							callHouseDealInfo();
						});
						marker.setMap(map);
					}
					function callHouseDealInfo() {
						alert("you can call HouseDealInfo");
					}
				</script>
			</div>
		</div>
	</section>


	<%@ include file="../footer.jsp"%>


	<script>
let colorArr = ['table-primary','table-success','table-danger'];
	$(document).ready(function(){
		getSido();
	
		$("#sido").change(function() {
			getGugun();
		});
		
		$("#gugun").change(function() {
			getDong();
		});

		$("#dong").change(function() {
			getApt();
		});
		
	});
	
	function getSido(){
		$.get(
				"/getSido"
				,function(data, status){
					var list = data.sglist;
					$.each(list, function(index, vo){
						$("#sido").append("<option value='"+vo.sidoCode+"'>"+vo.sidoName+"</option>");
					});
				}
				,"json");
	};
	
	function getGugun(){
		$.get(
				"/getGugunInSido"
				,{sido:$("#sido").val()}
				,function(data, status){
					$("#gugun").empty();
					$("#gugun").append('<option value="0">선택</option>');
					$.each(data.sglist, function(index, vo) {
						$("#gugun").append("<option value='"+vo.gugunCode+"'>"+vo.gugunName+"</option>");
					});
				}
				, "json");
	};
		
	function getDong(){
		$.get(
				"/getDongInGugun"
				,{gugun:$("#gugun").val()}
				,function(data, status){
					$("#dong").empty();
					$("#dong").append('<option value="0">선택</option>');
					$.each(data.hilist, function(index, vo) {
						$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
					});
				}
				, "json");
	};
	
	function getApt(){
		$.get(
				"/getAptInDong"
				,{dong:$("#dong").val()}
				,function(data, status){
					$("#resultSearch").empty();
					$.each(data.hilist, function(index, vo) {
						let str = "<tr class="+colorArr[index%3]+">"
						+ "<td>" + vo.no + "</td>"
						+ "<td>" + vo.dong + "</td>"
						+ "<td>" + vo.aptName + "</td>"
						+ "<td>" + vo.jibun + "</td>"
						+ "<td>" + vo.code
						+ "</td><td id='lat_"+index+"'></td><td id='lng_"+index+"'></td></tr>";
						$("#resultSearch").append(str);
					});
					geocode(data);
				}
				, "json");
	};
				
	function geocode(jsonData) {
		let idx = 0;
		$.each(jsonData, function(index, vo) {
			let tmpLat;
			let tmpLng;
			$.get("https://maps.googleapis.com/maps/api/geocode/json"
					,{	key:'AIzaSyCagXrDBTexTCeFvAKOtsye8wNYahnuY4c'
						, address:vo.dong+"+"+vo.aptName+"+"+vo.jibun
					}
					, function(data, status) {
						tmpLat = data.results[0].geometry.location.lat;
						tmpLng = data.results[0].geometry.location.lng;
						$("#lat_"+index).text(tmpLat);
						$("#lng_"+index).text(tmpLng);
						addMarker(tmpLat, tmpLng, vo.aptName);
					}
					, "json");
		});
	}
</script>


</body>
</html>
