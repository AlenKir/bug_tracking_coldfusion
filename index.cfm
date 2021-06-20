<cfset Session.username = "Anon">
<cfif Session.username eq "Anon">
  Please Sign Up!
<cfelse>
  <cfoutput>
      Welcome, #Session.Username#!
  </cfoutput>
</cfif>