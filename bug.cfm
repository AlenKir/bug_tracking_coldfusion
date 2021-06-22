<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>Enter Bug</title>
</head>

<body>
    <nav>
        <a href="signup.cfm">SIGN UP</a> | <a href="signin.cfm">SIGN IN</a> |
        <a href="list_of_bugs.cfm">BUGS</a> | <a href="history.cfm">HISTORY</a> | <a href="signout.cfm">SIGN OUT</a>
    </nav>

    <hr>

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
            <label for="fld_status">Status (New, Open, Solved, Closed)</label>
            <input type="text" name="fld_status" id="fld_status" />
        </p>
        <p>
            <label for="fld_urgency">Urgent? (Very, Urgent, Non-urgent, No)</label>
            <input type="text" name="fld_urgency" id="fld_urgency" />
        </p>
        <p>
            <label for="fld_crit">Critical? (Crisis, Critical, Non-critical, Request)</label>
            <input type="text" name="fld_crit" id="fld_crit" />
        </p>
        <p>
            <cfset DateToday=now()>
                <cfscript>
                    dateformat1= DateFormat(#DateToday#,"e")
                    dateformat= DateFormat(#DateToday#)
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
