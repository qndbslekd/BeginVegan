<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="../resource/team05_style.css" type="text/css" rel="stylesheet"/>
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
	a:link {
		text-decoration: none;
		color: #ffff;
	}
	a:visited {
	text-decoration: none;
		color: #ffff;
	}
	a:hover {
	text-decoration: underline;
		color: #559AFC;
	}
</style>
</head> 
<%
	System.out.println("===HEADER START===");
	System.out.println("Header Session�� : "+session.getAttribute("memId"));
	if(session.getAttribute("memId")==null){ //��α��λ���(���Ǿ�����)
		// ������ ������ ��Ű�� �ִ��� 2�� üũ
		String id = null, pw = null, auto = "n",name = null; 
		Cookie[] cookies = request.getCookies();
		if(cookies !=null){ 
			for(Cookie cookie : cookies){
				System.out.println("Cookie Null Test :"+cookie.getName());
				if(cookie.getName().equals("autoId")){
					id = cookie.getValue();
					System.out.println("��Ű ���̵� :"+id);
					}		
				if(cookie.getName().equals("autoPw")){
					pw = cookie.getValue();
					System.out.println("��Ű pw :"+pw);
					}		
				if(cookie.getName().equals("autoCh")) {
					auto = cookie.getValue();
					System.out.println("��Ű auto :"+auto);
					}
				if(cookie.getName().equals("autoName")) {
					name = cookie.getValue();
					System.out.println("��Ű name :"+name);
					}	
			}
		} 
		if(auto.equals("y")&&id!=null&&pw!=null){
			System.out.println("loginPro Header Redirect TEST2 : session = cookie ");
			session.setAttribute("memId", id);
		}
		System.out.println("===HEADER END===");
	}
%>
<body>
	<table id="header">
		<tr>
			
			<td class="title" colspan="4"><a href="/jnp/member/main.jsp">BEGIN VEGAN</a></td>
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
			<td class="tab" onclick="window.location='/jnp/information/information.jsp'">ä������</td>
			<td class="tab" oncllick="window.location='/jnp/recipe/recipeList.jsp'">������</td>
			<td class="tab" oncllick="window.location='/jnp/product/productList.jsp'">��ǰ</td>
			<td class="tab" oncllick="window.location='/jnp/freeboard/board.jsp'">�����Խ���</td>
		</tr>
		
	</table>

</body>
</html>