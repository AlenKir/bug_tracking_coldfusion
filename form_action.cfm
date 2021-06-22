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
