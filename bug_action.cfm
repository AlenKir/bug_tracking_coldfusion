<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>Check. Bug entry</title>
</head>

<body>
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

    <cfquery name="add_bug" datasource="getit">
        insert into bugs (bug_title, bug_details, creator_id, bug_status, bug_urgency, bug_crit, bug_whenfound) values ('#form.fld_description#', '#form.fld_details#', 1, '#form.fld_status#', '#form.fld_urgency#', '#form.fld_crit#', '2021-06-22')
    </cfquery>

</body>

</html>
