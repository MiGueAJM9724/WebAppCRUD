<?php
    include_once("../utilities/database.php");
    $post = $_POST;

    if(!isset($_SESSION)){
        session_start();
    }
    $id_session = session_id();

    $result = Validate_user($post, $id_session);
    if($result){
        $_SESSION['email']= $post['email'];
        $response["status"] = 1;
        $response["data"]= $post;
    } else{
        $response["status"] = 0;
        $response["data"]= $post;
    }
    echo json_encode($response);
?>
