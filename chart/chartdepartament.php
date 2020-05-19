<?php
include_once('../Utilities/database.php');
    $type_chart = $_POST['type_chart'];
    $id_departament = $_REQUEST["id_departament"];
    if ($id_departament == 0){
        $title = "departament sales chart";
        $data = Load_All_Departament();
    }
    else{
        $title = "Sales Chart by departament";
        $data = Load_Sale_Departament($id_departament);
    }

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chart Departament</title>
    <script src="./Chart.js"></script>
</head>
<body>
    <h1><?php echo $title?></h1>
    <canvas id="chart_departament" style="width: 100%;" height="400"></canvas>
    <script>
           var ctx = document.getElementById("chart_departament");
           var data={
               labels:[
                   <?php foreach($data as $etiqueta):?>
                   "<?php echo $etiqueta['x'];?>",
                   <?php endforeach; ?>
               ],
               datasets:[{
                   label:'Ventas por Departamento',
                   data:[
                       <?php foreach($data as $valores): ?>
                       <?php echo $valores['y']; ?>,
                       <?php endforeach; ?>
                   ],
                   backgroungColor: "#3898db",
                   borderColor: "#9b56b6",
                   borderWidth: 2
               }]
           };
            var options = {
                scales:{
                    yAxes:[{
                        ticks: {
                            beginAtZero:true
                        }
                    }]
                }
            };
            var chart1 = new Chart(ctx,{
                type: '<?php echo $type_chart;?>',
                data: data,
                options: options
            });
    </script>
</body>
</html>
