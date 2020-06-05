<?php
/*
  DataBase utilities
  Jimenez Melendez Miguel Angel
  Enero 2020
*/
// this is a conection with DataBase PostgreSQL
try{
    $Cn = new PDO('pgsql:host=localhost;port=5432;dbname=Negocios;user=postgres;password=972402');
    //$Cn = new PDO('mysql:host=localhost; dbname=bdalumnos','root','');
    $Cn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $Cn->exec("SET CLIENT_ENCODING TO 'UTF8';");
    //$Cn->exec("SET CHARACTER SET utf8"); // MYSQL
}catch(Exception $e){
    die("Error: " . $e->GetMessage());
}

// function for queries to the DataBase
function Query($query)
{
  global $Cn;
  try{
      $result =$Cn->query($query);
      $resultado = $result->fetchAll(PDO::FETCH_ASSOC);
      $result->closeCursor();
      return $resultado;
  }catch(Exception $e){
      die("Error en la LIN: " . $e->getLine() . ", MSG: " . $e->GetMessage());
  }
}

/*
  function that receives an insert and returns the
  consecutive that I generate in the primary key
*/
function Execute_Consecutively($sentence, $key){
    global $Cn;
    try {
        $result = $Cn->query($sentence);
        $resultado = $result->fetchAll(PDO::FETCH_ASSOC);
        $result->closeCursor();
        //var_dump($resultado);
       // die("AAA");
        return $resultado[0][$key];
    } catch (Exception $e) {
        die("Error in the line: " + $e->getLine() + " MSG: " + $e->GetMessage());
        return 0;
    }
}
// function to run insert, delete and update
function Execute ($sentence){
    global $Cn;
    try {
        $result = $Cn->query($sentence);
        $result->closeCursor();
        return 1; // Exito
    } catch (Exception $e) {
        //die("Error en la linea: " + $e->getLine() + " MSG: " + $e->GetMessage());
        return 0; // Fallo
    }
}

/*
  Regions
*/

function Select_Region()
{
    $query = "SELECT idreg,nomreg FROM ventas.region ORDER BY nomreg";
    return Query($query);
}

function Insert_Region(&$post){
    $name = $post['name_region'];
    $sentence = "INSERT INTO ventas.region(nomreg) VALUES('$name') RETURNING idreg";
    $id = Execute_Consecutively($sentence,"idreg");
    $post['id_region']=$id;
    return $id;
}

function Update_Region($post){
    $id = $post['id_region'];
    $name = $post['name_region'];
    $sentence = "UPDATE ventas.region SET nomreg='$name' WHERE idreg=$id";
    return Execute($sentence);
}

function Delete_Region($post){
    $id = $post['id_region'];
    $sentence = "DELETE FROM ventas.region WHERE idreg=$id";
    return Execute($sentence);
}

/*
  Departament
*/

function Select_Departament()
{
    $query = "SELECT iddepto,nomdepto FROM ventas.departamento ORDER BY nomdepto";
    return Query($query);
}

function Insert_Departamet(&$post){
    $name = $post['name_departament'];
    $sentence = "INSERT INTO ventas.departamento(nomdepto) VALUES('$name') RETURNING iddepto";
    $id = Execute_Consecutively($sentence,"iddepto");
    $post['id_departament']=$id;
    return $id;
}

function Update_Departament($post){
    $id = $post['id_departament'];
    $name = $post['name_departament'];
    $sentence = "UPDATE ventas.departamento SET nomdepto='$name' WHERE iddepto=$id";
    return Execute($sentence);
}

function Delete_Departament($post){
    $id = $post['id_departament'];
    $sentence = "DELETE FROM ventas.departamento WHERE iddepto=$id";
    return Execute($sentence);
}

/*
  Sucursal
*/

function Select_Sucursal()
{
    $query = "SELECT A.idsuc, A.nomsuc, A.cp, A.idreg, B.nomreg FROM ventas.sucursal".
    " A INNER JOIN ventas.region B ON (A.idreg = B.idreg) ORDER BY nomsuc";
    return Query($query);
}

function Insert_Sucursal(&$post){
    $name = $post['name_sucursal'];
    $cp = $post['cp'];
    $id_region = $post['id_region'];
    $sentence = "INSERT INTO ventas.sucursal(nomsuc, cp, idreg) VALUES('$name', '$cp', '$id_region') RETURNING idsuc";
    $id = Execute_Consecutively($sentence,"idsuc");
    $post['id_sucursal']=$id;
    return $id;
}

function Update_Sucursal($post){
    $id = $post['id_sucursal'];
    $name = $post['name_sucursal'];
    $cp = $post['cp'];
    $id_region =$post['id_region'];
    $sentence = "UPDATE ventas.sucursal SET nomsuc='$name', cp='$cp', idreg ='$id_region' WHERE idsuc=$id";
    return Execute($sentence);
}

function Delete_Sucursal($post){
    $id = $post['id_sucursal'];
    $sentence = "DELETE FROM ventas.sucursal WHERE idsuc=$id";
    return Execute($sentence);
}

/*
  Product
*/

function Select_Product()
{
    $query = "SELECT A.idprod, A.nomprod, A.unidadmed, A.iddepto, B.nomdepto ".
    'FROM ventas.producto A INNER JOIN ventas.departamento B ON (A.iddepto = B.iddepto)'.
     " ORDER BY nomprod";
    return Query($query);
}

function Insert_Product(&$post){
    $name = $post['name_product'];
    $unit = $post['unit'];
    $id_departament = $post['id_departament'];
    $sentence = "INSERT INTO ventas.producto(nomprod, unidadmed, iddepto) VALUES".
    "('$name', '$unit', '$id_departament') RETURNING idprod";
    $id = Execute_Consecutively($sentence,"idprod");
    $post['id_product']=$id;
    return $id;
}

function Update_Product($post){
    $id = $post['id_product'];
    $name = $post['name_product'];
    $unit = $post['unit'];
    $id_departament = $post['id_departament'];
    $sentence = "UPDATE ventas.producto SET nomprod='$name', unidadmed='$unit', iddepto".
    "='$id_departament' WHERE idprod=$id";
    return Execute($sentence);
}

function Delete_Product($post){
    $id = $post['id_product'];
    $sentence = "DELETE FROM ventas.producto WHERE idprod=$id";
    return Execute($sentence);
}
/*
Chart Region
*/
function Load_Sale_Region($id_region){
    $query = "SELECT A.nomsuc x,sum(B.importe) y FROM ventas.sucursal A ".
    "INNER JOIN ventas.detalleventa B ON (A.idsuc = B.idsuc) WHERE A.idreg =".
    " $id_region GROUP BY A.nomsuc";
    return Query($query);
}

function Load_All_Region(){
    $query = "SELECT C.nomreg x,sum(B.importe) y FROM ventas.sucursal A ".
    "INNER JOIN ventas.detalleventa B on (A.idsuc = B.idsuc) INNER JOIN ".
    "ventas.region C on (A.idreg = C.idreg)   GROUP BY C.nomreg";
    return Query($query);
}
/*
Chart departament
*/
function Load_Sale_Departament($id_departament){
    $query = "SELECT A.nomprod x, sum(B.importe) y FROM ventas.producto A ".
    "INNER JOIN ventas.detalleventa B ON (A.idprod = B.idprod) WHERE A.iddepto=".
    "$id_departament GROUP BY A.nomprod";
    return Query($query);
}
function Load_All_Departament(){
  $query = "SELECT C.nomdepto x,sum(B.importe) y FROM ventas.producto A ".
  "INNER JOIN ventas.detalleventa B ON (A.idprod = B.idprod) INNER JOIN ".
  "ventas.departamento C ON (A.iddepto = C.iddepto) GROUP BY C.nomdepto";
  return Query($query);
}
/*
Access
*/

function Validate_user($post, $id_session){
  $email = $post['email'];
  $passwd = $post['passwd'];
  $query = "SELECT * FROM ventas.users WHERE email='$email'";
  $res = Query($query);
  if($res){
    $pwd = $res[0]['passwd'];
    if(password_verify($passwd, $pwd)){
        $sentence = "UPDATE ventas.users SET id_session= '$id_session' WHERE email= '$email'";
        $result = Execute($sentence);
      return 1;
    }else return 0;
  }else return 0;
}

function Validate_Option(){
    if(!isset($_SESSION)) session_start();
    $idSess = session_id();
    $email = $_SESSION['email'];
    $query = "SELECT id_session FROM ventas.users WHERE email = '$email'";
    $res = Query($query);

    $sess = $res[0]['id_session'];
    if($res == $idSess) return 1;
    else return "";
}

function insert_USR($post){
    $email = $post['corru'];
    $name = $post['nameu'];
    $passwd = $post['contu'];
    $passwdenc = password_hash($passwd,PASSWORD_DEFAULT);
    $sentence = "INSERT INTO ventas.users(email, username, passwd) VALUES('$email', '$name', '$passwdenc')";
    $ok = Execute($sentence);
    return $ok;
}
/*
    Reports-TCPDF
*/
function rptVtasXRegion($id_region){
    $query = "SELECT nomreg, nomsuc, nomcte, sum(importe) total
    FROM ventas.region A INNER JOIN ventas.sucursal B ON (A.idreg = B.idreg)
    INNER JOIN ventas.cliente C ON (B.idsuc = C.idsuc)
    INNER JOIN ventas.venta D ON (C.idcte = D.idcte)
    INNER JOIN ventas.detalleventa E ON (D.foliovta = E.foliovta)
    WHERE A.idreg = $id_region    
    GROUP BY nomreg, nomsuc, nomcte";
    return Query($query);
}

/*
Validar  palabras reservadas
trin elimina espacios ya sea al final o al priuncipio
stripslashes agrega un slash mas para anular el ingresado
*/
function val_input($data){
    $data = trim($data);
    $data = str_replace("'", "", $data);
    $data = str_replace("select", "", $data);
    $data = str_replace("SELECT", "", $data);
    $data = str_replace("Select", "", $data);
    $data = str_replace("drop", "", $data);
    $data = str_replace("Drop", "", $data);
    $data = str_replace("DROP", "", $data);
    $data = str_replace("delete", "", $data);
    $data = str_replace("DELETE", "", $data);
    $data = str_replace("Delete", "", $data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

/*
function rptAllRegion(){
    $query= "Select nomreg, nomsuc, nomcte, sum(importe)
    From ventas.region A Inner Join ventas.sucursal B ON (A.idreg = B.idreg)
        inner Join ventas.cliente C ON (B.idsuc = C.idsuc)
        Inner join ventas.venta D ON (C.idcte = D.idcte)
        Inner Join ventas.detalleventa E ON (D.foliovta = E.foliovta)
        Group By nomreg, nomsuc, nomcte"
}
*/

