<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����Խ���</title>
</head>
<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum  = "1";
	}
	int pageSize= 10;
	int currPage = Integer.parseInt(pageNum);
	int startRow = (currPage-1)*pageSize+1;
	int endRow = currPage*pageSize;
	
	//�۰���
	int count = 0;
	//�Խ��� �� �۹�ȣ
	int number = 0;
	

%>
<body>
	<table>
		<tr>
			<td>
				<p>���� 550/1655<p>
			</td>
			<td colspan='3'></td>
			<td></td>	
			<td></td>	
		</tr>
			<td>[���Ӹ�]</td>
			<td>����</td>
			<td>�۾���</td>
			<td>��ȸ��</td>
			<td>��õ��</td>
		<tr>
	</table>
	

</body>
</html>