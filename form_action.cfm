<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>Check</title>
</head>

<body>
    <cfoutput>
        <p>Welcome #form.fld_firstName# #form.fld_lastName#!</p>
            <cfset session.username=form.fld_username>
        <p>[#form.fld_password#]</p>
    </cfoutput>
</body>

</html>
