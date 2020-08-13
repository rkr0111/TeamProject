package com.TeamPro.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.TeamPro.dto.ActionForward;

public class WeatherApiAction implements Light_action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		ActionForward forward = null;
		
		String apiKey = "b1c0c7525d62991fddcf261a16a8216f";
		String urlstr = "https://api.openweathermap.org/data/2.5/onecall";
		
		StringBuilder urlBuilder = new StringBuilder(urlstr);
		urlBuilder.append("?" + URLEncoder.encode("lat", "UTF-8") + "=37.498137");
	    urlBuilder.append("&" + URLEncoder.encode("lon", "UTF-8") + "=127.027427");
	    urlBuilder.append("&" + URLEncoder.encode("%20exclude=", "UTF-8") + "=current");
	    urlBuilder.append("&" + URLEncoder.encode("appid", "UTF-8") + "="+apiKey);
	    
	    URL url = new URL(urlBuilder.toString());
	    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("pages_mdpick/mdpick.jsp");
		return forward;
	}

}
