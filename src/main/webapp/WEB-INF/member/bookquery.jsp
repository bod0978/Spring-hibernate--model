<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="Model.member"%>
<!DOCTYPE html>
<%
		member m = (member)session.getAttribute("M");
%>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

</head>
<body>


<div data-role="page" id="pageone" data-theme="a" >
	<div data-role="header" data-position="fixed" data-tap-toggle="false" >
    	<h1 >精緻美食，美食天地</h1>
  	</div>
	
	<div data-role="main" class="ui-content" >		
    	<table border=0 width=20% align="left"  bgcolor="#FFFFFF"  height="450px">
    		<tr align=center>
    			<td><a href="../mem/memupview" style="text-decoration:none;"><h4>會員資料修改</h4></a>
    		<tr align=center>
    			<td><a href="../booking/view" style="text-decoration:none;"><h4>網路訂位</h4></a>
    		<tr align=center>
    			<td><a href="../mem/view" style="text-decoration:none;" data-ajax="false"><h4>會員登出</h4></a>
    		<tr align=center>
    			<td><a href="../mem/loginok" style="text-decoration:none;" data-ajax="false"><h4>回首頁</h4></a>
    		<tr>
    		
    	</table>
    		
    	<table border=0 width=80% bgcolor="#FFFFFF" height="450px">
    		<tr>
    			<td align=center><font color="#bb1199"><h1>~<%=m.getName() %> 訂位查詢</h1>
    	</table>
  	</div>

	<div data-role="footer" data-position="fixed" data-tap-toggle="false" >
    	<h4>地址:XX市XX區OO路XX號3樓</h4>
    	<h4>電話:02-OOOOXXOX
  </div>
</div> 

</body>
</html>