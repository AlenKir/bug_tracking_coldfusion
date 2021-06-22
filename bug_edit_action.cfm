<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>Edited Bug Entry</title>
</head>

<body>
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

        <form action="list_of_bugs.cfm" method="get">
            <button>SEE ALL BUGS</button>
        </form>

</body>

</html>