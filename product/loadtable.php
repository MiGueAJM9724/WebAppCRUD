<?php
    include_once("../utilities/database.php");

    $tuplas = Select_Product();
    //var_dump($tuplas);
    echo "<table id='table' class='highlight responsive-table'>
    <thead><tr><th>Name of the product</th><th>Unit</th><th>Departament</th>
    <th>Edit / Delete</th></tr></thead>
    <tbody>";
    foreach($tuplas as $tupla){
        $id_product = $tupla ["idprod"];
        $name_product = $tupla  ["nomprod"];
        $unit = $tupla ["unidadmed"];
        $id_departament = $tupla ["iddepto"];
        $name_departament = $tupla ["nomdepto"];
        echo "<tr><td>$name_product</td><td>$unit</td><td>$name_departament</td>
        <td><i class='material-icons edit hoverable' data-id='$id_product' data-name='$name_product'
        data-unit='$unit' data-id_departament='$id_departament'>create</i>&nbsp&nbsp&nbsp&nbsp
        <i class='material-icons delete' data-id='$id_product'>
        delete_forever</i></td></tr>";

    }
    echo"</tbody>
    </table>";
?>
