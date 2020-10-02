<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="Model.staff"
    import="Dao.sendMailDao"
    import="Model.sendmail"
    import="java.util.List"%>
<!DOCTYPE html>
<%
	staff sf = (staff) session.getAttribute("STAFF");
	List l = new sendMailDao().query();
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
		<table width=100% border=0  valign="top">
			<tr>
				<td align=center width=30%><a href="../staff/mem" style="text-decoration:none;" data-ajax="false"><h5>員工管理</h5></a>
					<br><a href="../staff/mass" style="text-decoration:none;" data-ajax="false"><h5>訊息管理</h5></a>
					<br><a href="../staff/food" style="text-decoration:none;" data-ajax="false"><h5>菜色管理</h5></a>
					<br><a href="../staff/ord" style="text-decoration:none;" data-ajax="false"><h5>訂位管理</h5></a>
					<br><a href="../staff/index" style="text-decoration:none;" data-ajax="false"><h5>登出</h5></a>
				<td>
				<table align="left" broder=1 >
					<tr align=center>
						<td>編號<td>申告類型<td>申告者姓名<td>申告者Mail<td>留言內容<td>留言時間
					<%
						String Note = "";
						//java.text.SimpleDateFormat sdFormat = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
						
						for(int i=0;i<o.length;i++){
							sendmail sd = (sendmail)o[i];
							
							//System.out.println(sdFormat.format(sd.getPdate())+" = "+sd.getPdate() );
							
							//String dt = sdFormat.format(sd.getPdate());
							
							if(sd.getNote().length() > 10){
								Note =sd.getNote().substring(0, 10)+"......";
							}else
							{
								Note = sd.getNote();
							}
							
							out.println("<tr align=center><td>"+sd.getId()+"<td>"+sd.getSub()+"<td>"+sd.getName()+"<td>"+sd.getMail()+"<td>"+Note+"<td>"+sd.getPdate()+"<br>");
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
