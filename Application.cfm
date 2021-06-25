<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <cfinclude template="navigation.cfm">
        <cfapplication name="AppName" sessionmanagement="Yes" sessiontimeout="#CreateTimeSpan(0, 0, 30, 0)# ">
            <cfinclude template="login_action.cfm">

</body>

</html>
