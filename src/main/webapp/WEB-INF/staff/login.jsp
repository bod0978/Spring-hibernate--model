<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
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
    	<h1 >員工登入系統</h1>
  	</div>
	
	<div data-role="main" class="ui-content" >		

		<form id="form1" name="form1" action="../staff/login" method="post"  onclick="return false">
			<table align=center broder=1 width=40%>
				<tr>
					<td width=10%>帳號:
					<td width=30%><input type="text" name="user" id="user" >
				<tr>
					<td>密碼:
					<td><input type="password" name="password" id="password">
				<tr>
					<td>
					<td> <input type="submit" name="button" id="button" value="送出" />
			</table>
		
		</form>
			
	</div>

	<div data-role="footer" data-position="fixed" data-tap-toggle="false" >
		<table align=center>
			<tr>
				<td><h5><a href="../index.jsp" style="text-decoration:none;" data-ajax="false">首頁</a></h5>
		</table>
	</div>
</div>			


<script language="javascript">
$(document).ready(function(){
    $("#button").click(function(){
    	if($("#user").val()==""){
            alert("帳號未填寫");
            eval("document.form1['user'].focus()");  
           
    	 }else if($("#password").val()=="" ){
             alert("密碼未填寫");
             eval("document.form1['password'].focus()");   
			
       	 }else{
            document.form1.submit();
        }
    })
 })


</script>


</body>
</html>