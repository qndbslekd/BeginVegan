<%@page import="jspNcsProject.dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="jspNcsProject.dao.MemberDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="../team05_style.css" rel="stylesheet" type="text/css">
</head>
<jsp:include page="../header.jsp"></jsp:include>
<%
	if(!session.getAttribute("memId").toString().equals("admin")){%>
		<script>
			alert("관리자 페이지 입니다.");
			window.location="main.jsp";
		</script>
	<%}else{
		
		int pageSize=10;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null){
			pageNum = "1";
		}
		
		int currPage = Integer.parseInt(pageNum);
		int startRow = (currPage -1) * pageSize + 1;
		System.out.println(startRow);
		int endRow = currPage * pageSize;
		System.out.println(endRow);
		int count = 0;
		int number = 0;
		
		MemberDAO dao = MemberDAO.getInstance();
		count = dao.selectAllMember();
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		if(count > 0){
			memberList = dao.getSearchMemberList(startRow, endRow);
		}
		System.out.println("LIST SIZE : "+memberList.size());
	%>

<body>
	<br/>
	<h1 align="center"> 회원목록 </h1>
	<%if(count == 0){ %>
		<table>
			<tr>
				<td> 가입한 회원이 없습니다.</td>
			</tr>
			<tr>
				<td><button onclick="window.location='main.jsp'">메인으로</button></td>
			</tr>				
		</table>
	<%}else{ %>
		<table>
			<tr>
				<td> 회원 ID </td>
				<td> PW </td>
				<td> 생년월일 </td>
				<td> 성별 </td>
				<td> 닉네임 </td>
				<td> 가입일 </td>
				<td> 신고누적횟수</td>
				<td> 신고당한 게시글</td>
				<td> 활동상태 </td>
				<td> 강퇴 </td>
			</tr>
			<%for(int i =0;i<memberList.size();i++){%>
			<tr>
				<td><%=memberList.get(i).getId()%></td>
				<td><%=memberList.get(i).getPw()%></td>
				<td><%=memberList.get(i).getAge()%></td>
				<td><%=memberList.get(i).getGender()%></td>
				<td><%=memberList.get(i).getName()%></td>
				<td><%=memberList.get(i).getRegdate()%></td>
				<td><%=memberList.get(i).getOffence_count()%></td>
				<td><%=memberList.get(i).getOffence_url()%></td> 
				<td><%=memberList.get(i).getState()%></td>
				<td><button onclick="window.location='memberKickOutPro.jsp'" >강퇴</button></td>
			</tr>
			<%} %>
			<tr>
				<td><button onclick="window.location='main.jsp'">메인으로</button></td>
			</tr>				
		</table>	
	<%} %>
</body>
<%}%>
</html>