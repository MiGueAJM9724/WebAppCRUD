$(init);
function init(){
  //code block to open modal window
  $('#table_product').load('loadtable.php');
  $('#modal_product').modal();
  Validate_Form();
  $('#btn_add').on('click', function(){
    $("#id_product").val('');
    $("#name_product").val('');
    $('#unit').val('');
    $('#id_departament').val('1');
    $('#id_departament').formSelect();
    $('#modal_product').modal('open');
    $('#name_product').focus();
  });

  $(document).on("click",'.edit', function(){
      var id = $(this).attr("data-id");
      var name = $(this).attr("data-name");
      var unit = $(this).attr("data-unit");
      var id_departament = $(this).attr("data-id_departament");
      $("#id_product").val(id);
      $("#name_product").val(name);
      $('#unit').val(unit);
      $('#id_departament').val(id_departament);
      $('#id_departament').formSelect();
      M.updateTextFields();
      $("#modal_product").modal('open');
  });

  $(document).on("click",".delete", function(){
      var id = $(this).attr("data-id");
      var sURL = "delete.php";
      var form = "id_product=" + id;
      $.ajax({
          type: "post",
          url: sURL,
          dataType: 'json',
          data: form,
          success: function(request){
              if(request['status']==1){
              $("#table_product").load('loadtable.php');
              M.toast({html: 'Delete product', classes: 'rounded blue lighten-2'});
              }
          }
      });
  });

  $('#btn_save').on('click', function(){
    $('#form_product').submit();
  //  M.toast({html: 'Save region', classes: 'rounded blue lighten-2'});
  });
}

function Validate_Form(){
    $("#form_product").validate({
        rules:{
            'name_product':{required: true, minlength:5,maxlength:40},
            'unit':{required: true,minlength:2, maxlength:2}
        },
        messages:{
            'name_product':{required: "Required", minlength:"Minimum 5 characters",maxlength:"Maximum 40 characters"},
            'unit':{required: 'Requiered',digits:'Minimum 2 characters', maxlength:'Maximun 2 characters'}
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
    var form = $("#form_product").serialize();
    var id = $("#id_product").val();
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
                $("#modal_product").modal('close');
                $("#table_product").load("loadtable.php");
                M.toast({html: 'Save product', classes: 'rounded blue lighten-2'});
            }
        }
    });
}
