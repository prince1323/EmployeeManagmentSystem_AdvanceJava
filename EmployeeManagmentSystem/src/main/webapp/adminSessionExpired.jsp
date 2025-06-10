<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Session Expired</title>

    <style>
        /* Basic Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fa;
            color: #333;
            text-align: center;
            padding: 50px;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: auto;
        }

        h1 {
            font-size: 24px;
            color: #e74c3c;
        }

        p {
            font-size: 16px;
            color: #333;
            margin-bottom: 30px;
        }

        button {
            padding: 12px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #357abd;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 0 10px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #2d6eb5;
        }

        .button-container {
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Session Expired</h1>
        <p>Your session has expired. Please log in again or return to the home page.</p>
        
        <div class="button-container">
            <button onclick="window.location.href='adminLogin.html'">Go to Admin Login</button>
            <button onclick="window.location.href='landingPage.html'">Go to Home</button>
        </div>
    </div>

</body>
</html>
