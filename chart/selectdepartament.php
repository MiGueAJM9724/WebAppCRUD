<?php
    include_once("../Utilities/database.php");
    $tuplas = Select_Departament();
    echo "<option value='0'>All departament of chart</option>";
    foreach ($tuplas as $tupla){
       $id_departament = $tupla['iddepto'];
       $name = $tupla['nomdepto'];
       echo "<option value='$id_departament'>$name</option>";
    }
?>
