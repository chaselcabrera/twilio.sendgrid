<!--- //////////////////////////////////////////////////////////////////////
    omnichannel_sender.cfm  is a scheduled task that send email/sms/voice messages 
    form data extracted ffrom Omnichannel mysql database
//////////////////////////////////////////////////////////////////////  --->

<!---////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                         EMAIL
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --->

<!--- getOmnichannelEmails Query to pull all emails that meet data requirements and have not been sent --->
<cfquery name="getOmnichannelEmails" datasource="omnichannel">
    select  * 
    from omnichannel.omnichannel_queue oq
    join credentials c on oq.qt_id =c.qt_id
    where sent = 0
    and oq.qt_id = 1
    and from_email is not null
    and to_email is not null
    and subject is not null
    and body is not null
</cfquery>

<!--- When getOmnichannelEmails query contains records send CFMAIL request to sendgrid for smtp transaction email request--->
<cfif getOmnichannelEmails.recordCount gt 0>
    <cfoutput query="getOmnichannelEmails">
        <!--- SMTP Request --->
        <cfmail from="#from_email#" to="#to_email#" replyto="#replyto_email#" bcc="#bcc_email#" cc="#cc_email#" subject="#subject#" username="apikey" password="#api_key#" server="smtp.sendgrid.net" port="587" type="html">
                <cfmailparam name="X-SMTPAPI" value="{""unique_args"": {""OQ_ID"": ""#OQ_ID#""}}">
            #body#
        </cfmail>
    <!--- Update record to sent--->
    <cfquery name="setOQEmailSent" datasource="omnichannel">
        update omnichannel_queue 
        set sent = 1
        where sent = 0
        and qt_id = <CFQUERYPARAM VALUE="#OQ_ID#" CFSQLType="CF_SQL_INTEGER">
    </cfquery>
    </cfoutput>
    <!--- Output Results --->
    Email Was Sent!
    <cfdump var="#getOmnichannelEmails#">
</cfif>
<!--- display email results --->

<!---////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                         SMS
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --->

<!--- getOmnichannelSMS Query to pull all SMS messages that meet data requirements and have not been sent --->
<cfquery name="getOmnichannelSMS" datasource="omnichannel">
    select  * 
    from omnichannel.omnichannel_queue oq
    join credentials c on oq.qt_id =c.qt_id
    where sent = 0
    and oq.qt_id = 2
    and to_number is not null
    and body is not null
   </cfquery>


<!--- When getOmnichannelSMS query has more than one record, send API request to sms message--->
<cfif getOmnichannelSMS.recordCount gt 0>
    <cfoutput query="getOmnichannelSMS">
        <cfhttp result="twilio_sms_repsonse" method="post" url="https://api.twilio.com/2010-04-01/Accounts/#account_sid#/Messages.json" username="#account_sid#" password="#auth_token#">
        <!--- Post the FROM number. --->
        <cfhttpparam type="formfield" name="From" value="#phone#"/>
        <!---Post the TO number. This is going to be recipient of our outgoing text message.--->
        <cfhttpparam type="formfield" name="To" value="#to_number#"/>
        <!---Post the Body. This is going to be the contents of our outgoing text message.--->
        <cfhttpparam type="formfield" name="Body" value="#body# - #DateTimeFormat(now(),"mmm dd, yyyy h:mm tt")#"/>
        <!--- Include an image using the code below --->
        <!--- <cfhttpparam type="formfield" name="MediaUrl" value="https://www.idlememe.com/wp-content/uploads/2022/06/monday-meme-idlememe-18.jpg"> --->
        </cfhttp>
        
        <!--- Update record to sent--->
        <cfquery name="setOQSMSSent" datasource="omnichannel">
            update omnichannel_queue 
            set sent = 1
            where sent = 0
            and oq_id = <CFQUERYPARAM VALUE="#OQ_ID#" CFSQLType="CF_SQL_INTEGER">
        </cfquery>
    </cfoutput>
    <!--- Output Results --->
    Email Was Sent!
    <cfdump var="#getOmnichannelSMS#">
</cfif> 

<!---////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                         VOICE
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --->

<!--- getOmnichannelVoice Query to pull all Voice Phone messages that meet data requirements and have not been sent --->
<cfquery name="getOmnichannelVoice" datasource="omnichannel">
    select  * 
    from omnichannel.omnichannel_queue oq
    join credentials c on oq.qt_id =c.qt_id
    where sent = 0
    and oq.qt_id = 3
    and to_number is not null
   </cfquery>

   
<!--- Start a call from coldfusion --->
<!--- make the rest request --->
<cfif getOmnichannelVoice.recordCount gt 0>
    <cfoutput query="getOmnichannelVoice">
    <cfhttp result="twilio_calls_repsonse" method="post" url="https://api.twilio.com/2010-04-01/Accounts/#account_sid#/Calls" username="#account_sid#" password="#auth_token#">
        <cfhttpparam type="formfield" name="From" value="#phone#"/>
        <cfhttpparam type="formfield" name="To" value="#to_number#"/>
        <cfhttpparam type="formfield" name="Url" value="https://demo.twilio.com/docs/voice.xml"/>
    </cfhttp>
    <!--- Update record to sent--->
    <cfquery name="setOQPhoneSent" datasource="omnichannel">
        update omnichannel_queue 
        set sent = 1
        where sent = 0
        and oq_id = <CFQUERYPARAM VALUE="#OQ_ID#" CFSQLType="CF_SQL_INTEGER">
    </cfquery>
    </cfoutput>
    <!--- Output Voice/Call Results --->
    Email Was Sent!
    <cfdump var="#twilio_calls_repsonse#">
</cfif>


