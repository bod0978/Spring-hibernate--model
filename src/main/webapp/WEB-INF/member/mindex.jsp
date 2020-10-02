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


<div data-role="page" id="pageone" data-theme="a" >
	<div data-role="header" data-position="fixed" data-tap-toggle="false" >
    	<h1 >精緻美食，美食天地</h1>
  	</div>
	
	<div data-role="main" class="ui-content" >		
    	<table border=0 width=100%  bgcolor="#FFFFFF" height="450" >
    		<tr>
    			<td align="left" align=center width=25% height=450><img alt="" src="../pci/output_7.gif">
    		
    			<td>
    			<form id= "form1" name="form1" method="post" action="../mem/login" onclick="return false">
					<table align=center border=0>
						<tr>
							<td colspan=2 align=center><h1>會員登入</h1>
						<tr>
							<td colspan=2>
							<hr>
						<tr>
    						<td>帳號:
    						<td><input type="text" name="user" id="user" >
    					<tr>
    						<td>密碼:
    						<td><input type="password" name="password" id="password" >
						<!--tr>
							<td>驗證碼：
							<td><input type="text" name="checknum" id="checknum">
					 	< tr>
					 		<td>
					 		<td  bgcolor="#CCCCCC">
					 		<img src="http://www.goldenjade.com.tw/captchaCheck/check/showrandimg.php" id="rand-img" name="chceknum2">
					 	<tr>
					 		<td>
					 		<td align=center> ( <a href="#" id="reload-img" style="text-decoration:none;">重新產生</a> )  --> 
					  	<tr>				
					    	<td>
					    	<td><input type="submit" name="button" id="button" value="送出" /> 
					  	<tr>
					  		<td colspan=2><hr>
						<tr>			
					    	<td colspan=2 align=center><!-- a href="../mem/addm" style="text-decoration:none;" data-ajax="false" onclick="return true">註冊</a-->
					    	<input type="button" value="會員註冊" onclick="location.href='../mem/addm'">
					  </table>
				</form>
    				<tr>
    					<td>
    				
					   
    	</table>
  	</div>

	<div data-role="footer" data-position="fixed" data-tap-toggle="false" >
    	<h4>地址:XX市XX區OO路XX號3樓</h4>
    	<h4>電話:02-OOOOXXOX
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
          
    	 /*}else if($("#checknum").val()=="" ){
             alert("驗證碼未輸入");
             eval("document.form1['checknum'].focus()");  
    	 }else if($("#checknum").val()!=($("#checknum2").val() ){
             alert("驗證碼錯誤");
             eval("document.form1['checknum'].focus()");      */
       	 }else{
            document.form1.submit();
        }
    })
 })


</script>


</body>
</html>