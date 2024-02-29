<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?php print $SITE_TITLE; ?> | Log in</title>
  <link rel='shortcut icon' href='<?php echo $theme_link; ?>images/favicon.ico' />
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="<?php echo $theme_link; ?>bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?php echo $theme_link; ?>dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="<?php echo $theme_link; ?>plugins/iCheck/square/blue.css">
 <?php 
      $lang = trim(strtoupper($this->session->userdata('language')));
     if($lang==strtoupper('arabic') || $lang==strtoupper('urdu')) {?>
  <!-- RTL For arabic styles -->
  <link rel="stylesheet" href="<?php echo $theme_link; ?>bootstrap/css/bootstrap.rtl.min.css">
  <link rel="stylesheet" href="<?php echo $theme_link; ?>dist/css/AdminLTE.rtl.min.css">
  <?php } ?>
  
</head>
<body class="hold-transition login-page">

  <!-- language 
  <input type="hidden" id="base_url" value="<?=base_url()?>">
  <?php $this->load->view('comman/language.php');?>
  <!-- language end -->

<div class="login-box">

  <div class="login-logo">
    <a href="#"><b>
      <img src="<?php echo base_url(get_site_logo());?>" >
    </b></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    
    <p class="login-box-msg"><?= $this->lang->line('sign_in_message'); ?></p>

     <div class="text-danger tex-center"><?php echo $this->session->flashdata('failed'); ?></div>
       <div class="text-success tex-center"><?php echo $this->session->flashdata('success'); ?></div>
         
    
    <form id="login-form" action="<?php echo $base_url; ?>login/verify" method="post">
      <input type="hidden" name="<?php echo $this->security->get_csrf_token_name();?>" value="<?php echo $this->security->get_csrf_hash();?>">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="Email/Username" id="email" name="email" autofocus><span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Password" id="pass" name="pass">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-12">
          <button type="submit" class="btn btn-primary btn-block btn-flat"><?= $this->lang->line('sign_in'); ?></button>
        </div>
      </div>
      <div class="row">
        <?php if(store_module()){?>
        <div class="col-xs-6 "><br>
          <a href="<?=base_url('register')?>"><?= $this->lang->line('register'); ?></a>
        </div>
        <?php } ?>
        <!--<div class="col-xs-6 text-right pull-right"><br>
          <a href="<?=base_url('login/forgot_password')?>"><?= $this->lang->line('forgot_password'); ?></a>
        </div>-->
      </div>
    </form>
    <div class="row">
      <div class="col-md-12 text-center">
        <p style='font-style: italic;'>Version <?=app_version();?></p>   
      </div>
    </div>
  </div>
  <!-- /.login-box-body -->
 <?php if(demo_app()){ ?>
  <div class="box-body">
    <label>Click to Start Session!</label>
    <div class="row">
     <div class="col-md-12">
       <table class="table table-bordered table-condensed text-center">         
            <tr>
              <td>admin@example.com</td>
              <td>123456</td>
              <td><button type="button" class="btn btn-info btn-block btn-flat admin">Copy</button></td>
            </tr>
            <tr>
              <td>accounts@example.com</td>
              <td>123456</td>
              <td><button type="button" class="btn btn-info btn-block btn-flat accounts">Copy</button></td>
            </tr>
            <tr>
              <td>seller@example.com</td>
              <td>123456</td>
              <td><button type="button" class="btn btn-info btn-block btn-flat seller">Copy</button></td>
            </tr>
            <tr>
              <td>purchase@example.com</td>
              <td>123456</td>
              <td><button type="button" class="btn btn-info btn-block btn-flat purchase">Copy</button></td>
            </tr>
            </tbody>
          </table>
     </div>
    </div>
    <i><i class="fa fa-fw fa-info-circle text-warning"></i>Some of the features are disabled in demo and it will be reset after each hour.</i>
  </div>
<?php } ?>
         
  
</div>

<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="<?php echo $theme_link; ?>plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="<?php echo $theme_link; ?>bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="<?php echo $theme_link; ?>plugins/iCheck/icheck.min.js"></script>
<script src="<?php echo $theme_link; ?>js/language.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
<script type="text/javascript" >
$(function($) { // this script needs to be loaded on every page where an ajax POST may happen
    $.ajaxSetup({ data: {'<?php echo $this->security->get_csrf_token_name(); ?>' : '<?php echo $this->security->get_csrf_hash(); ?>' }  }); });
</script>
<script type="text/javascript">
  $(".admin").on("click",function(event) {
    $("input[name='email']").val("admin@example.com");
    $("input[name='pass']").val("123456");
    $("#login-form").submit();
  });

  $(".accounts").on("click",function(event) {
    $("input[name='email']").val("accounts@example.com");
    $("input[name='pass']").val("123456");
    $("#login-form").submit();
  });

  $(".seller").on("click",function(event) {
    $("input[name='email']").val("seller@example.com");
    $("input[name='pass']").val("123456");
    $("#login-form").submit();
  });

  $(".purchase").on("click",function(event) {
      $("input[name='email']").val("purchase@example.com");
      $("input[name='pass']").val("123456");
      $("#login-form").submit();
    });

</script>
</body>
</html>
