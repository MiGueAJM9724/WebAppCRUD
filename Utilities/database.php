<?php
/*
  DataBase utilities 
  Jimenez Melendez Miguel Angel
  Enero 2020
*/
// this is a conection with DataBase PostgreSQL
try{
    $Cn = new PDO('pgsql:host=localhost;port=5432;dbname=negocios;user=postgres;password=972402');
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
