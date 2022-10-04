<!--- //////////////////////////////////////////////////////////////////////
    email.cfm  provides interface form utilizing  Bootstrap 5.2 & CKeditor 5 
    form data is sent via model cfc Omnichannel.cfc to input data into mysql
//////////////////////////////////////////////////////////////////////  --->

<!--- PutOmnichannelEmail Query to insert email data that meets requirements if form exists --->

<cfif isdefined('form.to') and len(form.to) gt 0 and isdefined('form.from') and len(form.from) gt 0 and isdefined('form.body') and len(form.body) gt 0 and isdefined('form.subject') and len(form.subject) gt 0>
    <cfquery name="PutOmnichannelEmail" datasource="omnichannel">
        INSERT INTO omnichannel.omnichannel_queue
        SET to_email = <CFQUERYPARAM VALUE="#form.to#" CFSQLType="CF_SQL_VARCHAR">,
        from_email = <CFQUERYPARAM VALUE="#form.from#" CFSQLType="CF_SQL_VARCHAR">,
        body = <CFQUERYPARAM VALUE="#form.body#" CFSQLType="CF_SQL_VARCHAR">,
        subject = <CFQUERYPARAM VALUE="#form.subject#" CFSQLType="CF_SQL_VARCHAR">,
        qt_id = 1
    </cfquery>
     INSERTED EMAIL
     <cfset form.to = ''>
     <cfset form.from = ''>
     <cfset form.body = ''>
     <cfset form.subject = ''>
</cfif>

<!--- Bootstrap 5.2 Source Code  --->


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>ColdFusion & Twilio/Sendgrid!</title>
    <!--- CKeditor 5 Source Code  --->
    <script src="https://cdn.ckeditor.com/ckeditor5/35.1.0/super-build/ckeditor.js"></script>
</head>
<body>   
    <!--- Beginning of Bootstrap container  --->
    <div id="container">
        <h1>Welcome to OmniChannel Communication with ColdFusion & Twilio/Sendgrid!</h1>
        <!--- Beginning of Form, post page back to self  incorperating form validation on submit controls via Bootstrap--->
        <form action="" method="post">
            <div class="form-outline mb-4">
                <label for="exampleFormControlInput1" class="form-label">From Email address</label>
                <input type="email" class="form-control" name="from" id="from" placeholder="from@example.com">
            </div>
            <div class="form-outline mb-4">
                <label for="exampleFormControlInput1" class="form-label">To Email address</label>
                <input type="email" class="form-control" name="to" id="to" placeholder="to@example.com">
            </div>
            <div class="form-outline mb-4">
                <label for="exampleFormControlInput1" class="form-label">Subject</label>
                <input type="text" class="form-control" name="subject" id="subject" placeholder="OmniChannel Communications with ColdFusion & Twilio/SendGrid">
            </div>
            <div class="form-outline mb-4">
                <!--- editor is the javascript variable used to indicate where ckeditor will replace the element with editor --->
                <textarea name="body" id="editor" placeholder="Welcome to OmniChannel Correspondence with ColdFusion & Twilio/Sendgrid!">
                </textarea>
            </div>
            <br>
            <button type="submit" class="btn btn-primary btn-block mb-4">Send Email</button>
        </form>
    </div>
    <!--- ckeditor configuration --->
    <script>
         CKEDITOR.ClassicEditor.create(document.getElementById("editor"), {
                    toolbar: {
                        items: [
                            'exportPDF','exportWord', '|',
                            'findAndReplace', 'selectAll', '|',
                            'heading', '|',
                            'bold', 'italic', 'strikethrough', 'underline', 'code', 'subscript', 'superscript', 'removeFormat', '|',
                            'bulletedList', 'numberedList', 'todoList', '|',
                            'outdent', 'indent', '|',
                            'undo', 'redo',
                            '-',
                            'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
                            'alignment', '|',
                            'link', 'insertImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
                            'specialCharacters', 'horizontalLine', 'pageBreak', '|',
                            'textPartLanguage', '|',
                            'sourceEditing'
                        ],
                        shouldNotGroupWhenFull: true
                    },
                    // Changing the language of the interface requires loading the language file using the <script> tag.
                    // language: 'es',
                    list: {
                        properties: {
                            styles: true,
                            startIndex: true,
                            reversed: true
                        }
                    },
                    heading: {
                        options: [
                            { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
                            { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
                            { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
                            { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
                            { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' },
                            { model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5' },
                            { model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6' }
                        ]
                    },
                    placeholder: 'Welcome to OmniChannel Correspondence with ColdFusion & Twilio/Sendgrid!',
                    fontFamily: {
                        options: [
                            'default',
                            'Arial, Helvetica, sans-serif',
                            'Courier New, Courier, monospace',
                            'Georgia, serif',
                            'Lucida Sans Unicode, Lucida Grande, sans-serif',
                            'Tahoma, Geneva, sans-serif',
                            'Times New Roman, Times, serif',
                            'Trebuchet MS, Helvetica, sans-serif',
                            'Verdana, Geneva, sans-serif'
                        ],
                        supportAllValues: true
                    },
                    // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
                    fontSize: {
                        options: [ 10, 12, 14, 'default', 18, 20, 22 ],
                        supportAllValues: true
                    },
                    // Be careful with the setting below. It instructs CKEditor to accept ALL HTML markup.
                    // https://ckeditor.com/docs/ckeditor5/latest/features/general-html-support.html#enabling-all-html-features
                    htmlSupport: {
                        allow: [
                            {
                                name: /.*/,
                                attributes: true,
                                classes: true,
                                styles: true
                            }
                        ]
                    },
                    // https://ckeditor.com/docs/ckeditor5/latest/features/link.html#custom-link-attributes-decorators
                    link: {
                        decorators: {
                            addTargetToExternalLinks: true,
                            defaultProtocol: 'https://',
                            toggleDownloadable: {
                                mode: 'manual',
                                label: 'Downloadable',
                                attributes: {
                                    download: 'file'
                                }
                            }
                        }
                    },
                    // The "super-build" contains more premium features that require additional configuration, disable them below.
                    // Do not turn them on unless you read the documentation and know how to configure them and setup the editor.
                    removePlugins: [
                        // These two are commercial, but you can try them out without registering to a trial.
                        // 'ExportPdf',
                        // 'ExportWord',
                        'CKBox',
                        'CKFinder',
                        'EasyImage',
                        // This sample uses the Base64UploadAdapter to handle image uploads as it requires no configuration.
                        // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/base64-upload-adapter.html
                        // Storing images as Base64 is usually a very bad idea.
                        // Replace it on production website with other solutions:
                        // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/image-upload.html
                        // 'Base64UploadAdapter',
                        'RealTimeCollaborativeComments',
                        'RealTimeCollaborativeTrackChanges',
                        'RealTimeCollaborativeRevisionHistory',
                        'PresenceList',
                        'Comments',
                        'TrackChanges',
                        'TrackChangesData',
                        'RevisionHistory',
                        'Pagination',
                        'WProofreader',
                        // Careful, with the Mathtype plugin CKEditor will not load when loading this sample
                        // from a local file system (file://) - load this site via HTTP server if you enable MathType
                        'MathType'
                    ]
                });
    </script>
</body>
</html>

<!--- dump form variables for viewing --->
<cfdump var="#form#">
