<!--- checks to make sure user has permission to view this page. --->
<cfif not IsUserInRole("User")>
Not logged inn.
<cfelse>
Logged in.
</cfif>