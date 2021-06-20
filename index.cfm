<cfset Session.username = "Anon">
<cfif Session.username eq "Anon">
  Please Sign Up!
<cfelse>
  <cfoutput>
      Username: #Session.Username#
  </cfoutput>
</cfif>