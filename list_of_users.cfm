<h1>Users:</h1>
<cfquery name = "users_list" datasource="getit">
    select user_id, username, firstlastname, user_password
    from users
</cfquery>

<cfoutput query="users_list">
<strong>username: </strong>#users_list.username#, <br>
<strong>First and last name: </strong>#users_list.firstlastname#
<hr>
</cfoutput>