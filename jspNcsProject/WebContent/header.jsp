<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="./resource/team05_style.css" type="text/css" rel="stylesheet"/>
<title>header</title>
<style>
	#header{
		width :1000px;
		border-collapse: collapse;

	}
	
	#header .title{
		font-size: 40px;
		
	}
	#header .tab{
		width :250px;
		background-color: rgb(139, 195, 74);
	}
	
</style>
</head>
<body>
	<table id="header">
		<tr>
			
			<td class="title" colspan="4">BEGIN VEGAN</td>
		<tr>
		<tr>
			<td>
			<td>
			<td>
			<%if(session.getAttribute("memId") == null){
			%>
			<td>
				<button onclick="window.location='/jnp/member/loginForm.jsp'">�α���</button>
				<button onclick="window.location='/jnp/member/signupForm.jsp'">ȸ������</button>
			</td>
			<%}else{%>
			<td>
				<button onclick="window.location='/jnp/member/logoutPro.jsp'">�α׾ƿ�</button>
				<button onclick="window.location='/jnp/member/myPage.jsp'">����������</button>
			</td>
			<%} %>
		</tr>
		<tr>
			<td class="tab" onclick="window.location='information.jsp'">ä������</td>
			<td class="tab" onclick="window.location='./recipe/recipeList.jsp'">������</td>
			<td class="tab" onclick="window.location='./product/productList.jsp'">��ǰ</td>
			<td class="tab" onclick="window.location='./freeboard/board.jsp'">�����Խ���</td>
		</tr>
		
	</table>

</body>
</html>