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
</body>

</html>
