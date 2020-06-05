<?php
    include_once('../Utilities/database.php');
    $tuplas = Select_Region();
    echo "<option value= '0'>All region to chart </option>";
    foreach ($tuplas as $tupla) {
        $id_region = $tupla['idreg'];
        $name_region = $tupla['nomreg'];
        echo "<option value= '$id_region'>$name_region</option>";
    }
?>
