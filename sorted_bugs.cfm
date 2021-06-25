<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>All The Bugs</title>
</head>

<body>

    <h1>Bugs:</h1>
    <hr>

    <cfoutput>
        Sorted by #form.fld_sortby#
    </cfoutput>
    <hr>

    <cfswitch expression="#form.fld_sortby#">
        <cfcase value="status">
            <cfquery name="bugs_list" datasource="getit">
                select bug_id, bug_title, bug_details, creator_id, bug_status, bug_priority, bug_severity, username as bug_creator
                from bugs
                left join users
                on creator_id=users.user_id
                order by bug_status ASC
            </cfquery>
        </cfcase>
        <cfcase value="priority">
            <cfquery name="bugs_list" datasource="getit">
                select bug_id, bug_title, bug_details, creator_id, bug_status, bug_priority, bug_severity, username as bug_creator
                from bugs
                left join users
                on creator_id=users.user_id
                order by bug_priority ASC
            </cfquery>
        </cfcase>
        <cfcase value="Severity">
            <cfquery name="bugs_list" datasource="getit">
                select bug_id, bug_title, bug_details, creator_id, bug_status, bug_priority, bug_severity, username as bug_creator
                from bugs
                left join users
                on creator_id=users.user_id
                order by bug_severity ASC
            </cfquery>
        </cfcase>

        <cfdefaultcase>Something went wrong.</cfdefaultcase>
    </cfswitch>

    <cfoutput query="bugs_list">
        <!--       #bugs_list.bug_id#<br>-->
        <strong>Short Description:</strong> #bugs_list.bug_title#, <br>

        <strong>Details:</strong> #bugs_list.bug_details#, <br>

        <strong>Status:</strong>
        <cfswitch expression="#bugs_list.bug_status#">
            <cfcase value="0">New</cfcase>
            <cfcase value="1">Open</cfcase>
            <cfcase value="2">Solved</cfcase>
            <cfcase value="3">Closed</cfcase>
            <cfdefaultcase>Wrong status.</cfdefaultcase>
        </cfswitch>,

        <strong>Priority:</strong>
        <cfswitch expression="#bugs_list.bug_priority#">
            <cfcase value="0">High</cfcase>
            <cfcase value="1">Medium</cfcase>
            <cfcase value="2">Low</cfcase>
            <cfdefaultcase>Wrong priority.</cfdefaultcase>
        </cfswitch>,

        <strong>Severity:</strong>
        <cfswitch expression="#bugs_list.bug_severity#">
            <cfcase value="0">Blocker</cfcase>
            <cfcase value="1">Critical</cfcase>
            <cfcase value="2">Major</cfcase>
            <cfcase value="3">Minor</cfcase>
            <cfcase value="4">Trivial</cfcase>
            <cfdefaultcase>Wrong Severity.</cfdefaultcase>
        </cfswitch><br>

        <strong>Added by: </strong>#bugs_list.bug_creator#

        <form action="edit_bug.cfm" method="post">
            <button name="fld_id" value="#bugs_list.bug_id#">EDIT</button>
        </form>
        <hr>
    </cfoutput>
    <form action="bug.cfm" method="get">
        <button name="fld_id" value="#bugs_list.bug_id#">ADD</button>
    </form>
</body>

</html>
