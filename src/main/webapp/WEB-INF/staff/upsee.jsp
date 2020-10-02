<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="Model.staff"
    import="Dao.staffDao"
    import="java.util.List"%>
<!DOCTYPE html>
<%
	staff sf = (staff) session.getAttribute("STAFF");
	
	List l = new staffDao().query();
	Object o [] = l.toArray();
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
		<table width=100% border=0 align=center >
			<tr  valign="top">
				<td align=center width=30%><a href="../staff/mem" style="text-decoration:none;" data-ajax="false"><h5>員工管理</h5></a>
				<br>
					<a href="../staff/mass" style="text-decoration:none;" data-ajax="false"><h5>訊息管理</h5></a>
				<br>
					<a href="../staff/food" style="text-decoration:none;" data-ajax="false"><h5>菜色管理</h5></a>
				<br>
					<a href="../staff/ord" style="text-decoration:none;" data-ajax="false"><h5>訂位管理</h5></a>
				<br>
					<a href="../staff/index" style="text-decoration:none;" data-ajax="false"><h5>登出</h5></a>
				
				<td >
				
				<table align="left" border=1  style="line-height:40px;">
					<tr align=center>
						<td>編號<td>名稱<td>帳號<td>電話<td>地址<td>職員生日<td>到職日<td>目前權限<td>資料更新<td>會員刪除
					<!-- <tr>
						<td colspan="10"><hr>	-->
					<%
						String type ;
						for(int i=0;i< o.length;i++){
							staff sf2 = (staff)o[i];
							if(sf2.getType() == true){
								type = "管理者";
							}else{
								type="使用者";
							}
							
							out.println("<tr align=center>"
										+"<td>"+sf2.getId()+"<td>"+sf2.getName()+"<td>"+sf2.getUser()
										+"<td>"+sf2.getPhone()+"<td>"+sf2.getAddress()+"<td>"+sf2.getBody()
										+"<td>"+sf2.getWorking()+"<td>"+type
										+"<td><input type=\"button\" value=\"更新\" onclick=\"location.href='../staff/upstaff?id="+sf2.getId()+"' \">"
										+"<td><input type=\"button\" value=\"刪除\" onclick=\"location.href='../staff/delstaff?id="+sf2.getId()+"' \">"
										);
										//+"<tr><td colspan=10><hr>");							
						}

					%>

				</table>
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