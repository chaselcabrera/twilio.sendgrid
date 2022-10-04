<!--- PutOmnichannelVoice Query to insert call data that meets requirements if form exists --->
<cfif isdefined('form.to') and len(form.to) gt 0>
    <cfquery name="PutOmnichannelVoice" datasource="omnichannel">
        INSERT INTO omnichannel.omnichannel_queue
        SET to_number = <CFQUERYPARAM VALUE="#form.to#" CFSQLType="CF_SQL_VARCHAR">,
        qt_id = 3
    </cfquery>
    INSERTED Voice Call
    <cfset form.to = ''>
</cfif>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Voice with ColdFusion & Twilio/Sendgrid!</title>
</head>
<body>   
    <div id="container">
        <h1>Voice with ColdFusion & Twilio/Sendgrid!</h1>
        <form action="" method="post">
            <div class="form-outline mb-4">
                <label for="exampleFormControlInput1" class="form-label">Calling Phone Number</label>
                <input type="phone" class="form-control" name="to" id="to" placeholder="+1234567890">
            </div>      
            <br>
            <button type="submit" class="btn btn-primary btn-block mb-4">Call Phone Number</button>
        </form>
    </div>
    
</body>
</html>


<cfdump var="#form#">


