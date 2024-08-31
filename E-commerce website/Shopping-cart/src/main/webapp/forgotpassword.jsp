<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f3f3f3; /* Amazon's light grey background */
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            padding: 20px;
            width: 100%; /* Full width of the screen */
            box-sizing: border-box;
        }

        .card {
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
            background-color: #ffffff; /* White background */
            padding: 30px;
            max-width: 400px;
            width: 100%; /* Full width for responsiveness */
            box-sizing: border-box;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
        }

        h2 {
            font-size: 1.5rem; /* Font size for heading */
            margin-bottom: 20px;
            color: #232F3E; /* Amazon's dark blue */
            font-weight: bold;
        }

        .form-group label {
            font-weight: bold;
            color: #333333; /* Dark text for labels */
        }

        .form-control {
            border-radius: 4px;
            border-color: #dddddd;
            box-shadow: none;
        }

        .form-control:focus {
            border-color: #ff9900; /* Amazon's orange */
            box-shadow: 0 0 5px rgba(255, 153, 0, 0.5);
        }

        button {
            width: 100%;
            padding: 10px;
            border: none; /* Remove the border */
            outline: none; /* Remove the outline */
            border-radius: 4px;
            background-color: #ff9900 !important; /* Amazon's orange */
            color: white;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s, border-color 0.3s;
        }

        button:hover {
            background-color: #e47911 !important; /* Darker orange on hover */
        }

        .mt-3 a {
            color: #007bff;
            font-size: 0.9rem;
            text-decoration: none;
        }

        .mt-3 a:hover {
            text-decoration: underline;
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <h2>Forgot Password</h2>
            <form action="ForgotPasswordServlet" method="post">
                <div class="form-group">
                    <label for="email">Enter your email address:</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Reset Password</button>
            </form>
            <div class="mt-3 text-center">
                <a href="login.jsp">Back to Login</a>
            </div>
        </div>
    </div>
</body>
</html>
