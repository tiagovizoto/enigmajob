<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/static/v/css/foundation.min.css">
    <link rel="stylesheet" href="/static/v/css/app.css">

    <meta name="description" content="EnigmaJobs is website from Careers." />
    <meta name="keywords" content="job, careers, work, free, IT, development, programmer" />
    <meta name="title" content="Enigma Jobs" />
    <title>Enigma Jobs - Carees</title>

  </head>
  <body>

    <div class="off-canvas-wrapper">
  <div class="off-canvas-wrapper-inner" data-off-canvas-wrapper>

    <!-- off-canvas title bar for 'small' screen -->
      %include('base_top_bar.html')

    <!-- original content goes in this container -->
    <div class="off-canvas-content" data-off-canvas-content>
      <div class="row column">
        <br>

        <br>
        <form action="/search" method="post" >
        <div class="row medium-12 large-12 columns">
          <div class="input-group">
            <span class="input-group-label">EJ</span>
            <input name="pass_key" class="input-group-field" type="text">
            <div class="input-group-button">
              <input type="submit" class="button" value="Search">
            </div>
          </div>
        </div>
        </form>
        <div class="row medium-12 large-12 columns">
          %count = 0
          % for job in results:
          <div class="callout">
            <a href="/job/{{job['_id']}}"><h3>{{job['title']}} <small>{{job['date_post']}}</small></h3></a>
            <h5><b>{{job['business']['name']}} - {{job['location']}}</b></h5>
            <p>{{job['description']}}</p>
            %if job['salary']['value'] == 'null':
            <b>Negotiable Salary</b>
            %else:
            <b>{{job['salary']['coin']}} R$ {{job['salary']['value']}} por {{job['salary']['period_pay']}}</b>
            %end
            </div>
          </div>
          %count=count+1
          %end

        </div>
        <!--pagination-->

      </div>
    </div>

  <!-- close wrapper, no more content after this -->
  </div>
  </div>
    <!--<script src="/static/v/js/vendor/jquery.js"></script>
    <script src="/static/v/js/vendor/what-input.js"></script>
    <script src="/static/v/js/vendor/foundation.js"></script>
    <script src="/static/v/js/app.js"></script>-->
  </body>
</html>
