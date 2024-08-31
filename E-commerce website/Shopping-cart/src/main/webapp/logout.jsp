<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="refresh" content="5000;URL='Index.jsp'" />
    <title>Logging Out...</title>
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
            padding: 30px 40px; /* Generous padding for better spacing */
            border-radius: 8px; /* Slightly rounded corners */
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15); /* Subtle shadow */
            text-align: center;
            max-width: 400px; /* Constrained width for a focused look */
            width: 100%;
            transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth transitions */
        }
        .container:hover {
            transform: translateY(-5px); /* Slight lift effect on hover */
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.2); /* Deeper shadow on hover */
        }
        h1 {
            color: #333; /* Dark grey for the heading */
            font-size: 1.8rem;
            margin-bottom: 15px;
        }
        p {
            color: #555;
            font-size: 1rem;
            margin-bottom: 20px;
        }
        .loader {
            border: 4px solid #f3f3f3; /* Light grey */
            border-top: 4px solid #3498db; /* Amazon's blue */
            border-radius: 50%;
            width: 30px;
            height: 30px;
            animation: spin 2s linear infinite;
            margin: 0 auto 20px auto;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="loader"></div>
        <h1>Logging Out...</h1>
        <p>You will be redirected shortly.</p>
    </div>
    <%
        // Invalidate the session
        session.invalidate();
        // Redirect to Index.jsp
        response.sendRedirect("Index.jsp");
    %>
</body>
</html>
