<?php
include_once('../Utilities/database.php');
    $type_chart = $_POST['type_chart'];
    $id_region = $_REQUEST["id_region"];
    if ($id_region == 0){
        $title = "Region sales chart";
        $data = Load_All_Region();
    }
    else{
        $title = "Sales chart by region";
        $data = Load_Sale_Region($id_region);
    }

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chart Region</title>
    <script src="./Chart.js"></script>
</head>
<body>
    <h1><?php echo $title?></h1>
    <canvas id="chart_region" style="width: 100%;" height="400"></canvas>
    <script>
           var ctx = document.getElementById("chart_region");
           var data={
               labels:[
                   <?php foreach($data as $etiqueta):?>
                   "<?php echo $etiqueta['x'];?>",
                   <?php endforeach; ?>
               ],
               datasets:[{
                   label:'Sales by office',
                   data:[
                       <?php foreach($data as $value):?>
                       <?php echo $value['y'];?>,
                       <?php endforeach;?>
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
