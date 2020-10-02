<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="Model.staff"%>
<!DOCTYPE html>
<%
	staff sf = (staff) session.getAttribute("STAFF");
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
<div data-role="page" id="pageone" data-theme="a">
	<div data-role="header" data-position="fixed" data-tap-toggle="false" >
    	<h1 >員工登入系統 <%=sf.getName() %>您好</h1>
  	</div>
	
	<div data-role="main" class="ui-content" >		
		<table width=100% border=0  valign="top">
				<tr>
					<td align=center width=30%><a href="../staff/mem" style="text-decoration:none;" data-ajax="false"><h5>員工管理</h5></a>
			<br><a href="../staff/mass" style="text-decoration:none;" data-ajax="false"><h5>訊息管理</h5></a>
			<br><a href="../staff/food" style="text-decoration:none;" data-ajax="false"><h5>菜色管理</h5></a>
			<br><a href="../staff/ord" style="text-decoration:none;" data-ajax="false"><h5>定位管理</h5></a>
			<br><a href="../staff/index" style="text-decoration:none;" data-ajax="false"><h5>登出</h5></a>
			
			
			<td align=enter>
				<h1>歡迎光臨OO集團後端管理系統</h1>	
		</table>
		
	</div>

	<div data-role="footer" data-position="fixed" data-tap-toggle="false" >
		<table align=center>
			<tr>
				<td><h5><a href="../staff/sel" style="text-decoration:none;" data-ajax="false">登入</a></h5>
		</table>
	</div>
</div>			
		
</body>
</html>