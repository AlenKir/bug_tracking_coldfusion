<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>Edited Bug Entry</title>
</head>

<body>

    <nav>
        <a href="signup.cfm">SIGN UP</a> | <a href="signin.cfm">SIGN IN</a> |
        <a href="list_of_bugs.cfm">BUGS</a> | <a href="history.cfm">HISTORY</a> | <a href="signout.cfm">SIGN OUT</a>
    </nav>

    <hr>

    <h2>
        <cfoutput>
            <p>
                <cfset DateToday=now()>
                    <cfscript>
                        dateformat= DateFormat(#DateToday#)
                    </cfscript>

                    <cfoutput>
                        Date: #dateformat#
                    </cfoutput>
            </p>
            <p>
                Short Description: #form.fld_description#.
            </p>
            <p>
                Long Description: #form.fld_details#.
            </p>
            <p>
                Status: #form.fld_status#.
            </p>
            <p>
                Urgent? #form.fld_urgency#.
            </p>
            <p>
                Critical? #form.fld_crit#.
            </p>
        </cfoutput>
    </h2>

    <cfquery name="add_bug" datasource="getit">
        update bugs set bug_title='#form.fld_description#',
        bug_details='#form.fld_details#', creator_id=1,
        bug_status='#form.fld_status#', bug_urgency='#form.fld_urgency#',
        bug_crit='#form.fld_crit#', bug_whenfound='2021-06-22'
        where bug_id=#form.fld_bug_id#
    </cfquery>

    <cfquery name="change" datasource="getit">
        INSERT INTO changes (bug_id, changer_id, change_date, change_action, change_comment) VALUES (#form.fld_bug_id#, 1, '2021-06-22', '#form.fld_status#', '#form.fld_comment#');
    </cfquery>

    <form action="list_of_bugs.cfm" method="get">
        <button>SEE ALL BUGS</button>
    </form>

</body>

</html>
