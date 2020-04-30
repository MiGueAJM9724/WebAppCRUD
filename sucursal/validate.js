$(init);
function init(){
  //code block to open modal window
  $('#table_sucursal').load('loadtable.php');
  $('#modal_sucursal').modal();
  Validate_Form();
  $('#btn_add').on('click', function(){
    $("#id_sucursal").val('');
    $("#name_sucursal").val('');
    $('#cp').val('');
    $('#id_region').val('1');
    $('#id_region').formSelect();
    $('#modal_sucursal').modal('open');
    $('#name_sucursal').focus();
  });

  $(document).on("click",'.edit', function(){
      var id = $(this).attr("data-id");
      var name = $(this).attr("data-name");
      var cp = $(this).attr("data-cp");
      var id_region = $(this).attr("data-id_region");
      $("#id_sucursal").val(id);
      $("#name_sucursal").val(name);
      $('#cp').val(cp);
      $('#id_region').val(id_region);
      $('#id_region').formSelect();
      M.updateTextFields();
      $("#modal_sucursal").modal('open');
  });

  $(document).on("click",".delete", function(){
      var id = $(this).attr("data-id");
      var sURL = "delete.php";
      var form = "id_sucursal=" + id;
      $.ajax({
          type: "post",
          url: sURL,
          dataType: 'json',
          data: form,
          success: function(request){
              if(request['status']==1){
              $("#table_sucursal").load('loadtable.php');
              M.toast({html: 'Delete sucursal', classes: 'rounded blue lighten-2'});
              }
          }
      });
  });

  $('#btn_save').on('click', function(){
    $('#form_sucursal').submit();
  //  M.toast({html: 'Save region', classes: 'rounded blue lighten-2'});
  });
}

function Validate_Form(){
    $("#form_sucursal").validate({
        rules:{
            'name_sucursal':{required: true, minlength:5,maxlength:40},
            'cp':{required: true,digits:true, maxlength:5}
        },
        messages:{
            'name_sucursal':{required: "Required", minlength:"Minimum 5 characters",maxlength:"Maximum 40 characters"},
            'cp':{required: 'Requiered',digits:'digits', maxlength:'Maximun 5 characters'}
        },
        errorElement:"div",
        errorClass:"invalid",
        errorPlacement:function(error,element){
            error.insertAfter(element)
        },
        submitHandler: function(form){
            Save_Data();
        }

    });
}

function Save_Data(){
    var sURL = ""
    var form = $("#form_sucursal").serialize();
    var id = $("#id_sucursal").val();
    if (id != "")
        sURL = "update.php";
    else
        sURL = "insert.php";
    $.ajax({
        type: "post",
        url: sURL,
        dataType: 'json',
        data: form,
        success: function(request){
            if(request['status']==1){
                $("#modal_sucursal").modal('close');
                $("#table_sucursal").load("loadtable.php");
                M.toast({html: 'Save sucursal', classes: 'rounded blue lighten-2'});
            }
        }
    });
}
