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

    <cfquery name="update_user_info" datasource="getit">
        update users set username='#form.fld_username#',
        firstlastname=<cfqueryparam value="#form.fld_firstlastname#" cfsqltype="cf_sql_varchar" maxlength="30">,
        user_password=<cfqueryparam value="#form.fld_password#" cfsqltype="cf_sql_varchar" maxlength="10">
        where users.username=<cfqueryparam value="#form.fld_username#" cfsqltype="cf_sql_varchar" maxlength="10">
    </cfquery>

    <form action="list_of_users.cfm" method="get">
        <button>SEE ALL USERS</button>
    </form>