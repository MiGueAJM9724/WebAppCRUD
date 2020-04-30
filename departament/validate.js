$(init);
function init(){
  //code block to open modal window
  $('#table_dapartament').load('loadtable.php');
  $('#modal_departament').modal();
  Validate_Form();
  $('#btn_add').on('click', function(){
    $('#modal_departament').modal('open');
  });

  $(document).on("click",'.edit', function(){
      var id = $(this).attr("data-id");
      var name = $(this).attr("data-name");
      $("#id_departament").val(id);
      $("#name_departament").val(name);
      $("#modal_departament").modal('open');
  });

  $(document).on("click",".delete", function(){
      var id = $(this).attr("data-id");
      var sURL = "delete.php";
      var form = "id_departament=" + id;
      $.ajax({
          type: "post",
          url: sURL,
          dataType: 'json',
          data: form,
          success: function(request){
              if(request['status']==1){
              $("#table_dapartament").load('loadtable.php');
              M.toast({html: 'Delete departament', classes: 'rounded blue lighten-2'});
              }
          }
      });
  });

  $('#btn_save').on('click', function(){
    $('#form_departament').submit();
  //  M.toast({html: 'Save region', classes: 'rounded blue lighten-2'});
  });
}

function Validate_Form(){
    $("#form_departament").validate({
        rules:{
            'name_departament':{required: true, minlength:5,maxlength:40},
        },
        messages:{
            'name_departament':{required: "Required", minlength:"Minimum 5 characters",maxlength:"Maximum 40 characters"},
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
    var form = $("#form_departament").serialize();
    var id = $("#id_departament").val();
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
                $("#modal_departament").modal('close');
                $("#table_dapartament").load("loadtable.php");
                M.toast({html: 'Save departament', classes: 'rounded blue lighten-2'});
            }
        }
    });
}
