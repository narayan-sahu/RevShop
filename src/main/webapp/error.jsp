<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Something Went Wrong</title>
    <style>
        body {
            font-family: 'Arial', sans-serif; /* Amazon's font */
            background-color: #f3f3f3; /* Amazon's light grey background */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #333;
        }
        .container {
            background-color: #ffffff; /* White background */
            padding: 40px; /* Padding for better spacing */
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Soft shadow for depth */
            text-align: center;
            max-width: 500px;
            width: 100%;
            transition: transform 0.3s ease; /* Smooth scaling effect */
        }
        .container:hover {
            transform: scale(1.02); /* Slight zoom effect on hover */
        }
        h1 {
            color: #cc3300; /* Amazon's red-orange color */
            font-size: 2rem; /* Font size for heading */
            margin-bottom: 20px;
            font-weight: bold;
        }
        p {
            color: #555555; /* Darker grey text */
            font-size: 1.2rem; /* Font size for text */
            margin-bottom: 30px;
            line-height: 1.5; /* Improved line height for readability */
        }
        .button {
            display: inline-block;
            padding: 12px 25px; /* Padding for the button */
            font-size: 1rem;
            color: #ffffff;
            background-color: #ff9900; /* Amazon's orange color */
            border: none;
            border-radius: 4px; /* Slightly rounded corners */
            text-decoration: none;
            transition: background-color 0.3s ease, transform 0.2s ease; /* Smooth transition */
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Soft shadow for the button */
        }
        .button:hover {
            background-color: #e47911; /* Darker orange on hover */
            transform: translateY(-2px); /* Slight lift effect on hover */
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15); /* Slightly darker shadow on hover */
        }
        .icon {
            font-size: 3rem; /* Font size for the icon */
            color: #cc3300; /* Amazon's red-orange color */
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="icon">🚫</div>
        <h1>Oops! Something Went Wrong</h1>
        <p>We encountered an unexpected issue. Please try again later or contact support if the problem persists.</p>
        <a href="userrole.jsp" class="button">Return to Login</a>
    </div>
</body>
</html>