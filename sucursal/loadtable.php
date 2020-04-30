<?php
    include_once("../utilities/dataBase.php");

    $tuplas = Select_Sucursal();
    //var_dump($tuplas);
    echo "<table id='table' class='highlight responsive-table'>
    <thead><tr><th>Name of the sucursal</th><th>CP</th><th>Region</th><th>Edit / Delete</th></tr></thead>
    <tbody>";
    foreach($tuplas as $tupla){
        $id_sucursal = $tupla ["idsuc"];
        $name_sucursal = $tupla  ["nomsuc"];
        $cp = $tupla ["cp"];
        $id_region = $tupla ["idreg"];
        $name_region = $tupla ["nomreg"];
        echo "<tr><td>$name_sucursal</td><td>$cp</td><td>$name_region</td><td><i class='material-icons edit' data-id='$id' data-name='$name'>create</i>&nbsp&nbsp&nbsp&nbsp<i class='material-icons delete' data-id='$id'>delete_forever</i></td></tr>";

    }
    echo"</tbody>
    </table>";
?>
