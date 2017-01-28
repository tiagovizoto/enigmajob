<!DOCTYPE html>
<html lang="en">
<head>
     <meta charset="UTF-8">
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/bootstrap-theme.css" rel="stylesheet">
    <script src="/static/js/jquery-ui/jquery-ui.min.js"></script>
    <link href="/static/js/jquery-ui/jquery-ui.min.css">
    <link href="/static/js/jquery-ui/jquery-ui.theme.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>About</title>
</head>
<body>
%include('base_header.html')


<dl class="dl-horizontal">
    <dt>Job Id:</dt>
    <dd>{{job['_id']}}</dd>
    <dt>Job:</dt>
    <dd>{{job['title']}}</dd>
    <dt>Salary: </dt>
    <dd>{{job['salary']['coin']}} {{job['salary']['value']}} by {{job['salary']['period_pay']}}</dd>
    <dt>Location: </dt>
    <dd>{{job['location']}}</dd>
    <dt>Description:</dt>
    <dd>{{job['description']}}</dd>
    <dt>Date Posting</dt>
    <dd>{{job['date_post']}}</dd>
    <dt>Date Expired</dt>
    <dd>{{job['date_valid']}}</dd>
    <br>

    <dd>
    <form method="post" action="/sendMail">
    <INPUT TYPE="hidden" NAME="id_job" VALUE="{{job['_id']}}">
       <button  class="btn btn-primary btn-lg "  type="submit" >Apply</button>
      </form>
    </dd>
   </dl>



%include('base_foot.html')
</body>
</html>
