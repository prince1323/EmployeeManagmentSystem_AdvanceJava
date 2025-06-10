<!DOCTYPE html>
<%@page import="employee.employees.assets.EmployeeBean"%>
<%@page import="employee.employees.assets.EditEmployeeDAO"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Employee</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    
    <style>
        /* General Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-color: #f4f7fc;
            color: #333;
            font-size: 16px;
            line-height: 1.6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 100%;
            max-width: 600px;
            margin: 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #4e73df;
        }

        /* Form Styles */
        form {
            display: flex;
            flex-direction: column;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }

        input, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        input:focus, select:focus {
            border-color: #4e73df;
            outline: none;
        }

        input[type="number"] {
            -moz-appearance: textfield;
        }

        input[type="number"]::-webkit-outer-spin-button,
        input[type="number"]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        /* Button Styles */
        .btn-container {
            display: flex;
            justify-content: space-between;
        }

        button {
            padding: 12px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button[type="submit"] {
            background-color: #4e73df;
            color: white;
        }

        button[type="submit"]:hover {
            background-color: #3e63c6;
        }

        button[type="button"].btn-cancel {
            background-color: #e74a3b;
            color: white;
        }

        button[type="button"].btn-cancel:hover {
            background-color: #c0392b;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 20px;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Update Employee</h2>
        
        <!-- Update Employee Form -->
        <form id="updateEmployeeForm" action="updateEmployeeServlet" method="post">
            
            <% EmployeeBean eb = (EmployeeBean)request.getAttribute("employee"); %>
            <!-- Employee ID (Read-only) -->
            <div class="form-group">
                <label for="empID">Employee ID</label>
                <input type="text" id="empID" name="empID" value="<%= eb.getEmpId() %>" readonly>
            </div>

            <!-- Employee Name -->
            <div class="form-group">
                <label for="empName">Employee Name</label>
                <input type="text" id="empName" name="empName" value="<%= eb.getEmpName() %>" required>
            </div>

            <!-- Employee Department -->
            <div class="form-group">
                <label for="empDept">Employee Department</label>
                <select id="empDept" name="empDept" required>
                    <option value="" disabled>Select Department</option>
                    <option value="HR" <%= "HR".equals(eb.getEmpDepartment()) ? "selected" : "" %>>HR</option>
                    <option value="IT" <%= "IT".equals(new EditEmployeeDAO().getEmployeeWithId(request.getParameter("id")).getEmpDepartment()) ? "selected" : "" %>>IT</option>
                    <option value="Finance" <%= "Finance".equals(new EditEmployeeDAO().getEmployeeWithId(request.getParameter("id")).getEmpDepartment()) ? "selected" : "" %>>Finance</option>
                    <option value="Marketing" <%= "Marketing".equals(new EditEmployeeDAO().getEmployeeWithId(request.getParameter("id")).getEmpDepartment()) ? "selected" : "" %>>Marketing</option>
                </select>
            </div>

            <!-- Employee Designation -->
            <div class="form-group">
                <label for="empDesignation">Employee Designation</label>
                <input type="text" id="empDesignation" name="empDesignation" value="<%= eb.getEmpDesignation() %>" required>
            </div>

            <!-- Employee Date of Joining -->
            <div class="form-group">
                <label for="empDOJ">Date of Joining</label>
                <input type="date" id="empDOJ" name="empDOJ" value="<%= eb.getEmpDOJ() %>" required>
            </div>

            <!-- Button Container -->
            <div class="btn-container">
                <button type="submit" onclick="window.location.href='updateEmployeeServlet'">Update Employee</button>
                <button type="button" class="btn-cancel" onclick="window.location.href='displayEmployeeList.jsp'">Cancel</button>
            </div>
        </form>
    </div>

</body>
</html>
