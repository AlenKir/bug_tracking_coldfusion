<cfset EmployeeID=ListFirst(GetAuthUser())>
    <cfset EmployeeName=ListRest(GetAuthUser())>
        <cfoutput>
            Welcome, #EmployeeID#! You can change your profile here:<br>
            <hr>
        </cfoutput>


        <cfquery name="get_user" datasource="getit">
            select user_id, username, firstlastname, user_password
            from users
        </cfquery>

        <cfoutput query="get_user">
            <cfif #get_user.username# EQ #EmployeeID#>
                <form id="frm_enterUserInfoForm" name="frm_enterUserInfoForm" method="post" action="user_edit_action.cfm">
                
                    <p style="visibility: hidden">
                        <label for="fld_username">Username:</label>
                        <input type="text" name="fld_username" id="fld_username" value="#get_user.username#" />
                    </p>

                    <p>
                        <label for="fld_firstlastname">First & Last Name:</label>
                        <input type="text" name="fld_firstlastname" id="fld_firstlastname" value="#get_user.firstlastname#" />
                    </p>
                    
                    <p>
                        <label for="fld_password">Password:</label>
                        <input type="text" name="fld_password" id="fld_password" value="#get_user.user_password#" />
                    </p>

                    <p>
                        <input type="submit" name="fld_submitUserInfoForm" id="fld_submitUserInfoForm" value="Submit" />
                    </p>

                </form>
            </cfif>
        </cfoutput>
