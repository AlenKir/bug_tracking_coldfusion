<cfoutput>
    <p>
        Username: #form.fld_username#.
    </p>
    <p>
        Updated first & last name: #form.fld_firstlastname#.
    </p>
    <p>
        Updated password: #form.fld_password#.
    </p>
</cfoutput>

    <cfquery name="update_user_info" datasource="mygetit">
        update users set username='#form.fld_username#',
        firstlastname='#form.fld_firstlastname#',
        user_password='#form.fld_password#'
        where users.username='#form.fld_username#'
    </cfquery>

    <form action="list_of_users.cfm" method="get">
        <button>SEE ALL USERS</button>
    </form>