
//

// 상품페이지 리스트

//

var viewsortOtp = document.querySelectorAll("select[name='viewsort'] > option");
var viewsortOtpFirst = document.querySelector("select[name='viewsort'] > option:first-of-type");

// 리스트 정렬 함수
function listSorted() {
	for(var i=0; i<viewsortOtp.length; i++) {
		if(viewsortOtp[i].selected) {
			console.log(viewsortOtp[i]);
		}
	}
}
