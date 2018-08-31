<%@ page language="java" contentType="text/html; charset = ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link href="${pageContext.request.contextPath}/style/UserManagement.css" rel="stylesheet" type="text/css">

<!-- AJAX call to filter based on the selected user name from drop down. -->
<script type="text/javascript">
	function callMyAction() {
		$.ajax({
			type : "POST",
			url : "filterUsers",
		});
	}
</script>
</head>

<sx:head/>

<body>
	<h1>User Management</h1>	
	<form action="filterUsers">
		
		<!-- Filter Based on userName. -->
		<s:select label="User Name New" list="userNames" name="userName"></s:select>
		
		<input type="submit" value="Filter" onclick="callMyAction()"> 
		<input type="button" value="Back" onclick="javascript:history.go(-1)">
		        
		<br><br>
		<!-- On Page Load, make a call to UserManagementRestWebService and display a list of users with a the below listed attributes in a data table. -->
		<table border="1px" cellspacing="0">
			<thead>
				<tr>
					<th>Id</th>
					<th>User Name</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Full Name</th>
					<th>Role</th>
					<th>Status</th>
				</tr>
			</thead>
			<s:iterator status="stat" value="userList">
				<tr>
					<td><s:property value="userId" /></td>
					<td><s:property value="userName" /></td>
					<td><s:property value="firstName" /></td>
					<td><s:property value="lastName" /></td>
					<td><s:property value="fullName" /></td>
					<td><s:property value="role" /></td>
					<td><s:property value="status" /></td>
				</tr>
			</s:iterator>
		</table>
	</form>
</body>
</html>