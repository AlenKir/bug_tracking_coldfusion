<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>Sign Up</title>
</head>

<body>

    <nav>
        <a href="signup.cfm">SIGN UP</a> | <a href="signin.cfm">SIGN IN</a> |
        <a href="list_of_bugs.cfm">BUGS</a> | <a href="history.cfm">HISTORY</a> | <a href="signout.cfm">SIGN OUT</a>
    </nav>

    <hr>

    <form id="frm_signupForm" name="frm_signupForm" method="post" action="form_action.cfm">
        <p>
            <label for="fld_firstName">Your First & Last Name</label>
            <input type="text" name="fld_name" id="fld_name" />
        </p>

        <p>
            <label for="fld_username">Your Username</label>
            <input type="text" name="fld_username" id="fld_username" />
        </p>
        <p>
            <label for="fld_password">Password</label>
            <input type="text" name="fld_password" id="fld_password" />
        </p>
        <p>
            <input type="submit" name="fld_submitForm" id="fld_submitForm" value="Submit" />
        </p>
    </form>
</body>

</html>
