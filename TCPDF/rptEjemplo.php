<?php
    include_once("library/tcpdf.php");
    include_once("../Utilities/database.php");
    $id_region = $_POST["id_region"];
    $res =rptVtasXRegion($id_region);
    $pdf = new TCPDF('p','mm','A4');

    $pdf ->setPrintHeader(false);
    $pdf ->setPrintFooter(false);
     
    $pdf ->AddPage();
    $pdf ->setFont('Helvetica','',14);
    $pdf ->Cell(190,10,"Intituto Tecnologico de Roque",0,1,'C');
    $pdf ->setFont('Helvetica',10);
    $pdf ->Cell(30,5,"Clase",0);
    $pdf ->Cell(160,5,": Negocios Electronicos ll",0);
    $pdf ->Ln();
    $pdf ->Cell(30,5,"Maestro",0);
    $pdf ->Cell(160,5,": Ing. Alex Lora",0);
    $pdf ->Ln();
    $pdf ->Ln();
    $html ="
        <table>
            <tr>
                <th>Region</th>
                <th>Sucursal</th>
                <th>Cliente</th>
                <th>Total</th>
            </tr>";
    foreach ($res as $tupla) {
        $name_region = $tupla['nomreg'];
        $name_sucursal = $tupla['nomsuc'];
        $name_cliente = $tupla['nomcte'];
        $total = $tupla['total'];
        $html = $html . "
            <tr>
                <td>$name_region</td>
                <td>$name_sucursal</td>
                <td>$name_cliente</td>
                <td>$total</td>                 
            </tr>";
    }
    $html = $html . "   
    </table>
    <style>
            table{ border-collapse:collapse;}
            th,td{border:1px, solid #808;}
    </style>
    ";
    $pdf ->WriteHTMLCell(192,0,9,'',$html,0);

    $pdf ->Output();
?>