<form action="edit_user.cfm" method="get">
    <button>Edit your profile</button>
</form>

<h1>Users:</h1>
<cfquery name="users_list" datasource="mygetit">
    select user_id, username, firstlastname, user_password
    from users
</cfquery>

<cfoutput query="users_list">
    <strong>username: </strong>#users_list.username#, <br>
    <strong>First and last name: </strong>#users_list.firstlastname#
    <hr>
</cfoutput>
