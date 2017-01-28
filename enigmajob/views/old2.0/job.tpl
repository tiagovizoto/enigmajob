<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/static/v/css/foundation.min.css">
    <link rel="stylesheet" href="/static/v/css/app.css">
  <meta name="description" content="{{job['description']}}" />
    <meta name="keywords" content="Vagas, Carreias, Trabalho, Freelancer, TI, Desenvolvimento, Programador, Analista " />
    <meta name="title" content="{{job['title']}}" />
    <title> {{job['title']}}  -- Enigma Jobs</title>
    <style>
      .az{
      font-size:115%
      }

    </style>
  </head>
  <body>

    <div class="off-canvas-wrapper">
  <div class="off-canvas-wrapper-inner" data-off-canvas-wrapper>

    <!-- off-canvas title bar for 'small' screen -->
      %include('base_top_bar.html')

    <!-- original content goes in this container -->
    <div class="off-canvas-content" data-off-canvas-content>
      <div class="row large-8 large-centered column">

                     %include('script.html')

        <br>

        <h2><b>{{job['title']}} </b></h2>
        <br>
        <small><h4>{{job['date_post']}}</h4></small>
          <p class="az">{{job['business']['name']}} - {{job['location']}}</p>
          <p class="az"><b>Salary: {{job['salary']['coin']}} {{job['salary']['value']}} por {{job['salary']['period_pay']}} </b></p>
          <p>{{job['description']}} </p>
        %if not job['link']:
              <div class="row">
                <div class="medium-3 columns ">

                  <a class="primary large button" data-open="exampleModal2"><b>Apply</b></a>

                </div>
              </div>

              <div class="reveal" id="exampleModal2" data-reveal>
                <h5>Curriculum para {{job['title']}} </h5>
                <form method="post" action="/upload" enctype="multipart/form-data">
                      <div class="row">
                        <div class="medium-6 columns">
                          <label>Nome
                            <input type="text" name="name" placeholder="Tony Stark">
                          </label>
                        </div>

                        <div class="medium-6 columns">
                          <label>EMail
                            <input type="email" required name="email" placeholder="myemail@myproved.com">
                          </label>
                        </div>
                      </div>
                      <div class="row">
                        <div class="medium-5 columns">
                          <b>Dicas</b>
                          <ul style="color:red">
                            <li>Não informe dados pessoais</li>
                            <li>Não informe seu endereço</li>
                            <li>Curriculum em PDF</li>
                          </ul>
                        </div>
                        <br>
                        <div class="medium-6 columns">
                          <label>Arquivo Curriculum</label><br>
                          <input type="file" accept="application/pdf,application/msword,application/odt" name="upload" required>
                        </div>
                      </div>
                      <div class="row medium-12 columns">
                        <label>Messagem
                        <textarea required name="category" rows=5 placeholder="None"></textarea>
                        </label>
                        <INPUT TYPE="hidden" NAME="id_job" VALUE="{{job['_id']}}">
                        <INPUT TYPE="hidden" NAME="title_job" VALUE="{{job['title']}}">

                      </div>

                      <button type="submit" class=" success button" name="button" id="submit" >Enviar Curriculum</button>
                    </form>
                <button class="close-button" data-close aria-label="Close reveal" type="button">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              %else:
              <div class="row">
                      <div class="medium-3 columns ">

                        <a class="primary large button" href="{{job['link']}}" "><b>Apply</b></a>

                      </div>
              </div>
              %end
      </div>
    </div>

  <!-- close wrapper, no more content after this -->
  </div>
  </div>







    <script src="/static/v/js/vendor/jquery.js"></script>
    <script src="/static/v/js/vendor/what-input.js"></script>
    <script src="/static/v/js/vendor/foundation.js"></script>
    <script src="/static/v/js/app.js"></script>
  </body>
</html>
