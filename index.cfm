<nav>
    <a href="signup.cfm">SIGN UP</a> | <a href="signin.cfm">SIGN IN</a> |
    <a href="list_of_bugs.cfm">BUGS</a> | <a href="history.cfm">HISTORY</a> | <a href="signout.cfm">SIGN OUT</a>
</nav>

<cfset Session.username="Anon">
    <cfif Session.username eq "Anon">
        Please Sign Up!
        <cfelse>
            <cfoutput>
                Welcome, #Session.Username#!
            </cfoutput>
    </cfif>
