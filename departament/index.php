<!DOCTYPE html>
<html lang="es"> 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Region-Template</title>
    <!-- Importa librerias de estilos de Materialize, DataTable e Iconos -->
    <link type="text/css" rel="stylesheet" href="../css/materialize.min.css" media="screen,projection"/>
    <link type="text/css" rel="stylesheet" href="../css/dataTables.materialize.css"/>
    <link type="text/css" rel="stylesheet" href="../css/default.css"/>
    <link rel="icon" type="image/x-icon" href="../fonts/favicon.ico" />
</head>
<body>
<!-- La siguiente linea importa un programa de php el cual incluye un menu
  de tipo NavBar de Materialize y corresponde al Header de la página-->
<?php include_once("../resources/html/header.php"); ?>

<!-- Colocar su código a partir de este comentario -->
<div class="container">
    <div class="row">
       <div class="card">
           <a id="btn_add" class= "btn-floating btn-large waves effect waves-light right">
              <i class="material-icons">add</i>
           </a>
           <div class="card-content">
              <span><h3>Departament</h3></span>
              <div id="table_dapartament">
              
              </div>
           </div>
       </div>
    </div>
</div>
<div class="modal" id="modal_departament">
    <div class="modal-content">
         <h4>CRUD Departament</h4>
         <br>
         <form id="form_departament" method="POST">
              <div class="row">
                  <div class="input-field col s12">
                      <input type="hidden" id="id_departament" name="id_departament">
                  </div>
              </div>
              <div class="row">
                   <div class="input-field col s12">
                        <input type="text" id="name_departament" name="name_departament" class="validate">
                        <label for="name_departament">Name to the departament:</label>
                   </div>
              </div>
         </form>
    </div>
    <div class="modal-footer">
    <a id="btn_save" class="modal-action waves-effect waves-light btn"><i class="material-icons right">check</i>Save</a>
    </div>
</div>
<!-- La siguiente linea incluye el footer de nuestra página web -->
<?php include_once("../resources/html/footer.php"); ?>

<!-- Importa librerias de JavaScript de Jquery, Jaquery Validate, DataTable
     y Materialize                                                       -->
<script type="text/javascript" src="../js/jquery-3.0.0.min.js"></script>
    <script type="text/javascript" src="../js/materialize.min.js"></script>
    <script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../js/dataTables.materialize.js"></script>
    <script type="text/javascript" src="./validate.js"></script>
    <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
    <script type="text/javascript">
     $(document).ready(function(){
        $('select').formSelect();
        $('.sidenav').sidenav();
        $(".dropdown-trigger").dropdown();
     });

    </script>
</body>
</html>
