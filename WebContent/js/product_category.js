
//

// 상품페이지 리스트

//

var viewsortOpt = document.querySelectorAll("select[name='viewsort'] > option");
var viewsortOptFirst = document.querySelector("select[name='viewsort'] > option:first-of-type");

// 리스트 정렬 함수
function listSorted(product_category) {
	var selected_opt = "";
	for(var i=0; i<viewsortOpt.length; i++) {
		if(viewsortOpt[i].selected && !viewsortOptFirst.selected) {
			selected_opt = viewsortOpt[i].value;
		}
	}
	
	var param = "product_category=" + product_category
				+ "&selected_opt=" + selected_opt;
				
				console.log(param);
	
	$.ajax({
		url: "productList.bo",
		type: "post",
		data: param,
		success: function(obj) {
			location.href="productList.bo?product_category="+product_category+"&selected_opt="+selected_opt;
			console.log(obj);
		}
	});
}
