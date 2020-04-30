<?php
    include_once("../Utilities/database.php");
    $tuplas = Select_Region();
    foreach($tuplas as $tupla){
        $id = $tupla ["idreg"];
        $name = $tupla  ["nomreg"];
        echo "<option value='$id'>$name</option>";
    }
?>
