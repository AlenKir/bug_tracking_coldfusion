<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>Edit Bug</title>
</head>

<body>
    <cfoutput>

        <cfquery name="bugs_list" datasource="getit">
            select bug_id, bug_title, bug_details, creator_id, bug_status, bug_urgency, bug_crit
            from bugs where bug_id=#form.fld_id#
        </cfquery>

        <cfoutput>
            <strong>Short Description:</strong> #bugs_list.bug_title#, <br> <strong>Details:</strong> #bugs_list.bug_details#, <br> <strong>Status:</strong> #bugs_list.bug_status#, <strong>Urgency:</strong> #bugs_list.bug_urgency#, <strong>Cricicality: </strong>#bugs_list.bug_crit#<br>
            <hr>
        </cfoutput>

        <h2>Change to:</h2>

        <form id="frm_enterBugForm" name="frm_enterBugForm" method="post" action="bug_edit_action.cfm">
            <p>
                <label for="fld_description">Short Description</label>
                <input type="text" name="fld_description" id="fld_description" value="#bugs_list.bug_title#" />
            </p>
            <p>
                <label for="fld_details">Long Description</label>
                <textarea rows="3" cols="45" name="fld_details" id="fld_details">#bugs_list.bug_details#</textarea>
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
                <textarea rows="3" cols="45" name="fld_comment" id="fld_comment"></textarea>
            </p>

            <p>
                <input type="submit" name="fld_submitBugForm" id="fld_submitBugForm" value="Submit" />
            </p>

        </form>

        <!--        select where bug id-->
        <!--   print out where bug id-->
    </cfoutput>
</body>

</html>
