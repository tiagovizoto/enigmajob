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
    <meta name="title" content="Enigma Jobs - Carees" />
    <title>Enigma Jobs - Carees</title>

  </head>
  <body>

    <div class="off-canvas-wrapper">
  <div class="off-canvas-wrapper-inner" data-off-canvas-wrapper>

    <!-- off-canvas title bar for 'small' screen -->
      %include('base_top_bar.html')

    <!-- original content goes in this container -->
    <div class="off-canvas-content" data-off-canvas-content>
               %include('script.html')

      <div class="row column">


        <br>


          %if vagas.count() == 0:
          <div class="large-6 large-centered columns">
            <img src="/static/img/pandaa.jpg">
          </div>
          %else:
        <div class="row medium-12 large-12 columns">
          %count = 0
          % for job in vagas:
          <div class="callout">
            <a href="/job/{{job['_id']}}"><h3>{{job['title']}} <small>{{job['date_post']}}</small></h3></a>
            <b id="b">{{job['business']['name']}} - {{job['location']}}</b>
            <p>{{job['description']}}</p>

            <b>{{job['salary']['coin']}} {{job['salary']['value']}} by {{job['salary']['period_pay']}}</b>
                <br><br>
              <div class="row medium-12 large-12 columns">
                  <a class="warning button" href="/manager/edit/{{job['_id']}}">Edit</a>
                  <a class="alert button" data-open="exampleModal1">Delete</a>

                <div class="reveal" id="exampleModal1" data-reveal>
                     <button class="close-button" aria-label="Close alert"  data-close type="button">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    <p style="font-size:26px" align="center">Você quer realmente deletar?</p>

                    <a href="/manager/delete/{{job['_id']}}" class="button alert expanded"><b>Sim, eu quero deletar!!</b></a>
                </div>
              </div>
          </div>



          %count=count+1
          %end
            %end

        </div>


         <script src="/static/v/js/vendor/jquery.js"></script>
    <script src="/static/v/js/vendor/what-input.js"></script>
    <script src="/static/v/js/vendor/foundation.js"></script>
    <script src="/static/v/js/app.js"></script>

          </div>
        </div>
        <!--pagination-->
      </div>
    </div>

  <!-- close wrapper, no more content after this -->
  </div>
  </div>
   </div>

  </body>
</html>
