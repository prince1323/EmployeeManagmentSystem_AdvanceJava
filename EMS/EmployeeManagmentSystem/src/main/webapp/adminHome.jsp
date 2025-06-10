<%@page import="employee.admin.assests.AdminBean"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" 
import = "employee.admin.assests.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Panel</title>
    <style>
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

        /* Admin Panel Container */
        .admin-panel {
            background-color: #fff;
            width: 400px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
        }

        /* Admin Header */
        .admin-header {
            margin-bottom: 20px;
        }

        .profile-icon {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            border: 3px solid #4a90e2;
            margin-bottom: 10px;
        }

        .admin-header h2 {
            font-size: 20px;
            color: #333;
        }

        /* Options Section */
        .options {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        /* Option Cards */
        .option-card {
            background-color: #4a90e2;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        /* Option Links */
        .option-link {
            display: block;
            padding: 12px;
            color: #fff;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            border-radius: 8px;
        }

        .option-card:hover {
            background-color: #357abd;
            transform: translateY(-3px);
        }

        /* Logout Option */
        .logout {
            background-color: #ff4d4f;
        }

        .logout:hover {
            background-color: #e04346;
        }
    </style>
</head>
<body>
    <div class="admin-panel">
        <!-- Admin Profile Section -->
        <div class="admin-header">
            <img width="48" height="48" src="https://img.icons8.com/color/48/admin-settings-male.png" alt="admin-settings-male"/>
            <h2>
                <% 
                	AdminBean ab = (AdminBean) session.getAttribute("adminLoginBean");
                    String adminName = ab.getfName(); // Sample Name, You can fetch it dynamically if required
                    out.print("Welcome, " + adminName);
                %>
            </h2>
        </div>

        <!-- Admin Options -->
        <div class="options">
            <div class="option-card">
                <a href="addEmployee.html" class="option-link">Add Employee</a>
            </div>
            <div class="option-card">
                <a href="viewEmployeesServlet" class="option-link">View All Employees</a>
            </div>
            <div class="option-card logout">
                <a href="logoutServlet" class="option-link">Logout</a>
            </div>
        </div>
    </div>
</body>
</html>
