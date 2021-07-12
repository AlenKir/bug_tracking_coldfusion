    <cfquery name="add_user" datasource="getit">
         insert into users (username, firstlastname, user_password) values (
         <cfqueryparam value="#form.fld_username#" cfsqltype="cf_sql_varchar" maxlength="10">,
         <cfqueryparam value="#form.fld_name#" cfsqltype="cf_sql_varchar" maxlength="30">,
         <cfqueryparam value="#form.fld_password#" cfsqltype="cf_sql_varchar" maxlength="10">)
    </cfquery>
    <h2>
        <cfoutput>
            <p>Welcome, #form.fld_name#!</p>
        </cfoutput>
    </h2>
    