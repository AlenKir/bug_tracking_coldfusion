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
                        dateformat= DateFormat(#DateToday#)
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
        select user_id from users where username='#EmployeeID#'
    </cfquery>
    <cfoutput query="find_user_id">
        <cfset u_id=#find_user_id.user_id#>
    </cfoutput>

    <cfquery name="add_bug" datasource="getit">
        insert into bugs (bug_title, bug_details, creator_id, bug_status, bug_priority, bug_severity, bug_whenfound) values ('#form.fld_description#', '#form.fld_details#', #u_id#, '#form.fld_status#', '#form.fld_priority#', '#form.fld_severity#', '2021-06-23')
    </cfquery>

    <form action="list_of_bugs.cfm" method="get">
        <button>SEE ALL BUGS</button>
    </form>

</body>

</html>
