<?php
    include_once("../utilities/database.php");

    $post = $_POST;
    $result = Delete_Departament($post);
    if($result){
        $response["status"] = 1;
        $response["data"]= $post;
    } else{
        $response["status"] = 0;
        $response["data"]= $post;
    }
    echo json_encode($response);
?>
