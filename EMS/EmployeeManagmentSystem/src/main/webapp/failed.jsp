<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    /* Basic Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        background: linear-gradient(to right, #4facfe, #00f2fe);
        font-family: 'Poppins', sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        padding: 20px;
    }

    .container {
        width: 100%;
        max-width: 500px;
        padding: 30px;
        background: rgba(255, 255, 255, 0.8);
        border-radius: 12px;
        backdrop-filter: blur(10px);
        box-shadow: 0 12px 25px rgba(0, 0, 0, 0.15);
        text-align: center;
        animation: fadeIn 0.8s ease-out;
    }

    .alert {
        background-color: #f8d7da;
        color: #721c24;
        padding: 20px;
        border-left: 5px solid #f5c6cb;
        border-radius: 8px;
        margin-bottom: 25px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        animation: slideDown 0.5s ease-out;
    }

    .alert-heading {
        font-size: 1.5rem;
        font-weight: 600;
        margin-bottom: 10px;
    }

    .alert p {
        font-size: 1.1rem;
        margin-top: 5px;
    }

    .btn-primary {
        display: inline-block;
        width: 100%;
        padding: 12px 20px;
        font-size: 1.2rem;
        text-align: center;
        background: linear-gradient(to right, #007bff, #0056b3);
        color: white;
        border: none;
        border-radius: 50px;
        cursor: pointer;
        text-decoration: none;
        transition: all 0.3s ease;
    }

    .btn-primary:hover {
        background: linear-gradient(to right, #0056b3, #004085);
        transform: translateY(-3px);
        box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
    }

    .btn-primary:active {
        transform: translateY(1px);
    }

    .back-link {
        display: block;
        margin-top: 20px;
        font-size: 1.1rem;
        color: #007bff;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .back-link:hover {
        color: #0056b3;
        text-decoration: underline;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .container {
            padding: 20px;
        }

        .btn-primary {
            font-size: 1.1rem;
        }
    }

    /* Keyframe Animations */
    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(-20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    @keyframes slideDown {
        from {
            transform: translateY(-10px);
            opacity: 0;
        }
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }
</style>
</head>
<body>
	  <div class="container">
        <div class="alert" role="alert">
            <h4 class="alert-heading">Login Failed!</h4>
            <p>Your username or password is incorrect. Please try again.</p>
        </div>
        <a href="adminLogin.html" class="btn-primary">Go Back to Login</a>
        <a href="landingPage.html" class="back-link">Return to Home Page</a>
    </div>
</body>
</html>


