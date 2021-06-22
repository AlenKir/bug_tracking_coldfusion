<h1>Users:</h1>
<cfquery name = "users_list" datasource="getit">
    select user_id, username, firstlastname, user_password
    from users
</cfquery>

<cfoutput query="users_list">
#users_list.user_id#, #users_list.username#, #users_list.firstlastname#, #users_list.user_password#<br>
</cfoutput>

<h1>Bugs:</h1>
<cfquery name = "bugs_list" datasource="getit">
    select bug_id, bug_title, bug_details, creator_id, bug_status, bug_urgency, bug_crit
    from bugs
</cfquery>

<cfoutput query="bugs_list">
#bugs_list.bug_id#, #bugs_list.bug_title#, #bugs_list.bug_details#, #bugs_list.creator_id#, #bugs_list.bug_status#, #bugs_list.bug_urgency#, #bugs_list.bug_crit#<br>
</cfoutput>

<h1>History:</h1>
<cfquery name = "changes_list" datasource="getit">
    select change_id, bug_id, changer_id, change_action, change_comment, change_date
    from changes
</cfquery>

<cfoutput query="changes_list">
#changes_list.change_id#, #changes_list.bug_id#, #changes_list.changer_id#, #changes_list.change_action#, #changes_list.change_comment#, #changes_list.change_date#<br>
</cfoutput>