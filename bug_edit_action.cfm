<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>Edited Bug Entry</title>
</head>

<body>

        <cfoutput>
            <p>
                <cfset DateToday=now()>
                    <cfscript>
                        dateformat= DateFormat(#DateToday#, "yyyy-mm-dd")
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
                Priority #form.fld_priority#.
            </p>
            <p>
                Severity #form.fld_severity#.
            </p>
            <p>
                Created by: #form.fld_creator#.
            </p>
            <cfset EmployeeID = ListFirst(GetAuthUser())>
            <p>
                Changes by: #EmployeeID#.
            </p>
        </cfoutput>
    
    <cfquery name="find_changer_id" datasource="getit">
        select user_id from users where username=<cfqueryparam value="#EmployeeID#" cfsqltype="cf_sql_varchar" maxlength="10">
    </cfquery>
    <cfoutput query="find_changer_id">
        <cfset changer_id=#find_changer_id.user_id#>
    </cfoutput>
    
    <cfquery name="find_creator_id" datasource="getit">
        select user_id from users where username=<cfqueryparam value="#form.fld_creator#" cfsqltype="cf_sql_varchar" maxlength="10">
    </cfquery>
    <cfoutput query="find_creator_id">
        <cfset creator_id=#find_creator_id.user_id#>
    </cfoutput>

    <cfquery name="add_bug" datasource="getit">
        update bugs set bug_title=<cfqueryparam value="#form.fld_description#" cfsqltype="cf_sql_varchar" maxlength="50">,
        bug_details=<cfqueryparam value="#form.fld_details#" cfsqltype="cf_sql_varchar" maxlength="250">, 
        creator_id=<cfqueryparam value="#creator_id#" cfsqltype="cf_sql_integer">,
        bug_status=<cfqueryparam value="#form.fld_status#" cfsqltype="cf_sql_integer">, 
        bug_priority=<cfqueryparam value="#form.fld_priority#" cfsqltype="cf_sql_integer">,
        bug_severity=<cfqueryparam value="#form.fld_severity#" cfsqltype="cf_sql_integer">, 
        bug_whenfound=<cfqueryparam value="#dateformat#" cfsqltype="cf_sql_date">
        where bug_id=<cfqueryparam value="#form.fld_bug_id#" cfsqltype="cf_sql_integer">        
    </cfquery>

    <cfquery name="change" datasource="getit">
        INSERT INTO changes (bug_id, changer_id, change_date, change_action, change_comment) VALUES (
        <cfqueryparam value="#form.fld_bug_id#" cfsqltype="cf_sql_integer">,
        <cfqueryparam value="#changer_id#" cfsqltype="cf_sql_integer">,
        <cfqueryparam value="#dateformat#" cfsqltype="cf_sql_date">,
        <cfqueryparam value="#form.fld_status#" cfsqltype="cf_sql_integer">,
        <cfqueryparam value="#form.fld_comment#" cfsqltype="cf_sql_varchar" maxlength="100">
        );
    </cfquery>

    <form action="list_of_bugs.cfm" method="get">
        <button>SEE ALL BUGS</button>
    </form>

</body>

</html>
