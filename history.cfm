<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>Bug History</title>
</head>

<body>

    <nav>
        <a href="signup.cfm">SIGN UP</a> | <a href="signin.cfm">SIGN IN</a> |
        <a href="list_of_bugs.cfm">BUGS</a> | <a href="history.cfm">HISTORY</a> | <a href="signout.cfm">SIGN OUT</a>
    </nav>

    <hr>

    <h1>History:</h1>
    <cfquery name="changes_list" datasource="getit">
        select * from changes
        inner join bugs
        on changes.bug_id=bugs.bug_id
    </cfquery>

    <cfoutput query="changes_list">
<!--        (change_id: #changes_list.change_id#)-->
<!--        (bug_id: #changes_list.bug_id#)-->
        <strong>bug title:</strong> #changes_list.bug_title#
<!--        (changer_id: #changes_list.changer_id#)-->
        <strong>date:</strong> #changes_list.change_date#,
        <strong>action:</strong> #changes_list.change_action#<br>
        <strong>comment:</strong> #changes_list.change_comment#
        <hr>
    </cfoutput>

</body>

</html>
