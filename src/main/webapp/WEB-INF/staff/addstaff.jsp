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

<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">
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
					<br>
						<a href="../staff/mass" style="text-decoration:none;" data-ajax="false"><h5>訊息管理</h5></a>
					<br>
						<a href="../staff/food" style="text-decoration:none;" data-ajax="false"><h5>菜色管理</h5></a>
					<br>
						<a href="../staff/ord" style="text-decoration:none;" data-ajax="false"><h5>訂位管理</h5></a>
					<br>
						<a href="../staff/index" style="text-decoration:none;" data-ajax="false"><h5>登出</h5></a>
					<td align=center >
					
			<form action="../staff/staffcheck" method="post" name="form1" id="form1" onclick="return false">		
				<table  border=0  align="left">
					<tr>
						<td colspan=4 align=center>	<h3>新增員工登入系統</h3>
					<tr>
						<td>員工姓名:
						<td width=200px><input type="text" name="name" id="name">
					
						<td>員工帳號:
						<td width=200px><input type="text" name="user" id="user">
					
					<tr>
						<td>密碼:
						<td><input type="password" name="password" id="password">
					
						<td>生日:
						<td><input type="text" name="body"  id="body">
					
					<tr>
						<td>員工到職日:
						<td><input type="text" name="work" id="work">	
					
						<td>電話:
						<td><input type="tel" name="phone" >
					
					<tr>
						<td>地址:
						<td><input type="text" name="address" >	
					
						<td width=100px >mail:
						<td><input type="email" name="mail" >
					
					<tr>
						<td>帳號權限:
						<td>
							<select name="type" id="type" >
								<option value="0">職員</option>
						   		<option value="1">主管</option>
						    </select>
					
					     <!--   <label for="true">主管</label>
					        <input type="radio" name="type" id="true" value="true" >
						<td>
							
						<td><label for="false">職員</label>
						    <input type="radio" name="type" id="false" value="false" checked>
					     -->
					
					<tr>
						<td width=100px><input type="submit" value="存檔" name="button" id="button">
				
				</table>
			</form>		
		</table>
		
		
	</div>

	<div data-role="footer" data-position="fixed" data-tap-toggle="false" >
		<table align=center>
			<tr>
				<td><h5><a href="../staff/sel" style="text-decoration:none;" data-ajax="false">登入</a></h5>
		</table>
	</div>
</div>			


<script>
$(document).ready(function(){
    $("#button").click(function(){	
    	var id_check=/[^a-zA-Z0-9]/g;
    	if($("#name").val()==""){
            alert("姓名未填寫");
            eval("document.form1['name'].focus()");     
    	 }else if ($("#name").val().indexOf(' ')>=0){
             alert("請不要在姓名欄位中使用空格!!");
             eval("document.form1['name'].focus()");  
     /*  }
    	 else if ($("#name").val().match(id_check)){
             alert("請不要使用非英文字!!");
             eval("document.form1['name'].focus()");*/   
             
         }else if($("#user").val()==""){
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
    	 }else if($("#body").val()==""){
    		 alert("請填寫您的生日");
             eval("document.form1['body'].focus()");                    
       	 }else if($("#work").val()=="" ){
            alert("請確實填寫到職日");
            eval("document.form1['work'].focus()");    
       	 }else{
       		document.form1.submit();
        }
    })
 })





//時間
$(function() {
    $( "#body" ).datepicker({
   	 	dateFormat:"yy-mm-dd",
   	 	yearRange:"-50:+0",
    	changeMonth: true,
     	changeYear:  true,
     	defaultDate:(new Date(new Date().getFullYear()-20+"/01/01")-new Date())/(1000*60*60*24),
     	maxDate:new Date()
    });
  });


$(function() {
    $( "#work" ).datepicker({
   	 	dateFormat:"yy-mm-dd",
   	 	//yearRange:"-10:+0",
    	changeMonth: true,
     	changeYear:  true,
     	//defaultDate:(new Date(new Date().getFullYear()-10+"/01/01")-new Date())/(1000*60*60*24),
     	// maxDate:new Date()
    	defaultDate:new Date()
    });
  });
</script>
</body>
</html>