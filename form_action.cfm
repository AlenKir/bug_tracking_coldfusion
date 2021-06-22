<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>Check</title>
</head>

<body>

    <nav>
        <a href="signup.cfm">SIGN UP</a> | <a href="signin.cfm">SIGN IN</a> |
        <a href="list_of_bugs.cfm">BUGS</a> | <a href="history.cfm">HISTORY</a> | <a href="signout.cfm">SIGN OUT</a>
    </nav>

    <hr>

    <cfquery name="add_user" datasource="getit">
        insert into users (username, firstlastname, user_password) values ('#form.fld_username#', '#form.fld_name#', '#form.fld_password#')
    </cfquery>

    <h2>
        <cfoutput>
            <p>Welcome, #form.fld_name#!</p>
            <p>[#form.fld_password#]</p>
        </cfoutput>
    </h2>

    <h1>Users:</h1>
    <cfquery name="users_list" datasource="getit">
        select user_id, username, firstlastname, user_password
        from users
    </cfquery>

    <cfoutput query="users_list">
        #users_list.user_id#, #users_list.username#, #users_list.firstlastname#, #users_list.user_password#<br>
    </cfoutput>

</body>

</html>
