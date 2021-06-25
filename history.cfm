<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>Bug History</title>
</head>

<body>

    <h1>History of changes:</h1>
    <cfquery name="changes_list" datasource="mygetit">
        select * from changes
        inner join bugs
        on changes.bug_id=bugs.bug_id
        inner join users
        on changes.changer_id=users.user_id
    </cfquery>

    <cfoutput query="changes_list">
<!--        (change_id: #changes_list.change_id#)-->
<!--        (bug_id: #changes_list.bug_id#)-->
        <strong>bug title:</strong> #changes_list.bug_title#<br>
        <strong>username:</strong> #changes_list.username#<br>
<!--        (changer_id: #changes_list.changer_id#)-->
        <strong>date:</strong> #changes_list.change_date#<br>
        <strong>action:</strong> #changes_list.change_action#<br>
        <strong>comment:</strong> #changes_list.change_comment#
        <hr>
    </cfoutput>

</body>

</html>
