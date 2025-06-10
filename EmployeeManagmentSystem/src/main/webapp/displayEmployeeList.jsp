<%@page import="java.util.ArrayList"%>
<%@page import="employee.employees.assets.EmployeeBean"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Management</title>

<!-- CSS inside head tag -->
<style>
/* General Reset */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Arial', sans-serif;
}

body {
	background-color: #f4f7fa;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

/* Main Container */
.container {
	width: 80%;
	max-width: 1000px;
	background-color: #fff;
	border-radius: 12px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

/* Header Section */
.header {
	background-color: #4a90e2;
	color: #fff;
	padding: 15px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.admin-profile {
	display: flex;
	align-items: center;
}

.admin-profile img {
	width: 45px;
	height: 45px;
	border-radius: 50%;
	border: 2px solid #fff;
	margin-right: 10px;
}

.admin-name {
	font-size: 16px;
	font-weight: bold;
}

/* Top Buttons */
.top-buttons button {
	padding: 8px 15px;
	background-color: #357abd;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-left: 10px;
}

.top-buttons button:hover {
	background-color: #2d6eb5;
}

/* Main Content */
.content {
    display: flex;
    height: 550px;
    overflow: hidden; /* Prevents content overflow */
}

/* Employee List Section */
.employee-list {
	width: 35%;
	background-color: #4a90e2;
	color: #fff;
	padding: 20px;
	overflow-y: auto;
	max-height: 100%; /* Ensures it takes full height */
}

.employee-list h3 {
	margin-bottom: 15px;
	font-size: 18px;
}

/* List Styles */
#empList {
	list-style: none;
}

#empList li {
	width: 100%;
	background-color: #357abd;
	padding: 12px 15px;
	margin-bottom: 10px;
	border-radius: 8px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

#empList li:hover {
	background-color: #2d6eb5;
}

/* Action Buttons */
.action-btns {
	width: 100%;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.action-btns>h3 {
	width: 50%;
}

.list-btn {
	width: 50%;
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

.action-btns button {
	padding: 5px 8px;
	background-color: #f39c12;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-left: 5px;
	font-size: 12px;
}

.action-btns button.delete-btn {
	background-color: #e74c3c;
}

.action-btns button:hover {
	opacity: 0.9;
}

/* Employee Details Section */
.employee-details {
	width: 65%;
	padding: 20px;
	overflow-y: auto;
}

/* Profile Section */
.profile-section {
	display: flex;
	justify-content: center;
	margin-bottom: 20px;
}

.profile-section img {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	border: 3px solid #4a90e2;
}

/* Info Section */
.info-section {
	background-color: #f4f7fa;
	padding: 15px;
	border-radius: 8px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
}

.info-section p {
	margin-bottom: 10px;
	font-size: 14px;
	color: #333;
}

.info-section span {
	color: #4a90e2;
	font-weight: bold;
}

/* Responsive Design */
@media ( max-width : 768px) {
	.content {
		flex-direction: column;
		height: auto;
	}
	
	.employee-list {
        width: 100%;
        height: 300px;
        overflow-y: scroll;
        padding: 0px 12px;
    }
	
	#empList li {
    width: 74vw;
    }
	
	.employee-details {
		width: 100%;
	}
	.header {
		flex-direction: column;
		align-items: flex-start;
	}
	.top-buttons {
		margin-top: 10px;
	}
}
</style>
</head>
<body>

	<!-- Main Container -->
	<div class="container">

		<!-- Header Section -->
		<div class="header">

			<!-- Admin Profile Section -->
			<div class="admin-profile">
				<img width="48" height="48" src="https://img.icons8.com/color/48/admin-settings-male.png" alt="admin-settings-male"/>
					<span class="admin-name"><%= request.getSession(false).getAttribute("adminName") %>
					</span>
			</div>

			<!-- Add Employee and Logout Buttons -->
			<div class="top-buttons">
				<button onclick="window.location.href = 'adminHome.jsp'">Home</button>
				<button onclick="addEmployee()">Add Employee</button>
				<button onclick="logout()">Logout</button>
			</div>
		</div>

		<!-- Main Content -->
		<div class="content">

			<!-- Left Side: Employee List -->
			<div class="employee-list">
				<h3>Employee List</h3>
				<ul id="empList">
					<%
					ArrayList<EmployeeBean> empList = (ArrayList<EmployeeBean>) session.getAttribute("employeeList");

					if (empList != null && !empList.isEmpty()) {
						for (EmployeeBean emp : empList) {
					%>
					<li
						onclick="showEmployeeDetails('<%=emp.getEmpId()%>', '<%=emp.getEmpName()%>', '<%=emp.getEmpDepartment()%>', '<%=emp.getEmpDesignation()%>', '<%=emp.getEmpDOJ()%>')">
						<div class="action-btns">
							<h3><%=emp.getEmpName()%></h3>
							<div class="list-btn">
								<button onclick="editEmployee('<%=emp.getEmpId()%>', event)">Edit</button>
								<button class="delete-btn"
									onclick="deleteEmployee('<%=emp.getEmpId()%>', event)">Delete</button>
							</div>

						</div>
					</li>
					<%
					}
					} else {
					%>
					<li>No employees found</li>
					<%
					}
					%>
				</ul>
			</div>

			<!-- Right Side: Employee Details -->
			<div class="employee-details" id="empDetails">
				<h3>Employee Details</h3>
				<div class="profile-section">
					<img width="48" height="48" src="./employeePic.jpg" alt="collaborator-male--v1"/>
				</div>
				<div class="info-section">
					<p>
						<strong>Employee Id:</strong> <span id="empid">Select an
							employee</span> 
					</p>
					<p>
						<strong>Name:</strong> <span id="empName">-</span>
					</p>
					<p>
						<strong>Department:</strong> <span id="empDept">-</span>
					</p>
					<p>
						<strong>Position:</strong> <span id="empPosition">-</span>
					</p>
					<p>
						<strong>Date of Joining:</strong> <span id="empDio">-</span>
					</p>
				</div>
			</div>

		</div>
	</div>

	<!-- JavaScript for Dynamic Update -->
	<script>
		function showEmployeeDetails(empId, empName, empDept, empDesignation,
				empDOJ) {
			document.getElementById('empid').innerText = empId;
			document.getElementById('empName').innerText = empName;
			document.getElementById('empDept').innerText = empDept;
			document.getElementById('empPosition').innerText = empDesignation;
			document.getElementById('empDio').innerText = empDOJ;
		}

		function addEmployee() 
		{
			window.location.href = 'addEmployee.html';
		}

		function logout() 
		{
			alert('Logout successful!');
			window.location.href = 'logoutServlet'; // Redirect to login page
		}

		function editEmployee(empId, event) 
		{
			event.stopPropagation(); // Prevent parent click event
			window.location.href = 'EditEmployeeServlet?id=' + empId;
		}

		function deleteEmployee(empId, event) 
		{
			event.stopPropagation(); // Prevent parent click event
			if (confirm('Are you sure you want to delete this employee?')) 
			{
				window.location.href = 'deleteEmployeeServlet?id=' + empId;
			}
		}
	</script>

</body>
</html>
