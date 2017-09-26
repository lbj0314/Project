<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>

function googleapisView() {
	
	//기업 회원이 기업을 등록할 때 받아온 주소를 el로 address에 수정하면 바뀜. 
	var addr='${tourRetrieve.attAddr2}';
	
    var address = encodeURIComponent(addr);
    var geocode = "http://maps.googleapis.com/maps/api/geocode/json?address="+address+"&sensor=false";
    $.ajax({
        url: geocode,
        type: 'POST',
           success: function(myJSONResult){
                    if(myJSONResult.status == 'OK') {
                        var wi="";
                        var gy="";
                        var myMap = document.getElementById("myMap");
                        for (var i = 0; i < myJSONResult.results.length; i++) {
                         
                          wi +=myJSONResult.results[i].geometry.location.lat; //위도
                         
                          gy += myJSONResult.results[i].geometry.location.lng; //경도
                        }
                        
                        var loc = new google.maps.LatLng(wi,gy);
                        
                        var gmap = new google.maps.Map(

                				myMap,	//지도가 보여질 div

                				{

                					zoom:14,//	지도 확대 정보

                				 	center:loc,	//	지도 중앙	위치

                					mapTypeId:google.maps.MapTypeId.ROADMAP //	지도타입

                				}

                		);
                        var gmarker = new google.maps.Marker(

                    			{

                    				position:loc,

                    				map:gmap,

                    				title:"위치"

                    			}

                    		);
                    } else if(myJSONResult.status == 'ZERO_RESULTS') {
                        alert("지오코딩이 성공했지만 반환된 결과가 없음을 나타냅니다.\n\n이는 지오코딩이 존재하지 않는 address 또는 원격 지역의 latlng을 전달받는 경우 발생할 수 있습니다.")
                    } else if(myJSONResult.status == 'OVER_QUERY_LIMIT') {
                        alert("할당량이 초과되었습니다.");
                    } else if(myJSONResult.status == 'REQUEST_DENIED') {
                        alert("요청이 거부되었습니다.\n\n대부분의 경우 sensor 매개변수가 없기 때문입니다.");
                    } else if(myJSONResult.status == 'INVALID_REQUEST') {
                        alert("일반적으로 쿼리(address 또는 latlng)가 누락되었음을 나타냅니다.");
                    }
            }
    });
}
googleapisView();
</script>



