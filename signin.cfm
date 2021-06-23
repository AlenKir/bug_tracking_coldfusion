<!DOCTYPE HTML> 
<html> 
<head> 
    <title>Security test page</title> 
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
</head> 
 
<body> 

    <nav>
        <a href="signup.cfm">SIGN UP</a> | <a href="signin.cfm">SIGN IN</a> |
        <a href="list_of_bugs.cfm">BUGS</a> | <a href="history.cfm">HISTORY</a> |    
        <form action="signin.cfm" method="post">
        <button type="submit" name="Logout" value="Logout" class="btn-link" style="border:none;background-color: transparent;">
        LOG OUT
        </button>

        </form>
    </nav>

    <hr>

<cfoutput> 
    <h2>Welcome #GetAuthUser()#!</h2> 
</cfoutput> 
 
ALL Logged-in Users see this message.<br> 
<br> 
 
</body> 
</html>