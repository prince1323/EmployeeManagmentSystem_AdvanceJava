<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Operation Failed</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #ffffff;
            padding: 20px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }
        h2 {
            color: #e74c3c;
        }
        p {
            margin-top: 10px;
            color: #555;
        }
        .btn {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #e74c3c;
            color: #fff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
            text-decoration: none;
            display: inline-block;
        }
        .btn:hover {
            background-color: #c0392b;
        }
        .btn-retry {
            background-color: #f39c12;
        }
        .btn-retry:hover {
            background-color: #e67e22;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Operation Failed!</h2>
        <p>Unfortunately, the operation could not be completed. Please try again or return to the admin home page.</p>
        <div>
            <a href="adminHome.jsp" class="btn">Return to Home</a>
        </div>
    </div>
</body>
</html>
