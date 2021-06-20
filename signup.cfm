<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Sign Up</title>
</head>

<body>
<form id="frm_signupForm" name="frm_signupForm" method="post" action="form_action.cfm">
  <p>
    <label for="fld_firstName">Your First Name</label>
    <input type="text" name="fld_firstName" id="fld_firstName" />
  </p>
  <p>
    <label for="fld_lastName">Your Last Name</label>
    <input type="text" name="fld_lastName" id="fld_lastName" />
  </p>
  <p>
    <label for="fld_password">Password</label>
    <input type="text" name="fld_password" id="fld_password" />
  </p>
  <p>
    <input type="submit" name="fld_submitForm" id="fld_submitForm" value="Submit" />
  </p>
</form>
</body>
</html>
