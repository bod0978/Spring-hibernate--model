<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="Model.member"%>
<!DOCTYPE html>
<%
	member m = (member)session.getAttribute("M");
%>
<html>
<head>
 <meta http-equiv= "refresh"   content= "2 ;url=http:../mem/loginok"> 

<meta charset="utf-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

</head>
<body>
<script src="../validate.min.js">
  setTimeout( "self.location.reload(); ",7000);
</script>


<div data-role="page" id="pageone" data-theme="a" >
	<div data-role="header" data-position="fixed" data-tap-toggle="false" >
    	<h1 >精緻美食，美食天地</h1>
  	</div>
	
	<div data-role="main" class="ui-content" >	
	   	<table border=0 width=70%  bgcolor="#FFFFFF" height="450" align=center>
			<tr>
				<td align=center >~會員資料修改完成，等待6秒自動跳回首頁~<br><a href="../mem/loginok" >馬上跳頁</a> 
    	</table>
    	
  	</div>

	<div data-role="footer" data-position="fixed" data-tap-toggle="false" >
    	<h4>地址:XX市XX區OO路XX號3樓</h4>
    	<h4>電話:02-OOOOXXOX
  </div>
</div> 


</body>
</html>
