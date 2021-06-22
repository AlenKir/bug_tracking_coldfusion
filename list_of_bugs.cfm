<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>All The Bugs</title>
</head>

<body>
    <h1>Bugs:</h1>
    <cfquery name="bugs_list" datasource="getit">
        select bug_id, bug_title, bug_details, creator_id, bug_status, bug_urgency, bug_crit
        from bugs
    </cfquery>

    <cfoutput query="bugs_list">
<!--       #bugs_list.bug_id#<br>-->
        <strong>Short Description:</strong> #bugs_list.bug_title#, <br> <strong>Details:</strong> #bugs_list.bug_details#, <br> <strong>Status:</strong> #bugs_list.bug_status#, <strong>Urgency:</strong> #bugs_list.bug_urgency#, <strong>Cricicality: </strong>#bugs_list.bug_crit#<br>
        <form action="edit_bug.cfm" method="post">
            <button name="fld_id" value="#bugs_list.bug_id#">EDIT</button>
        </form>
        <hr>
        <form action="bug.cfm" method="get">
            <button name="fld_id" value="#bugs_list.bug_id#">ADD</button>
        </form>
    </cfoutput>
</body>

</html>
