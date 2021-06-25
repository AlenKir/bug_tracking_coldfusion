<!--- checks to make sure user has permission to view this page. --->
<cfif IsUserInRole("User")>
Welcome!
<br> You might want to start with <a href="list_of_bugs.cfm">looking at the list of bugs</a>.
<cfelse>
Not logged in.
</cfif>