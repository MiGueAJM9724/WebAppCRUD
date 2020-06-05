<?php
    if  (!isset($_SESSION)){
      session_start();
      $email = "";
    }
    $email = isset($_SESSION["email"])?$_SESSION["email"]:"";
    $id_session = session_id();
?>
<header>
<!-- Dropdown Structure -->
<ul id="dropdown1" class="dropdown-content">
  <li><a href="../region/">Regions</a></li>
  <li><a href="../Sucursal/">Sucursal</a></li>
  <li><a href="../departament/">Departament</a></li>
  <li class="divider"></li>
  <li><a href="../product/">Products</a></li>
</ul>
<nav class="indigo darken-4">
  <div class="nav-wrapper">
    <a href="../Home/" class="brand-logo">Logo</a>
    <ul class="right hide-on-med-and-down">
      <li><a href="../region/">Regions</a></li>
      <li><a href="../Sucursal/">Sucursal</a></li>
      <li><a href="../departament/">Departament</a></li>
      <li><a href="../product/">Products</a></li>
      <!-- Dropdown Trigger -->
      <li><a class="dropdown-trigger" href="#!" data-target="dropdown1">Catalogos<i class="material-icons right">arrow_drop_down</i></a></li>
      <?php
          if ($email == "")
             echo "<li><a href='../Access/''>Sing in</a></li>";
          else
             echo "<li><a href='../Access/logout.php''>$email(Log out)</a></li>";
      ?>
    </ul>
  </div>
</nav>

  <ul id="slide-out" class="sidenav">
    <li><div class="user-view">
      <div class="background">
        <img src="../Imagenes/office.jpg">
      </div>
      <a href="#user"><img class="circle" src="../Imagenes/Tecnm.png"></a>
      <a href="#name"><span class="black-text name">Alex Lora</span></a>
      <a href="#email"><span class="black-text email">alguzman@itroque.edu.mx</span></a>
    </div></li>
    <li><a href="#!"><i class="material-icons">cloud</i>First Link With Icon</a></li>
    <li><a href="#!">Second Link</a></li>
    <li><div class="divider"></div></li>
    <li><a class="subheader">Sistemas y Computación</a></li>
    <li><a href="sass.html">Sass</a></li>
    <li><a href="badges.html">Components</a></li>
    <li><a href="collapsible.html">JavaScript</a></li>
  </ul>
  <a href="#" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">menu</i></a>

</header>
