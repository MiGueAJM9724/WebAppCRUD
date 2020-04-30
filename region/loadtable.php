<?php
    include_once("../utilities/dataBase.php");

    $tuplas = Select_Region();
    //var_dump($tuplas);
    echo "<table id='table' class='highlight responsive-table'>
    <thead><tr><th>Name of the region</th><th>Edit / Delete</th></tr></thead>
    <tbody>";
    foreach($tuplas as $tupla){
        $id = $tupla ["idreg"];
        $name = $tupla  ["nomreg"];
        echo "<tr><td>$name</td><td><i class='material-icons edit' data-id='$id' data-name='$name'>create</i>&nbsp&nbsp&nbsp&nbsp<i class='material-icons delete' data-id='$id'>delete_forever</i></td></tr>";

    }
    echo"</tbody>
    </table>";
?>
