<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Failed</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f3f3f3; /* Amazon's light grey background */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #ffffff;
            padding: 40px; /* Added more padding for better spacing */
            border-radius: 8px; /* Slightly more rounded corners */
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15); /* Softer shadow for depth */
            text-align: center;
            max-width: 450px; /* Increased max-width for a more substantial look */
            width: 100%;
            transition: transform 0.3s, box-shadow 0.3s; /* Smooth scaling effect */
        }
        .container:hover {
            transform: translateY(-5px); /* Slight lift effect on hover */
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2); /* Deeper shadow on hover */
        }
        h1 {
            color: #e74c3c; /* Red color for error */
            font-size: 2rem;
            margin-bottom: 15px;
            text-transform: uppercase;
            font-weight: bold; /* Added bold font weight */
        }
        p {
            color: #555;
            margin-bottom: 20px;
            font-size: 1rem;
        }
        .button {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 25px;
            font-size: 16px;
            color: #ffffff;
            background-color: #ff9900; /* Amazon's orange */
            border: none;
            border-radius: 4px; /* Rounded corners */
            text-decoration: none;
            transition: background-color 0.3s ease, transform 0.2s ease;
            font-weight: bold; /* Bold text */
        }
        .button:hover {
            background-color: #e47911; /* Darker orange on hover */
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Login Failed</h1>
        <p>Please check your email and password.</p>
        <a href="userrole.jsp" class="button">Try Again</a>
    </div>
</body>
</html>