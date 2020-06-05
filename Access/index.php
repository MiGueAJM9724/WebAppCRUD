<!DOCTYPE html>
<html lang="es">
<head> 
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Template Login</title>
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
    <div class="col s12 m8 offset-m2">
      <div class="card">
        <div class="card-content">
          <span class='card-title'>Access control</span>
          <br>
          <form id='form_login' name='form_login' method="post">
            <div class="row">
              <div class="input-field col s12">
                <input type="text" name="email" id='email' class="validate">
                <label for="email" class='active'>Email: </label>
              </div>
            </div>
            <div class="row">
              <div class="input-field clo s12">
                <input type="password" name="passwd" id='passwd' class="validate">
                <label for="passwd" class='active'>Password: </label>
              </div>
            </div>
            <div class="row">
              <div class="input-field col s12 center-align">
                <a id="btnLogin" class='waves-effect waves-light btn'>
                  <i class='material-icons right'>security</i>
                  Sing in
                </a>
                <a id="btnRegister" class='modal-action waves-effect waves-light btn'>
                  <i class='material-icons right'>security</i>
                  Register
                </a>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="modal" id="modal_register">
    <div class="modal-content">
         <h4>Register Users</h4>
         <br>
         <form id="form_register" method="POST">
              <div class="row">
                  <div class="input-field col s12">
                      <input type="text" id="corru" name="corru" class="validate">
                      <label for="corru">Email</label>
                  </div>
              </div>
              <div class="row">
                   <div class="input-field col s12">
                        <input type="text" id="nameu" name="nameu" class="validate">
                        <label for="nameu">Username:</label>
                   </div>
              </div>
              <div class="row">
                   <div class="input-field col s12">
                        <input type="password" id="contu" name="contu" class="validate">
                        <label for="contu">Password:</label>
                   </div>
              </div>
         </form>
    </div>
    <div class="modal-footer">
      <a id="btn_save" class="modal-action waves-effect waves-light btn"><i class="material-icons right">check</i>Register</a>
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
    <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="./validate.js"></script>
    <script type="text/javascript">
     $(document).ready(function(){
        $('select').formSelect();
        $('.sidenav').sidenav();
        $(".dropdown-trigger").dropdown();
     });

    </script>
</body>
</html>
