<!-- account_exists.jsp -->
<!DOCTYPE html>
<html>
<head>
    <title>Account Exists</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f3f3f3; /* Amazon's light grey background */
            font-family: 'Arial', sans-serif;
        }
        .container {
            max-width: 600px; /* Limiting width for better readability */
            margin-top: 100px; /* Spacing from the top */
            background-color: #ffffff; /* White background for the content */
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow for a polished look */
            border-radius: 8px; /* Slightly rounded corners */
        }
        .alert-heading {
            color: #cc3300; /* Amazon's red-orange color for headings */
            font-weight: bold;
        }
        .alert {
            background-color: #fffbcc; /* Light yellow background for the alert */
            border: 1px solid #ffd700; /* Gold border to complement the background */
            color: #333; /* Dark text color for readability */
        }
        .alert a {
            color: #007185; /* Amazon's blue for links */
            text-decoration: none;
        }
        .alert a:hover {
            color: #ff9900; /* Amazon's orange color on hover */
            text-decoration: none; /* Ensure underline does not appear on hover */
        }
        .btn-primary {
            background-color: #ff9900 !important; /* Amazon's orange color for the button */
            border-color: #ff9900 !important; /* Same color for the border */
            color: #ffffff !important; /* White text color */
            text-decoration: none; /* Remove underline from text */
        }
        .btn-primary:hover {
            background-color: #e47911 !important; /* Darker orange on hover */
            border-color: #e47911 !important; /* Darker border on hover */
            color: #ffffff !important; /* Keep text white on hover */
            text-decoration: none !important; /* Ensure underline does not appear on hover */
        }
        .btn-primary:focus {
            box-shadow: 0 0 0 0.2rem rgba(255, 153, 0, 0.5) !important; /* Soft orange glow on focus */
            text-decoration: none !important; /* Ensure underline does not appear on focus */
        }
        .btn-primary:active {
            background-color: #cc3300 !important; /* Even darker orange on active/click */
            border-color: #cc3300 !important; /* Darker border on active/click */
            color: #ffffff !important; /* Keep text white on active/click */
            text-decoration: none !important; /* Ensure underline does not appear on active/click */
        }
        hr {
            border-top: 1px solid #ccc; /* Subtle line between content */
        }
        .mb-0 {
            margin-bottom: 0;
        }
    </style>
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>
    <div class="container mt-5">
        <div class="alert alert-warning" role="alert">
            <h4 class="alert-heading">Account Already Exists!</h4>
            <p>It looks like there is already an account associated with this email address. Please try using a different email or log in with your existing account.</p>
            <hr> 
            <p class="mb-0">If you have forgotten your password, you can reset it <a href="forgotpassword.jsp">here</a>.</p>
            <a class="btn btn-primary mt-3" href="userrole.jsp">Go Back to Registration</a>
        </div>
    </div>
</body>
</html>