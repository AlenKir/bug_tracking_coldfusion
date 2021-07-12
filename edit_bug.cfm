<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>Edit Bug</title>
</head>

<body>

    <cfquery name="bugs_list" datasource="getit">
        select bug_id, bug_title, bug_details, creator_id, bug_status, bug_priority, bug_severity, username as bug_creator
        from bugs
        left join users
        on creator_id = users.user_id
        where bug_id=<cfqueryparam value="#form.fld_id#" cfsqltype="cf_sql_integer">
    </cfquery>

    <cfoutput>
        <strong>Short Description:</strong> #bugs_list.bug_title#, <br> <strong>Details:</strong> #bugs_list.bug_details#, <br> <strong>Status:</strong> #bugs_list.bug_status#, <strong>Priority:</strong> #bugs_list.bug_priority#, <strong>Severity: </strong>#bugs_list.bug_severity#<br>
        <strong>Added by: </strong>#bugs_list.bug_creator#
        <hr>
    </cfoutput>

    <h2>History:</h2>
    <cfquery name="changes_list" datasource="getit">
        select * from changes
        inner join users
        on changes.changer_id=users.user_id
        where bug_id=<cfqueryparam value="#form.fld_id#" cfsqltype="cf_sql_integer">
    </cfquery>

    <cfoutput query="changes_list">
        #changes_list.username#, #changes_list.change_action#, #changes_list.change_comment#, #changes_list.change_date#<br>
    </cfoutput>

    <hr>

    <h2>Change to:</h2>
    <cfoutput>
        <form id="frm_enterBugForm" name="frm_enterBugForm" method="post" action="bug_edit_action.cfm">
           
            <p style="visibility: hidden">
                <label for="fld_creator">Creator: </label>
                <input type="text" name="fld_creator" id="fld_creator" value="#bugs_list.bug_creator#" />
            </p>
           
            <p>
                <label for="fld_description">Short Description</label>
                <input type="text" name="fld_description" id="fld_description" value="#bugs_list.bug_title#" />
            </p>
            <p>
                <label for="fld_details">Long Description</label>
                <textarea rows="1" cols="75" name="fld_details" id="fld_details">#bugs_list.bug_details#</textarea>
            </p>

            <p>
                <label for="fld_status">Updated Status (0 - New, 1 - Open, 2 - Solved, 3 - Closed):</label>
                <input type="text" name="fld_status" id="fld_status" value="#bugs_list.bug_status#" />
            </p>
            <p>
                <label for="fld_priority">Priority (0 - High, 1 - Medium, 2 - Low)</label>
                <input type="text" name="fld_priority" id="fld_priority" value="#bugs_list.bug_priority#" />
            </p>
            <p>
                <label for="fld_severity">Severity (0 - Blocker, 1 - Critical, 2 - Major, 3 - Minor, 4 - Trivial)</label>
                <input type="text" name="fld_severity" id="fld_severity" value="#bugs_list.bug_severity#" />
            </p>
            
            
            <div style="display:none">
                <input type="text" name="fld_bug_id" value="#form.fld_id#" />
            </div>

            <hr>

            <p>
                <label for="fld_comment">Note:</label>
                <textarea rows="1" cols="75" name="fld_comment" id="fld_comment"></textarea>
            </p>

            <p>
                <input type="submit" name="fld_submitBugForm" id="fld_submitBugForm" value="Submit" />
            </p>

        </form>
    </cfoutput>

</body>

</html>
