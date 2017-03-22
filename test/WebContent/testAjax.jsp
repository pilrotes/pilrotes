<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLEncoder" %>
<%
	System.out.println(request.getParameter("keyword"));
	String keyword = null;
	String start = null;
	String display = null;
	
	if(request.getParameter("keyword") == null || request.getParameter("keyword").length() == 0) keyword = URLEncoder.encode("병원", "UTF-8");
	else keyword = URLEncoder.encode(request.getParameter("keyword").toString(), "UTF-8");
	
	if(request.getParameter("start") == null || request.getParameter("start").length() == 0) start = URLEncoder.encode("1", "UTF-8");
	else start = URLEncoder.encode(request.getParameter("start").toString(), "UTF-8");
	
	if(request.getParameter("display") == null || request.getParameter("display").length() == 0) display = URLEncoder.encode("10", "UTF-8");
	else display = URLEncoder.encode(request.getParameter("display").toString(), "UTF-8");
	
	
	String clientId = "hPZ0iy84b4nPIbb1qobj";//애플리케이션 클라이언트 아이디값";
	String clientSecret = "gphkNkPuFP";//애플리케이션 클라이언트 시크릿값";
	
	StringBuffer response2 = new StringBuffer();
	try {
		//String text = URLEncoder.encode("병원", "UTF-8");
		String apiURL = "https://openapi.naver.com/v1/search/local.json?query="+ keyword+"&start="+start+"&display="+display; // json 결과
		
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("X-Naver-Client-Id", clientId);
		con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if(responseCode==200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else {  // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		
		while ((inputLine = br.readLine()) != null) {
			response2.append(inputLine);
		}
		br.close();
		System.out.println(response2.toString());
	} catch (Exception e) {
		System.out.println(e);
	}
%>
<%=response2.toString()%>