<!--- PutOmnichannelVoice Query to insert call data that meets requirements if form exists --->
<cfif isdefined('form.to') and len(form.to) gt 0 and isdefined('form.body') and len(form.body) gt 0>
    <cfquery name="PutOmnichannelVoice" datasource="omnichannel">
        INSERT INTO omnichannel.omnichannel_queue
        SET to_number = <CFQUERYPARAM VALUE="#form.to#" CFSQLType="CF_SQL_VARCHAR">,
        body = <CFQUERYPARAM VALUE="#left(form.body,160)#" CFSQLType="CF_SQL_VARCHAR">,
        qt_id = 2
    </cfquery>
    INSERTED SMS
    <cfset form.to = ''>
    <cfset form.body = ''>
</cfif>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>SMS with ColdFusion & Twilio/Sendgrid!</title>
</head>
<body>   
    <div id="container">
        <h1>SMS with ColdFusion & Twilio/Sendgrid!</h1>
        <form action="" method="post">
            <div class="form-outline mb-4">
                <label for="exampleFormControlInput1" class="form-label">To Phone Number</label>
                <input type="phone" class="form-control" name="to" id="to" placeholder="+1234567890">
            </div>
            <div class="form-outline mb-4">
                <label for="exampleFormControlInput1" class="form-label">Example Message Area</label>
                <input type="text" class="form-control" name="body" id="body" placeholder="Welcome ">
            </div>
            <!--- <div class="mb-3">
                <label for="exampleFormControlTextarea1" class="form-label">Example textarea</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
            </div> --->
            
            <br>
            <button type="submit" class="btn btn-primary btn-block mb-4">Send SMS</button>
        </form>
    </div>
    
</body>
</html>


<cfdump var="#form#">
