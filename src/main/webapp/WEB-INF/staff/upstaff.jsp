<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="Model.staff"%>
<!DOCTYPE html>
<%
	staff sf = (staff) session.getAttribute("STAFF");
	staff sf2 = (staff) session.getAttribute("STA");
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
		<table width=80% border=1 align=center >
			<tr>
				<td align=center width=20%><a href="../staff/mem" style="text-decoration:none;" data-ajax="false"><h5>員工管理</h5></a>
				<br>
					<a href="../staff/mass" style="text-decoration:none;" data-ajax="false"><h5>訊息管理</h5></a>
				<br>
					<a href="../staff/food" style="text-decoration:none;" data-ajax="false"><h5>菜色管理</h5></a>
				<br>
					<a href="../staff/ord" style="text-decoration:none;" data-ajax="false"><h5>訂位管理</h5></a>
				<br>
					<a href="../staff/index" style="text-decoration:none;" data-ajax="false"><h5>登出</h5></a>
				<td align=center >
				<form action="../staff/upstaffok" method="post">
					<table align=cetner border=0 >
						<tr>
							<td>員工姓名:
							<td><input type="text" name="name" value=<%=sf2.getName() %>>
						
							<td>員工帳號:
							<td><input type="text" name="user" value=<%=sf2.getUser() %> disabled="disabled" >
						
						<tr>
							<td>密碼:
							<td><input type="password" name="password" value=<%=sf2.getPassword() %>>
						
							<%
								if(sf2.getBody() == null){
									java.util.Date d=new java.util.Date();  
									
									sf2.setBody(new java.sql.Date(d.getTime()));
								}
							
							%>
							<td>生日:
							<td><input type="text" name="body"  id="body" value=<%=sf2.getBody() %> >
						
						<tr>
							<%
								if(sf2.getWorking() == null){
									java.util.Date d=new java.util.Date();  
									
									sf2.setWorking(new java.sql.Date(d.getTime()));
								}
							
							%>
							
							<td>員工到職日:
							<td><input type="text" name="work" id="work" value=<%=sf2.getWorking() %> disabled="disabled" >	
						
							<td>電話:
							<td><input type="tel" name="phone" value=<%=sf2.getPhone() %>>
						
						<tr>
							<td>地址:
							<td><input type="text" name="address" value=<%=sf2.getAddress() %>>	
						
							<td>mail:
							<td><input type="email" name="mail" value=<%=sf2.getMail() %>>
						
						<tr>
							<td>帳號權限:
							<td>
								<select name="type" id="type">
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
							<td>
							<td><input type="button" value="取消" onclick="location.href='../staff/upsee' ">
							<td >
							<td ><input type="submit" value="存檔" >
					
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