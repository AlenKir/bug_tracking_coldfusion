    <cfquery name="add_user" datasource="getit">
        insert into users (username, firstlastname, user_password) values ('#form.fld_username#', '#form.fld_name#', '#form.fld_password#')
    </cfquery>

    <h2>
        <cfoutput>
            <p>Welcome, #form.fld_name#!</p>
        </cfoutput>
    </h2>