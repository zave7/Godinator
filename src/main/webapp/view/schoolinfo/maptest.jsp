<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function searchBusLaneAJAX() {
	var busNo = document.getElementById('busNo').value;
	var xhr = new XMLHttpRequest();
	var url = "https://api.odsay.com/v1/api/searchBusLane?apiKey=xn0i1MHNnUQ/5i2DT/bTZg&busNo=" + busNo;
	xhr.open("GET", url, true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var resultObj = JSON.parse(xhr.responseText);
			console.log(resultObj.result);
			var resultArr = resultObj["result"]["lane"];
			console.log(resultArr);

			var str = "";
			for (var i = 0; i < resultArr.length; i++) {
				str += "<div class='box'>";
				str += "<p>지역이름 : " + resultArr[i].busCityName + "</p>";
				str += "<p>버스회사 : " + resultArr[i].busCompanyNameKor + "</p>";
				str += "<p>버스번호 : " + resultArr[i].busNo + "</p>";
				str += "<p>출발점 / 도착점 : " + resultArr[i].busStartPoint + " - "
					+ resultArr[i].busEndPoint + "</p>";
				str += "</div>";
			}
			document.getElementById("resultDiv").innerHTML = str;
		}
	}
}
</script>
</head>
<body>
<div>
<input type="text" id="busNo">
<button onclick="searchBusLaneAJAX();">click</button>
</div>
<div id="resultDiv">
<!-- 결과창 -->
</div>     
<div id="kakaoMap" style="width: 500px; height: 500px">

</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b3eff8dc3c024272148b81baa4f00552"></script>
<script>
var mapContainer = document.getElementById('kakaoMap'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

//마커를 생성합니다
var marker = new kakao.maps.Marker({
position: markerPosition
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

//아래 코드는 지도 위의 마커를 제거하는 코드입니다
//marker.setMap(null);   
</script>
</body>
</html>