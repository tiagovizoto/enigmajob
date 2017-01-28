<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/static/v/css/foundation.min.css">
    <link rel="stylesheet" href="/static/v/css/app.css">

    <meta name="description" content="Publique sua vaga na EnigmaJobs. Enigma Jobs é um site de empregos para profissonais a Tecnologia da Informação e Exatas. Que tem o objetivo de ser simples e eficiente" />
    <meta name="keywords" content="job, careers, work, free, IT, development, programmer,vagas,programacao, desenvolvimento" />
    <meta name="title" content="New Job - Enigma Jobs " />
    <title>Enigma Jobs - New Job</title>
    <style media="screen">
      label{
        font-size: 16px;

        font-weight: bold;
      }

    </style>
  </head>
  <body >
    <div class="off-canvas-wrapper">
  <div class="off-canvas-wrapper-inner" data-off-canvas-wrapper>

    %from datetime import datetime, timedelta
    <div class="off-canvas-content" data-off-canvas-content>
      
    <!-- off-canvas title bar for 'small' screen -->
  %include('base_top_bar.html')
    <!-- original content goes in this container -->

      <div class="row column muhaha">

                 %include('script.html')

        <br>
          <h3 class="center">Nova Vaga</h3>
        <form action="/add" method="post" >
      <div class="row">
        <div class="medium-6 columns">
          <label>Titulo
            <input type="text" required name="title" placeholder="Programmer COBOL">
          </label>
        </div>
        <div class="medium-6 columns">
          <label>Localização
            <input type="text" required name="location" placeholder="Curitba, PR , BRASIL">
          </label>
        </div>

      </div>
      <div class="row">
        <div class="medium-6 columns">
            <label>Seu email
              <input type="email" required name="email" placeholder="E-mail">
            </label>
          </div>
          <div class="medium-3 columns">
            <label>Nome da Empresa
              <input type="text" name="business" required placeholder="Ghostbusters Inc.">
            </label>
          </div>
          <div class="medium-2 columns">
            %futuro = datetime.now()
            %futuro += timedelta(days=30)

              <label>Data de expiração
                <input name="date_valid"  value={{futuro.strftime("%Y-%m-%d")}} id="" required type="date">
              </label>
            </div>
      </div>
        <div class="row">
          <div class="medium-4 columns">

              <label>Salario
                  <select name="salary" >
                    <option value="<500"> < R$500</option>
                    <option value="500/1000">R$ 500 - 1000</option>
                    <option value="1000/2000">R$ 1000 - 2000</option>
                    <option value="2000/3000">R$ 2000 - 3000</option>
                    <option value="3000/8000">R$ 3000 - 8000</option>
                    <option value="10000">$10000 ></option>


                  </select>
                </label>

          </div>
          <fieldset class=" medium-4 columns">
            <legend>Moeda</legend>
            <input type="radio" name="coin" value="USD" id="pokemonRed" required><label for="pokemonRed">USA</label>
            <input type="radio" name="coin" value="BRL" id="pokemonBlue"><label for="pokemonBlue">BRL</label>
            <input type="radio" name="coin" value="BTC/USD" id="pokemonYellow"><label for="pokemonYellow">BTC/USD</label>
          </fieldset>
          <fieldset class="medium-4 columns">
            <legend>Pagamento por</legend>
            <input type="radio" name="period_pay" value="Hora" id="1" required><label for="1">Hora</label>
            <input type="radio" name="period_pay" value="Mesal" id="2"><label for="2">Mês</label>
            <input type="radio" name="period_pay" value="Semanal" id="3"><label for="3">Semana</label>
            <input type="radio" name="period_pay" value="Anual" id="4"><label for="4">Ano</label>
          </fieldset>
        </div>
          <div class="row  medium-12 columns">
            <label>Link Externo para a Vaga ( É opcional. Você não receberá currículos no seu email caso preencha este campo )
              <input type="text" value="" name="linkjob" placeholder="http://empresa.com/vaga/programador_java">
            </label>
          </div>
        <div class="row medium-12 columns">
          <label>Descrição da Vaga
          <textarea required name="description" required rows=5 placeholder="Free"></textarea>
          </label>
        </div>
        <button type="submit" class="success expanded button"><b>Postar</b></button>
    </form>
        <!--pagination-->
        <script type="text/javascript">

        function preDate() {
                var d = new Date( Date.now()),
                    month = '' + (d.getMonth() + 1),
                    day = '' + (30+d.getDate()),
                    year = d.getFullYear();
                if (d.getDate() > 30){
                  month = '' + (d.getMonth() + 2),
                  day = '' + d.getDate()
                };
                if (month.length < 2) month = '0' + month;
                if (day.length < 2) day = '0' + day;

                return String([year, month, day].join('-'));
              }
              document.getElementById("demo").value = preDate()
          console.log(preDate());
        </script>

      </div>
    </div>

  <!-- close wrapper, no more content after this -->
  </div>
  </div>









  </body>
</html>
