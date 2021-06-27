<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>Enter Bug</title>
</head>

<body>

    <form id="frm_enterBugForm" name="frm_enterBugForm" method="post" action="bug_action.cfm">
        <p>
            <label for="fld_description">Short Description</label>
            <input type="text" name="fld_description" id="fld_description" />
        </p>
        <p>
            <label for="fld_details">Long Description</label>
            <textarea rows="3" cols="45" name="fld_details" id="fld_details"></textarea>
        </p>
        <p>
            <label for="fld_status">Status (0 - New, 1 - Open, 2 - Solved, 3 - Closed)</label>
            <input type="text" name="fld_status" id="fld_status" />
        </p>
        <p>
            <label for="fld_priority">Priority (0 - High, 1 - Medium, 2 - Low)</label>
            <input type="text" name="fld_priority" id="fld_priority" />
        </p>
        <p>
            <label for="fld_severity">Severity (0 - Blocker, 1 - Critical, 2 - Major, 3 - Minor, 4 - Trivial)</label>
            <input type="text" name="fld_severity" id="fld_severity" />
        </p>
        <p>
            <cfset DateToday=now()>
                <cfscript>
                    dateformat = DateFormat(#DateToday#)
                </cfscript>

                <cfoutput>
                    Date: #dateformat#
                </cfoutput>
        </p>
        <p>
            <input type="submit" name="fld_submitBugForm" id="fld_submitBugForm" value="Submit" />
        </p>
    </form>
</body>

</html>
