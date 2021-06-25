<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>All The Bugs</title>
</head>

<body>
    <h3>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;Searching for: <cfoutput><i>#form.fld_search#</i></cfoutput>.
    </p>
    </h3>

    <cfquery name="bugs_list" datasource="mygetit">
        select bug_id, bug_title, bug_details, creator_id, bug_status, bug_urgency, bug_crit, username as bug_creator
        from bugs
        left join users
        on creator_id=users.user_id
        where 
        position('#form.fld_search#' in bug_title)!=0
        OR
        position('#form.fld_search#' in bug_details)!=0
        OR
        position('#form.fld_search#' in username)!=0
    </cfquery>

    <cfoutput query="bugs_list">
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
        
        <strong>Urgency:</strong>
        <cfswitch expression="#bugs_list.bug_urgency#">
            <cfcase value="0">Very</cfcase>
            <cfcase value="1">Urgent</cfcase>
            <cfcase value="2">Non-urgent</cfcase>
            <cfcase value="3">Not at all</cfcase>
            <cfdefaultcase>Wrong urgency.</cfdefaultcase>
        </cfswitch>,

        <strong>Criticality:</strong>
        <cfswitch expression="#bugs_list.bug_crit#">
            <cfcase value="0">Crisis</cfcase>
            <cfcase value="1">Critical</cfcase>
            <cfcase value="2">Non-critical</cfcase>
            <cfcase value="3">Request</cfcase>
            <cfdefaultcase>Wrong criticality.</cfdefaultcase>
        </cfswitch><br>

        <strong>Added by: </strong>#bugs_list.bug_creator#

        <form action="edit_bug.cfm" method="post">
            <button name="fld_id" value="#bugs_list.bug_id#">EDIT</button>
        </form>
        <hr>
    </cfoutput>
</body>

</html>