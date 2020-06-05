$(init);
function init(){
  $("#modal_register").modal();
  Validate_Form();

  $('#btnRegister').on('click', function(){
    $("#modal_register").modal('open');
  });

  $('#btn_save').on('click', function(){
    $('#form_register').submit();
  });

  $('#btnLogin').on('click', function(){
    $('#form_login').submit();
  });
}
function Validate_Form(){
    $("#form_login").validate({
        rules:{
            'email':{required:true,
              email:true,
              minlength:3,
              maxlength:100
            },
            'passwd':{
              required:true,
              minlength:3,
              maxlength:32
            }
        },
        messages:{
          'email':{
            required:'required field',
            email:'Invalid email',
            minlength:'Minimum characters are 3',
            maxlength:'Maximum characters are 100'
          },
          'passwd':{
            required:'Required field',
            minlength:'Minimum characters are 3',
            maxlength:'Maximum characters are 32'
          }
        },
        errorElement:"div",
        errorClass:"invalid",
        errorPlacement:function(error,element){
            error.insertAfter(element)
        },
        submitHandler: function(form){
            Validate_Data();
        }

    });

    $("#form_register").validate({
      rules:{
          'corru':{
            required:true,
            email:true,
            minlength:3,
            maxlength:100
          },
          'contu':{
            required:true,
            minlength:3,
            maxlength:100
          },
          'nameu':{
            required:true,
            minlength:3,
            maxlength:100
          }
      },
      messages:{
        'corru':{
          required:'required field',
          email:'Invalid email',
          minlength:'Minimum characters are 3',
          maxlength:'Maximum characters are 100'
        },
        'contu':{
          required:'Required field',
          minlength:'Minimum characters are 3',
          maxlength:'Maximum characters are 100'
        },
        'nameu':{
          required:'Required field',
          minlength:'Minimum characters are 3',
          maxlength:'Maximum characters are 32'
        }
      },
      errorElement:"div",
      errorClass:"invalid",
      errorPlacement:function(error,element){
          error.insertAfter(element)
      },
      submitHandler: function(form){
          RegisterUSR();
      }

  });
}

function RegisterUSR(){
  var sURL = "insertusr.php"
  var form = $("#form_register").serialize();
  $.ajax({
      type: "post",
      url: sURL,
      dataType: 'json',
      data: form,
      success: function(request){
          if(request['status']==1){
              $("#modal_register").modal('close');
              M.toast({html: 'Registered user', classes: 'rounded blue lighten-2'});
          }
      }
  });
}

function Validate_Data(){
    var form = $("#form_login").serialize();
    $.ajax({
        type: "post",
        url: "valida.php",
        dataType: 'json',
        data: form,
        success: function(request){
            if(request['status']==1){
                M.toast({html: 'Welcome', classes: 'rounded blue lighten-2'});
                document.location.href='../Home/';
              }else{
                M.toast({html: 'User not found', classes: 'rounded blue lighten-2'});
                $("#email").focus();
              }
        }
    });
}
