<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>Sign In</title>
</head>

<body>
    <form id="frm_signinForm" name="frm_signinForm" method="post" action="signin_action.cfm">
        <p>
            <label for="fld_username">Username</label>
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
