<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>All The Bugs</title>
</head>

<body>
    <nav>
        <a href="signup.cfm">SIGN UP</a> | <a href="signin.cfm">SIGN IN</a> |
        <a href="list_of_bugs.cfm">BUGS</a> | <a href="history.cfm">HISTORY</a> | <a href="signout.cfm">SIGN OUT</a>
    </nav>

    <hr>

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
    </cfoutput>
    <form action="bug.cfm" method="get">
        <button name="fld_id" value="#bugs_list.bug_id#">ADD</button>
    </form>
</body>

</html>
