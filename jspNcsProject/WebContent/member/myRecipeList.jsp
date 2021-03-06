<%@page import="java.util.List"%>
<%@page import="jspNcsProject.dto.RecipeDTO"%>
<%@page import="jspNcsProject.dao.RecipeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myRecipeList</title>
<link href="../resource/team05_style.css" type="text/css" rel="stylesheet"/>
</head>

<%
	request.setCharacterEncoding("UTF-8");
	RecipeDAO dao = RecipeDAO.getInstance();
	RecipeDTO dto = new RecipeDTO();
	String memId = (String)session.getAttribute("memId");
	
	
	
	int pageSize = 3; // 한 페이지에서 보여줄 게시글의 수
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){ // 처음 페이지를 킨 경우 null 값이 들어가니까 이 경우엔 pageNum에 1을 넣어줌 
		pageNum ="1";
	}
	
	int currPage = Integer.parseInt(pageNum);
	int startRow = (currPage - 1) * pageSize + 1;
	int endRow = currPage * pageSize;
	
	int count = 0;
	
	// 게시판에서 글 가져오기 
	count = dao.getMyRecipeCount(memId);
	// 내가 쓴 글 전체 개수부터 가져오기
	List myRecipeList = null;
	if(count > 0){// 글이 하나라도 있으면 가져오기 
		myRecipeList  = dao.selectMyRecipe(startRow, endRow, memId);
	}
	
	
	if(memId == null){ %>
		<script>
			alert("로그인 후 이용하세요");
			window.location="loginForm.jsp";
		</script>
	<% }else{	
%>
<%-- 게시판 형태 만들기 --%>
<body>
<h3> [레시피 게시판] </h3>
	<%-- 게시글이 없을 때 --%>
	<% if(count == 0){%>
		<table>
			<tr>
				<td>
					게시글이 없습니다.
				</td>
			</tr>
		</table>	
	<%
	}else{ %>
	<% for(int i = 0 ; i < myRecipeList.size(); i++){
		dto =(RecipeDTO)myRecipeList.get(i);
	%>
	<div class="recipe" onclick="location.href='../recipe/recipeContent.jsp?num=<%= dto.getNum()%>'">

	<table style="width:800">

		<tr>
			<td rowspan="4" width="150px">
				<img src="../recipe/imgs/<%= dto.getThumbnail() %>" width="150px" height="150px"/>
			</td>

			<td colspan="5" width="650px;">

				제목 : <%= dto.getRecipeName() %>
			</td>
		</tr>
		<tr>

			<td colspan="5"> 
			평점 : <%= dto.getRating() %>

			</td>		
		</tr>
		<tr>
			<td>채식유형 : <%= dto.getVegiType() %></td>
			<td>난이도 : <%= dto.getDifficulty() %></td>
			<td>조리시간 : <%= dto.getCookingTime() %>분</td>	
			<td>분량 : <%= dto.getQuantity() %>인분</td>	
			<td>칼로리 : <%= dto.getCal() %>Cal</td>				
		</tr>
		<tr>

			<td colspan="5" style="height:auto; border-bottom:1px solid black">
			<%
				String ingredients = dto.getIngredients();
			%>
			주재료 : <%= ingredients.substring(1, ingredients.length()-1) %>

			</td>		
		</tr>
	</table>
	</div>
	<%}
	%>
	<%} %>
	<br />
	<div align="center">
	<%-- 게시판 목록 페이지 번호 뷰어 설정 --%>
	<%
		if(count > 0){ // if1. 게시글이 있을 때만 보여줄 것임 
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int pageBlock = 10;
			int startPage = (int)((currPage-1)/pageBlock)*pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if(endPage > pageCount){endPage = pageCount;}
			if(startPage > pageBlock){ %>
				<a href="myList.jsp?pageNum=<%= startPage-pageBlock%>"> &lt; </a>
			<%}
			// 페이지 번호 뿌려주기
			for(int i = startPage; i <= endPage; i++){ %>
				<a href="myList.jsp?pageNum=<%=i%>" class="pageNums"> &nbsp; <%=i %> &nbsp; </a>
			<%}
			if(endPage < pageCount){ %>
				<a href="myList.jsp?pageNum=<%=startPage+pageBlock%>"> &gt; </a>
			<%}
		
		} // if1 끝
	
	%>
	</div>
</body>
	<%} %>
</html>