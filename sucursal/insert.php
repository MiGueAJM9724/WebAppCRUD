<?php
    include_once("../utilities/dataBase.php");

    $post = $_POST;
    $result = Insert_Sucursal($post);
    if($result){
        $response["status"] = 1;
        $response["data"]= $post;
    } else{
        $response["status"] = 0;
        $response["data"]= $post;
    }
    echo json_encode($response);
?>
