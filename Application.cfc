<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>Application.cfc</title>
</head>

<body style="background-color:aliceblue;width=50%;margin-left: 20%;">

    <nav>
        <a href="signup.cfm">SIGN UP</a> | <a href="signin.cfm">SIGN IN</a> |
        <a href="list_of_bugs.cfm">BUGS</a> | <a href="history.cfm">HISTORY</a> |    
        <form action="signin.cfm" method="post">
        <button type="submit" name="Logout" value="Logout" class="btn-link" style="border:none;background-color: transparent;">
        LOG OUT
        </button>

        </form>
    </nav>

    <hr>

<cfcomponent> 
<cfset This.name = "BugTracking"> 
<cfset This.Sessionmanagement="True"> 
<cfset This.loginstorage="session"> 
 
<cffunction name="OnRequestStart"> 
    <cfargument name = "request" required="true"/> 
    <cfif IsDefined("Form.logout")> 
        <cflogout> 
    </cfif> 
 
    <cflogin> 
        <cfif NOT IsDefined("cflogin")> 
            <cfinclude template="loginform.cfm"> 
            <cfabort> 
        <cfelse> 
            <cfif cflogin.name IS "" OR cflogin.password IS ""> 
                <cfoutput> 
                    <h2>You must enter text in both the username and password fields. 
                    </h2> 
                </cfoutput> 
                <cfinclude template="loginform.cfm"> 
                <cfabort> 
            <cfelse> 
                <cfquery name="loginQuery" dataSource="getit"> 
                SELECT username, firstlastname as Roles
                FROM users 
                WHERE
                    username = '#cflogin.name#' 
                    AND user_password = '#cflogin.password#' 
                </cfquery>
                <cfif loginQuery.Roles NEQ ""> 
                    <cfloginuser name="#cflogin.name#" Password = "#cflogin.password#" 
                        roles="#loginQuery.Roles#"> 
                <cfelse> 
                    <cfoutput> 
                        <H2>Your login information is not valid.<br> 
                        Please try again.</H2> 
                    </cfoutput>     
                    <cfinclude template="loginform.cfm"> 
                    <cfabort> 
                </cfif> 
            </cfif>     
        </cfif> 
    </cflogin> 
 
   <div style="visibility: hidden;">
    <cfif GetAuthUser() NEQ ""> 
        <cfoutput> 
                <form action="signin.cfm" method="Post"> 
                <input type="submit" Name="Logout" value="Logout"> 
            </form> 
        </cfoutput> 
    </cfif> 
    </div>
 
</cffunction> 
</cfcomponent>
</body>

</html>