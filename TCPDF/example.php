<?php
    include_once("library/tcpdf.php");
    $pdf = new TCPDF('p','mm','A4');

    $pdf ->setPrintHeader(false);
    $pdf ->setPrintFooter(false);
     
    $pdf ->AddPage();
    $pdf ->setFont('Courier','',14);
    $pdf ->Cell(190,10,"Inventario de productos",0,1,'C');
    $pdf ->setFont('Times',10);
    $pdf ->Cell(30,5,"Departamento:",0);
    $pdf ->Cell(160,5,"Deportes",0);
    $pdf ->Ln();
    $pdf ->Ln();
    $html ="
        <table>
            <tr>
                <th>ID</th>
                <th>Nombre del producto</th>
                <th>Existencia</th>
                <th>Precio</th>
            </tr>
            <tr>
                <td>1</td>
                <td>Balon de futbol</td>
                <td>100</td>
                <td>320</td>
            </tr>
            <tr>
                <td>2</td>
                <td>Balon de basquetbol</td>
                <td>20</td>
                <td>200</td>
            </tr>
            <tr>
                <td>3</td>
                <td>Tennis Nike</td>
                <td>10</td>
                <td>800</td>
            </tr>
            <tr>
                <td>4</td>
                <td>Porteria mini</td>
                <td>4</td>
                <td>500</td>
            </tr>
            <tr>
                <td>5</td>
                <td>Raqueta de tenis</td>
                <td>11</td>
                <td>100</td>
            </tr>
            <tr>
                <td>6</td>
                <td>Tennis Adidas</td>
                <td>5</td>
                <td>1200</td>
            </tr>
        </table>
        <style>
              table{ border-collapse:collapse;}
              th,td{border:1px, solid #408;}
        </style>
        ";
        $pdf ->WriteHTMLCell(192,0,9,'',$html,0);

    $pdf ->Output();
?>