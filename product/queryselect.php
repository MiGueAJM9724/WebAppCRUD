<?php
    include_once("../Utilities/database.php");
    $tuplas = Select_Departament();
    foreach($tuplas as $tupla){
        $id = $tupla ["iddepto"];
        $name = $tupla  ["nomdepto"];
        echo "<option value='$id'>$name</option>";
    }
?>
