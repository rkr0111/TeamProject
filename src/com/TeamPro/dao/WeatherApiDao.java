package com.TeamPro.dao;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

public class WeatherApiDao {
	
	public void weatherParsing(HttpServletRequest request, HttpServletResponse response, String today) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		BufferedReader bufferedReader = null;
		
		String nx = "60"; //경도
		String ny = "127"; //위도
		String numOfRows = "10";
		String pageNo = "1";
		String base_date = today; //조회하고 싶은 날짜
		String base_time = "0500"; //조회하고 싶은 시간대 (ex)0500 : 5시)
		String dataType = "JSON";
		String serviceKey = "f6RBfde7Q5%2BnrQDAaiCeDdZtrJFK9NlaqcYLEkMB0SuOmxD8O7ag%2BGfrui7x4v9K17L4qtVi0HidCF8HN%2B2tSA%3D%3D"; //인증키
		String urlstr = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?"
						+ "serviceKey=" + serviceKey
						+ "&pageNo=" + pageNo
						+ "&numOfRows=" + numOfRows
						+ "&dataType=" + dataType
						+ "&base_date=" + base_date
						+ "&base_time=" + base_time
						+ "&nx="+ nx
						+ "&ny=" + ny;
		
		URL url = new URL(urlstr);
		HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
		urlConnection.setRequestMethod("GET");
		bufferedReader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "utf-8"));
		
		String result = "";
		String line = "";
		
		while((line = bufferedReader.readLine()) != null) {
			result = result + line + "\n";
		}
		System.out.println("java : " + result);

		JSONObject jObj = new JSONObject();
		jObj.put("result", result);
	}

}
