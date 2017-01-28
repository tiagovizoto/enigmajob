
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/static/v/css/foundation.min.css">
    <link rel="stylesheet" href="/static/v/css/app.css">

    <meta name="description" content="Enigma Jobs é um site de empregos para profissonais a Tecnologia da Informação e Exatas. Que tem o objetivo de ser simples e eficiente" />
    <meta name="keywords" content="Vagas, Carreias, Trabalho, Freelancer, TI, Desenvolvimento, Programador, Analista, job, careers, work, free, IT, development, programmer" />
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
      <div class="row column">




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
         %include('script.html')
        <div class="row medium-12 large-12 columns">
          %count = 0
          % for job in jobs:
          <div class="callout">
            <a href="/job/{{job['_id']}}"><h1>{{job['title']}} <small>{{job['date_post']}}</small></h1></a>
            <b id="b">{{job['business']['name']}} - {{job['location']}}</b>
            <p>{{job['description'][:351]+"..."}}</p>

            <b>{{job['salary']['coin']}} ${{job['salary']['value']}} por {{job['salary']['period_pay']}}</b>
            
            </div>

          %count=count+1
          %end
          </div>
        </div>
        <!--pagination-->
        <ul class="pagination text-center" role="navigation" aria-label="Pagination">
  %if numero > 0:
          <li class="pagination-previous"><a href="/page/{{numero-1}}">Previous</a></li>
        <li class="current"><span class="show-for-sr">You're on page</span>{{numero+1}}</li>
     %else:
        <li class="pagination-previous"><a href="/page/0">Previous</a></li>
        <li class="current"><span class="show-for-sr">You're on page</span>1</li>
%end
  %print(numero)

  %if numero < pagination:
      %for i in range(pagination):
      <li><a href="/page/{{ i }}" aria-label="Page {{i+1}}">{{i+1}}</a></li>
      %end
  %else:
      %for i in range(pagination):
      <li><a href="/page/{{ i+numero }}" aria-label="Page {{i+numero}}">{{i+numero}}</a></li>
      %end
  %end
  <li class="pagination-next"><a href="/page/{{numero+1}}" aria-label="Next page">Next</a></li>
</ul>
      </div>
    </div>

  <!-- close wrapper, no more content after this -->
  </div>
  </div>
   </div>

  </body>
</html>
