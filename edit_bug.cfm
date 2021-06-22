<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>Edit Bug</title>
</head>

<body>

    <nav>
        <a href="signup.cfm">SIGN UP</a> | <a href="signin.cfm">SIGN IN</a> |
        <a href="list_of_bugs.cfm">BUGS</a> | <a href="history.cfm">HISTORY</a> | <a href="signout.cfm">SIGN OUT</a>
    </nav>

    <hr>

    <cfquery name="bugs_list" datasource="getit">
        select bug_id, bug_title, bug_details, creator_id, bug_status, bug_urgency, bug_crit
        from bugs where bug_id=#form.fld_id#
    </cfquery>

    <cfoutput>
        <strong>Short Description:</strong> #bugs_list.bug_title#, <br> <strong>Details:</strong> #bugs_list.bug_details#, <br> <strong>Status:</strong> #bugs_list.bug_status#, <strong>Urgency:</strong> #bugs_list.bug_urgency#, <strong>Cricicality: </strong>#bugs_list.bug_crit#<br>
        <hr>
    </cfoutput>

    <h2>History:</h2>
    <cfquery name="changes_list" datasource="getit">
        select * from changes 
        inner join users
        on changes.changer_id=users.user_id
        where bug_id=#form.fld_id#
    </cfquery>

    <cfoutput query="changes_list">
        #changes_list.username#, #changes_list.change_action#, #changes_list.change_comment#, #changes_list.change_date#<br>
    </cfoutput>

    <hr>

    <h2>Change to:</h2>
    <cfoutput>
        <form id="frm_enterBugForm" name="frm_enterBugForm" method="post" action="bug_edit_action.cfm">
            <p>
                <label for="fld_description">Short Description</label>
                <input type="text" name="fld_description" id="fld_description" value="#bugs_list.bug_title#"/>
            </p>
            <p>
                <label for="fld_details">Long Description</label>
                <textarea rows="1" cols="75" name="fld_details" id="fld_details">#bugs_list.bug_details#</textarea>
            </p>

            <p>
                <label for="fld_status">Updated Status (New/Open/Solved/Closed):</label>
                <input type="text" name="fld_status" id="fld_status" value="#bugs_list.bug_status#" />
            </p>
            <p>
                <label for="fld_urgency">Urgent? (Very, Urgent, Non-urgent, No)</label>
                <input type="text" name="fld_urgency" id="fld_urgency" value="#bugs_list.bug_urgency#" />
            </p>
            <p>
                <label for="fld_crit">Critical? (Crisis, Critical, Non-critical, Request)</label>
                <input type="text" name="fld_crit" id="fld_crit" value="#bugs_list.bug_crit#" />
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
