<h1>Users:</h1>
<cfquery name = "users_list" datasource="getit">
    select user_id, username, firstlastname, user_password
    from users
</cfquery>

<cfoutput query="users_list">
#users_list.user_id#, #users_list.username#, #users_list.firstlastname#, #users_list.user_password#<br>
</cfoutput>

<h1>Bugs:</h1>
<cfquery datasource="getit">
    select *
    from bugs
</cfquery>

<h1>History:</h1>
<cfquery datasource="getit">
    select *
    from changes
</cfquery>