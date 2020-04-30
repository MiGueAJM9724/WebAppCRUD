$(init);
function init(){
  //code block to open modal window
  $('#table_region').load('loadtable.php');
  $('#modal_region').modal();
  Validate_Form();
  $('#btn_add').on('click', function(){
    $('#modal_region').modal('open');
  });

  $(document).on("click",'.edit', function(){
      var id = $(this).attr("data-id");
      var name = $(this).attr("data-name");
      $("#id_region").val(id);
      $("#name_region").val(name);
      $("#modal_region").modal('open');
  });

  $(document).on("click",".delete", function(){
      var id = $(this).attr("data-id");
      var sURL = "delete.php";
      var form = "id_region=" + id;
      $.ajax({
          type: "post",
          url: sURL,
          dataType: 'json',
          data: form,
          success: function(request){
              if(request['status']==1){
              $("#table_region").load('loadtable.php');
              M.toast({html: 'Delete region', classes: 'rounded blue lighten-2'});
              }
          }
      });
  });

  $('#btn_save').on('click', function(){
    $('#form_region').submit();
  //  M.toast({html: 'Save region', classes: 'rounded blue lighten-2'});
  });
}

function Validate_Form(){
    $("#form_region").validate({
        rules:{
            'name_region':{required: true, minlength:5,maxlength:40},
        },
        messages:{
            'name_region':{required: "Required", minlength:"Minimum 5 characters",maxlength:"Maximum 40 characters"},
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
    var form = $("#form_region").serialize();
    var id = $("#id_region").val();
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
                $("#modal_region").modal('close');
                $("#table_region").load("loadtable.php");
                M.toast({html: 'Save region', classes: 'rounded blue lighten-2'});
            }
        }
    });
}
