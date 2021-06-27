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
        select user_id from users where username='#EmployeeID#'
    </cfquery>
    <cfoutput query="find_changer_id">
        <cfset changer_id=#find_changer_id.user_id#>
    </cfoutput>
    
    <cfquery name="find_creator_id" datasource="getit">
        select user_id from users where username='#form.fld_creator#'
    </cfquery>
    <cfoutput query="find_creator_id">
        <cfset creator_id=#find_creator_id.user_id#>
    </cfoutput>

    <cfquery name="add_bug" datasource="getit">
        update bugs set bug_title='#form.fld_description#',
        bug_details='#form.fld_details#', creator_id=#creator_id#,
        bug_status='#form.fld_status#', bug_priority='#form.fld_priority#',
        bug_severity='#form.fld_severity#', bug_whenfound='#dateformat#'
        where bug_id=#form.fld_bug_id#
    </cfquery>

    <cfquery name="change" datasource="getit">
        INSERT INTO changes (bug_id, changer_id, change_date, change_action, change_comment) VALUES (#form.fld_bug_id#, #changer_id#, '#dateformat#', '#form.fld_status#', '#form.fld_comment#');
    </cfquery>

    <form action="list_of_bugs.cfm" method="get">
        <button>SEE ALL BUGS</button>
    </form>

</body>

</html>
