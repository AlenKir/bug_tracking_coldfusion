<cfcomponent> 
<cfset This.name = "Orders"> 
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
 
    <cfif GetAuthUser() NEQ ""> 
        <cfoutput> 
                <form action="securitytest.cfm" method="Post"> 
                <input type="submit" Name="Logout" value="Logout"> 
            </form> 
        </cfoutput> 
    </cfif> 
 
</cffunction> 
</cfcomponent>