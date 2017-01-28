<!doctype html>
<html >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<head>

    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/bootstrap-theme.css" rel="stylesheet">
    <link href="/static/js/jquery-ui/jquery-ui.min.css">
    <link href="/static/js/jquery-ui/jquery-ui.theme.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Enigma Job Beta</title>
</head>
<body>


%include('base_header.html')
<form action="/search" method="post" >
<div class=" col-lg-offset-2 col-lg-8">
    <div class="input-group">

      <input type="text" name="pass_key" class="form-control" placeholder="Search for...">
      <span class="input-group-btn">
        <button class="btn btn-default" type="submit">Search!</button>
      </span>

    </div><!-- /input-group -->
  </div>
</form><!-- /.col-lg-6 --><br><br>
<table class="table table-striped">
%count = 0
</table>
% for job in jobs:
<div class="col-xs-12 col-sm-6 col-md-12">
<div class="panel panel-default">
  <div class="panel-body panel-primary">
<dl class="dl-horizontal">
    <dt>Job Id:</dt>
    <dd><a href="/job/{{job['_id']}}">{{job['_id']}}</a></dd>
    <dt>Job:</dt>
    <dd>{{job['title']}}</dd>
    <dt>Salary: </dt>
    %if job['salary']['value'] == 'null':

    <dd>Negotiable</dd>
    %else:
    <dd>{{job['salary']['coin']}} {{job['salary']['value']}} by {{job['salary']['period_pay']}}</dd>
    %end
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
    %count=count+1
    <form method="post" action="/sendMail">
    <INPUT TYPE="hidden" NAME="id_job" VALUE="{{job['_id']}}">
       <button  class="btn btn-primary btn-lg "  type="submit" >Apply</button>
      </form>
    </dd>
   </dl>
</div>
  </div>
</div>
%end

<div class="col-md-6 col-xs-12 col-md-offset-4">
<nav aria-label="Page navigation">
  <ul class="pagination">
    <li>
      <a href="/page/{{numero-1}}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    %print(numero)
    %if numero < 12:
    %for i in range(12):
        <li><a href="/page/{{ i }}">{{i+1}}</a></li>
    %end
    %else:
    %for i in range(12):
        <li><a href="/page/{{ i+12 }}">{{i+13}}</a></li>
    %end
    %end
    <li>
      <a href="/page/{{numero+1}}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

</div>
%include('base_foot.html')
</body>
</html>