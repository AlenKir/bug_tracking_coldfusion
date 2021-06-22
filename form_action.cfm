<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>Check</title>
</head>

<body>

    <cfquery name="add_user" datasource="getit">
        insert into users (username, firstlastname, user_password) values ('#form.fld_username#', '#form.fld_name#', '#form.fld_password#')
    </cfquery>

    <cfoutput>
        <p>Welcome, #form.fld_name#!</p>
        <p>[#form.fld_password#]</p>
    </cfoutput>
</body>

</html>
