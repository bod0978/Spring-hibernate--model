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
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">
</head>
<body>

<div data-role="page" id="pageone" data-theme="a" >
	<div data-role="header" data-position="fixed" data-tap-toggle="false" >
    	<h1 >精緻美食，美食天地</h1>
  	</div>
	
	<div data-role="main" class="ui-content" >	
	<form id="form1" name="form1" method="post" action="../mem/update" onclick="return false">	
	   	<table border=0 width=70%  bgcolor="#FFFFFF" height="450" align=center>
			<tr align=center>
				<td>帳號:
				<td><input type="text" name="user" id="user" disabled="disabled" value=<%=m.getUser() %>>
				<td>
		 		<td>名稱:
		 		<td><input type="text" name="name" id="name" value=<%=m.getName() %>>	
		 		
			<tr align=center>
				<td><label for="password"><font color="red">*</font>密碼:</label>
					
					<td><input type="text" name="password" id="password" value=<%=m.getPassword() %>>
					<td><img id="demo_img" onclick="hideShowPsw()" src="../pci/invisible.png" alt="(顯示密碼 )">
					

				<td><font color="red">*</font>生日:
				<td><input type="text" id="body" name="body" value=<%=m.getBady() %>>
				
		 	
		 	<tr align=center>
		 		<td><label for="password"><font color="red">*</font>密碼確認:	</label>
				<td><input type="password" name="password_again" id="password2" class="left">
				<td>	
		 		<td>電話:
		 		<td><input type="tel" name="phone" id="phone" 
				       class="form-control match-rotation-input"
				      	 maxlength="14"
				       onkeyup="value=value.replace(/[^\d]/g,'')"     
				       onblur="value=value.replace(/[^\d]/g,'')"
				       ng-model="schedule.round" value=<%=m.getPhone() %>>

		 		
		 	<tr align=center>
		 		<td>地址:		
		 		<td><input type="text" name="address" id="address" value=<%=m.getAddress() %>>	
		 		<td>
		
		 		<td>性別:
		 		<td>
		 			<fieldset data-role="controlgroup" data-type="horizontal">
		 				<% if(m.getSex().equals("男")){ %>
		 						<label for="male">男性</label>
		 						<input type="radio" name="sex" id="male" value="男" checked>
		 						<label for="female">女性</label>
					        	<input type="radio" name="sex" id="female" value="女" > 
		 					<% }else if (m.getSex().equals("女")){ %>
		 						<label for="male">男性</label>
		 						<input type="radio" name="sex" id="male" value="男" >
		 						<label for="female">女性</label>
					        	<input type="radio" name="sex" id="female" value="女" checked > 
		 					<%	} %>
			     	 </fieldset>
		 		<!-- td>驗證碼：
				<td><input type="text" name="checknum" id="checknum" -->
		 		
		 	
		 	<tr align=center>
				<td>Email:
		 		<td><input type="email"	name="mail" id="mail" value=<%=m.getMail() %>>
		 		<td>
		 		<td>
		 		<!--td  bgcolor="#CCCCCC">
		 		<img src="http://www.goldenjade.com.tw/captchaCheck/check/showrandimg.php" id="rand-img"-->
		 	
			    <td> 	 
		 		<td>
		 		<!-- td align=center> ( <a href="#" id="reload-img" style="text-decoration:none;">重新產生</a> )--> 
		  	<tr align=center>				
		    	<td>
		    	<td><input type="button" onclick="myFunction()" value="清除">
		    	<td> 
		    	<td>
		    	<td> <input type="submit" name="button" id="button" value="送出" / >
    		</table>
    	</form>
  	</div>

	<div data-role="footer" data-position="fixed" data-tap-toggle="false" >
    	<h4>地址:XX市XX區OO路XX號3樓</h4>
    	<h4>電話:02-OOOOXXOX
  </div>
</div> 

<script src="../validate.min.js"></script>
<script>
//時間
$(function() {
    $( "#body" ).datepicker({
   	 	dateFormat:"yy-mm-dd",
   	 	yearRange:"-70:+0",
    	changeMonth: true,
     	changeYear:  true,
     	defaultDate:(new Date(new Date().getFullYear()-20+"/01/01")-new Date())/(1000*60*60*24),
     	maxDate:new Date()
    });
  });

//清除表單
function myFunction() {
  document.getElementById("form1").reset();
}

//判斷欄位
$(document).ready(function(){
    $("#button").click(function(){	
    	var id_check=/[^a-zA-Z0-9]/g;
    	if($("#user").val()==""){
            alert("帳號未填寫");
            eval("document.form1['user'].focus()");     
    	 }else if ($("#user").val().indexOf(' ')>=0){
             alert("請不要在帳號中使用空格!!");
             eval("document.form1['user'].focus()");  
         }else if ($("#user").val().match(id_check)){
             alert("請不要使用非英文字當做帳號名稱!!");
             eval("document.form1['user'].focus()");          
    	}else if($("#password").val()=="" ){
             alert("密碼未填寫");
             eval("document.form1['password'].focus()");  
    	 }else if($('#password').val().length <= 5  ){
    		 alert("密碼長度不可少於6位數字");
             eval("document.form1['password2'].focus()");          
    	 }else if($("#password").val()!= $("#password2").val()){
    		 alert("請再輸入一次密碼");
             eval("document.form1['password2'].focus()");    
    	 }else if($("#body").val()==""){
    		 alert("請填寫您的生日");
             eval("document.form1['body'].focus()");                    
       	 }else if($("#phone").val()=="" ){
            alert("你尚未填寫電話");
            eval("document.form1['phone'].focus()");    
       	 }else{
       		document.form1.submit();
        }
    })
   // setTimeout( "self.location.reload(); ",1000);
 })
 
// 密碼欄位顯示告警
jQuery.validator.setDefaults({
  debug: true,
  success: "valid"
});
$( "#form1" ).validate({
  rules: {
    password: "required",
    password_again: {
      equalTo: "#password"
    }
  }
});
 

// 這里使用最原始的js語法實現，可對應換成jquery語法進行邏輯控制
var demoImg = document.getElementById("demo_img");
var demoInput = document.getElementById("password");
   //隱藏text block，顯示password block
function hideShowPsw(){
	if (demoInput.type == "password") {
		demoInput.type = "text";
		demo_img.src = "../pci/invisible.png";
	}else {
		demoInput.type = "password";
		demo_img.src = "../pci/visible.png";
	}
}

</script>

 <script type="text/javascript"> 
$(document).ready(function(){
	var id_check=/[^a-zA-Z0-9]/g;
	$("#user").blur(function(){
		var user = {user:$("#user").val()};
		$.ajax({
			url:"http://localhost:8080/Lood/index/ajax",
			data:user,
			async:true,
			type:"POST",
			dataType:"html",
			success:function(result){
				$("#msg").html(result); 
			}
		});  
	}); 
})  
</script>

</body>
</html>
