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
        select change_id, bug_id, changer_id, change_action, change_comment, change_date
        from changes
    </cfquery>

    <cfoutput query="changes_list">
        <!--        #changes_list.change_id#,-->
        <strong>Bug:</strong>
        <cfquery name="find_bug_title" datasource="getit">
            select bug_title from bugs where bug_id=#changes_list.bug_id#
        </cfquery>
        <cfoutput>#find_bug_title.bug_title#</cfoutput>
        <br>
        <strong>User:</strong>
        <cfquery name="find_username" datasource="getit">
            select username from users where user_id=#changes_list.changer_id#
        </cfquery>
        <cfoutput>#find_username.username#</cfoutput>
        <br>
        <strong>Action:</strong>
        #changes_list.change_action#,
        <br>
        <strong>Message:</strong>
        #changes_list.change_comment#,
        #changes_list.change_date#
        <br>
        <hr>
    </cfoutput>

</body>

</html>
