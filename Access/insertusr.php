<?php
    include_once("../Utilities/database.php");
    //Validar cont6enido de las cajas de texto
    $post['corru'] = val_input(isset($post['corru'])?$post['corru']:"");
    $post['nameu'] = val_input(isset($post['nameu'])?$post['nameu']:"");
    $post['contu'] = val_input(isset($post['contu'])?$post['contu']:"");
    
    $post = $_POST;
    $result = Insert_USR($post);
    if($result){
        $response["status"] = 1;
        $response["data"]= $post;
    } else{
        $response["status"] = 0;
        $response["data"]= $post;
    }
    echo json_encode($response);
?>
