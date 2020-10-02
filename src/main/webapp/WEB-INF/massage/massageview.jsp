<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

</head>
<body  background="../pci/bg_img01.png"> 			

<div data-role="page" id="pageone" data-theme="a">
	<div data-role="header" data-position="fixed" data-tap-toggle="false" >
    	<h1 >精緻美食，美食天地</h1>
  	</div>
	
	<div data-role="main" class="ui-content" >
	
	<table align=center border=0 width=100% >
		<tr>
			<td valign="top" align=center width=30% ><img alt="" src="../pci/92.jpg">
   			
   			<td valign="top" >
			    <form id="form1" name="form1" action="../massage/send" method="post" onclick="return false">
			    	<table border=0 width=100% height="480px" align=center  background="../pci/bg_img01.png">
			    		<tr>
			    			<td valign="top" colspan=5><h1>CONTACT US<sub>意見回饋</sub></h1>
			    		<tr>
			    			<td valign="top"  colspan=5 align=center><h4>如果您有任何意見、需求，歡迎與我們聯絡</h4>
			    			<hr>
			    		<tr>
			    			
			    			<td align=center width=20%>
			    				<label for="type"><font color="red">*</font>類型</label>
							
							<td width=30%>        
						        <select name="type" id="type" align=center>
							         <option value="詢問">詢問</option>
							         <option value="申告">申訴</option>
							         <option value="建議">建議</option>
							         <option value="其他">其它</option>
						    	</select>
							   
			    		<tr>
			    			<td  align=center width=20%><font color="red">*</font>姓名:
			    			<td width=30%><input type="text" name="name" id="name">
			    			<td  align=center width=20%><font color="red">*</font>性別:
			    			<td width=30%> <select name="sex"  align=center>
							         <option value="男">男</option>
							         <option value="女">女</option>  
						    	</select>
			    		<tr>
			    			<td  align=center><font color="red">*</font>聯絡電話:
			    			<td><input type="tel" name="phone" id="phone" 
							       class="form-control match-rotation-input"
							      	 maxlength="14"
							       onkeyup="value=value.replace(/[^\d]/g,'')"     
							       onblur="value=value.replace(/[^\d]/g,'')"
							       ng-model="schedule.round">

			    			<td  align=center ><font color="red">*</font>Email:
			    			<td ><input type="email" name="mail" size="35" id="mail">
			    			
			    		<tr>
			    			<td colspan=4 align=center><font color="red">*</font>留言內容:
			    		<tr>	
			    			<td  colspan=4 ><textarea rows="10" cols="15" id="note" name="note" placeholder="請輸入內容....."></textarea>
			    		
			    		<tr>
			    			<td>
			    			<td align=center ><input type="submit" name="button" id="button"  value="送出" />
			    			<td>
			    			<td align=center ><!-- a href="../mem/index" style="text-decoration:none;" data-ajax="false" ><h4>回首頁</h4></a-->									
			    			<input type="button" value="回首頁" onclick="location.href='../mem/index'">
			    	</table>
	   			</form>
  		</table>
  	</div>

	<div data-role="footer" data-position="fixed" data-tap-toggle="false" >
    	<h4>地址:XX市XX區OO路XX號3樓</h4>
    	<h4>電話:02-OOOOXXOX
  </div>    			
    			
</div> 			


<script>
 $(document).ready(function(){
    $("#button").click(function(){
    	if($("#name").val()=="" ){
             alert("您的姓名未填寫");
             eval("document.form1['name'].focus()");   
    	 }else if($("#phone").val() == ""){
    		 alert("您的電話未填寫");
             eval("document.form1['phone'].focus()");   
       	 }else if($("#mail").val()=="" ){
            alert("您的mail未填寫");
            eval("document.form1['mail'].focus()");   
       	 }else if($("#note").val()==""){
                alert("您還沒有留言唷!");
                eval("document.form1['note'].focus()");   
       	 }else{
            document.form1.submit();
        }
    })
 })
 
 
</script>


		
</body>
</html>