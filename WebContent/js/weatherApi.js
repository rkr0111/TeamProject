
//

// 날씨 api js

//
var mdpick = document.querySelector(".mdpick");


// 날씨 api
window.onload = function weatherApi() {
	var api = "http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=b1c0c7525d62991fddcf261a16a8216f";
	var api1 = "http://api.openweathermap.org/data/2.5/weather?q=";
	var apiKey = "&appid=b1c0c7525d62991fddcf261a16a8216f";
	var imgSrc = "images/mdpick_img/";
	$.ajax({
		url: api,
		type: 'get',
		dataType: 'json',
		success: function(obj) {
			var temp = ((obj.main.temp)-273).toFixed(1); // 온도
			var weather = obj.weather[0].main; // 날씨
			var city = "서울";
			var imgName = "";
			
			if(weather == "Clouds"){
				weather = "흐림";
				imgName = "clouds";
			}else if (weather == "Thunderstorm") {
				weather = "낙뢰";
				imgName = "thunderstorm";
			}else if (weather == "Rain") {
				weather = "비";
				imgName = "rain";
			}else if (weather == "Drizzle") {
				weather = "이슬비";
				imgName = "drizzle";
			}else if (weather == "Clear") {
				weather = "맑음";
				imgName = "clear";
			}else if (weather == "Fog") {
				weather = "안개";
				imgName = "fog";
			}else if (weather == "Snow") {
				weather = "눈";
				imgName = "snow";
			}
			mdpick.addEventListener("click", function() {
				location.href="mdRandomList.bo?product_weather="+encodeURIComponent(weather);
			});
			
		}
	});
}
