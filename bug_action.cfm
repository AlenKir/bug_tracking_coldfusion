<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>Check. Bug entry</title>
</head>

<body>

    <h2>
        <cfoutput>
            <p>
                <cfset DateToday=now()>
                    <cfscript>
                        dateformat = DateFormat(#DateToday#, "yyyy-mm-dd")
                    </cfscript>

                    <cfoutput>
                        Date: #dateformat#
                    </cfoutput>
            </p>
            <p>
                Short Description: #form.fld_description#.
            </p>
            <p>
                Long Description: #form.fld_details#.
            </p>
            <p>
                Status: #form.fld_status#.
            </p>
            <p>
                Priority [0 - High, 1 - Medium, 2 - Low] #form.fld_priority#.
            </p>
            <p>
                Severity [0 - Blocker, 1 - Critical, 2 - Major, 3 - Minor, 4 - Trivial] #form.fld_severity#.
            </p>
        </cfoutput>
    </h2>
    
    <cfset EmployeeID = ListFirst(GetAuthUser())>
    <cfquery name="find_user_id" datasource="getit">
        select user_id from users where username=<cfqueryparam value="#EmployeeID#" cfsqltype="cf_sql_varchar" maxlength="10">
    </cfquery>
    <cfoutput query="find_user_id">
        <cfset u_id=#find_user_id.user_id#>
    </cfoutput>

    <cfquery name="add_bug" datasource="getit">
        insert into bugs (bug_title, bug_details, creator_id, bug_status, bug_priority, bug_severity, bug_whenfound) 
        values 
        (
        <cfqueryparam value="#form.fld_description#" cfsqltype="cf_sql_varchar" maxlength="50">,
        <cfqueryparam value="#form.fld_details#" cfsqltype="cf_sql_varchar" maxlength="250">,
        <cfqueryparam value="#u_id#" cfsqltype="cf_sql_integer">,
        <cfqueryparam value="#form.fld_status#" cfsqltype="cf_sql_integer">,
        <cfqueryparam value="#form.fld_priority#" cfsqltype="cf_sql_integer">,
        <cfqueryparam value="#form.fld_severity#" cfsqltype="cf_sql_integer">,
        <cfqueryparam value="#dateformat#" cfsqltype="cf_sql_date">
        )
    </cfquery>

    <form action="list_of_bugs.cfm" method="get">
        <button>SEE ALL BUGS</button>
    </form>

</body>

</html>
