
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Send Email</title>

    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/bootstrap-theme.css" rel="stylesheet">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

    <link href="/static/js/jquery-ui/jquery-ui.min.css">
    <link href="/static/js/jquery-ui/jquery-ui.theme.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">


</head>
<body>
%include('base_header.html')
<div class="col-md-6 col-md-offset-3">
    <form method="post" action="/upload" enctype="multipart/form-data">

        <legend>Apply Job from {{id_job['apply']}}</legend><br>

        <div class="form-group">
            <label for="name">Your Name</label><br>
            <input id="name" name="name" class="form-control" type="text" placeholder="Name" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label><br>
            <input id="email" class="form-control" name="email" type="email" placeholder="Email" required>
        </div>
         <div class="form-group">
            <label for="">Message</label><br>
            <textarea class="form-control" required name="category"></textarea>
         </div>
         <div class="form-group">
            <label>File Curriculum</label><br>
            <input type="file" name="upload" required>
        </div>
        <input type="hidden" value="{{id_job['apply']}}" name="id_job"/>
        <button type="submit" class="btn btn-default">Send</button>

    </form>
</div>

%include('base_foot.html')
</body>
</html>
