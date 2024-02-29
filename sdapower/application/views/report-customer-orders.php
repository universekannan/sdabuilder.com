<!DOCTYPE html>
<html>
   <head>
      <!-- TABLES CSS CODE -->
      <?php include"comman/code_css.php"; ?>
      <!-- </copy> -->  
   </head>
   <body class="hold-transition skin-blue sidebar-mini">
      <div class="wrapper">
         <?php include"sidebar.php"; ?>
         <!-- Content Wrapper. Contains page content -->
         <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
               <h1>
                  <?=$page_title;?>
                  <small></small>
               </h1>
               <ol class="breadcrumb">
                  <li><a href="<?php echo $base_url; ?>dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
                  <li class="active"><?=$page_title;?></li>
               </ol>
            </section>
            <!-- Main content -->
            <section class="content">
               <div class="row">
                  <!-- right column -->
                  <div class="col-md-12">
                     <!-- Horizontal Form -->
                     <div class="box box-primary ">
                        <div class="box-header with-border">
                           <h3 class="box-title">Please Enter Valid Information</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form class="form-horizontal" id="report-form" onkeypress="return event.keyCode != 13;">
                           <input type="hidden" name="<?php echo $this->security->get_csrf_token_name();?>" value="<?php echo $this->security->get_csrf_hash();?>">
                           <input type="hidden" id="base_url" value="<?php echo $base_url;; ?>">
                           <div class="box-body">
                              <div class="form-group">
                                 <!-- Store Code -->
                                  <?php if(store_module() && is_admin()) {$this->load->view('store/store_code',array('show_store_select_box'=>true,'store_id'=>get_current_store_id(),'div_length'=>'col-sm-3','show_all'=>'true','form_group_remove' => 'true')); }else{
                                     echo "<input type='hidden' name='store_id' id='store_id' value='".get_current_store_id()."'>";
                                     }?>
                                  <!-- Store Code end -->
                                </div>
                                <div class="form-group">
                                  
                                 <label for="customer_id" class="col-sm-2 control-label"><?= $this->lang->line('customer_name'); ?></label>
                                 <div class="col-sm-3">
                                    <select class="form-control select2 " id="customer_id" name="customer_id" >
                                    </select>
                                    <span id="customer_id_msg" style="display:none" class="text-danger"></span>
                                 </div>

                              </div>
                              
                              <div class="form-group">
                                 <label for="within_date" class="col-sm-2 control-label"><?= $this->lang->line('order_within_from_the_date'); ?></label>
                                 <div class="col-sm-3">
                                    <div class="input-group date">
                                       <div class="input-group-addon">
                                          <i class="fa fa-calendar"></i>
                                       </div>
                                       <input type="text" class="form-control pull-right datepicker" id="within_date" name="within_date">
                                    </div>
                                    <span id="within_date_msg" style="display:none" class="text-danger"></span>
                                 </div>
                              </div>

                            

                           </div>

                           <!-- /.box-body -->
                           <div class="box-footer">
                              <div class="col-sm-8 col-sm-offset-2 text-center">
                                 <div class="col-md-3 col-md-offset-3">
                                    <button type="button" id="view" class=" btn btn-block btn-success" title="Save Data">Show</button>
                                 </div>
                                 <div class="col-sm-3">
                                    <a href="<?=base_url('dashboard');?>">
                                    <button type="button" class="col-sm-3 btn btn-block btn-warning close_btn" title="Go Dashboard">Close</button>
                                    </a>
                                 </div>
                              </div>
                           </div>
                           

                           <!-- /.box-footer -->
                        </form>
                     </div>
                     <!-- /.box -->
                  </div>
                  <!--/.col (right) -->
               </div>
               <!-- /.row -->
            </section>
            <!-- /.content -->
            <section class="content">
               <div class="row">
                  <!-- right column -->
                  <div class="col-md-12">
                     <div class="box">
                        <div class="box-header">
                           <?php $this->load->view('components/export_btn',array('tableId' => 'report-data'));?>
                        </div>

                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                           <table class="table table-bordered table-hover " id="report-data" >
                              <thead>
                                 <tr class="bg-blue">
                                    <th style="">#</th>
                                    <?php if(store_module() && is_admin()){ ?>
                                    <th style=""><?= $this->lang->line('store_name'); ?></th>
                                    <?php } ?>
                                    <th style=""><?= $this->lang->line('customer_name'); ?></th>
                                    <th style=""><?= $this->lang->line('last_order_date'); ?></th>
                                    <th style=""><?= $this->lang->line('order_id'); ?></th>
                                    <th style=""><?= $this->lang->line('no_orders'); ?>(in Days)</th>
                                 </tr>
                              </thead>
                              <tbody id="tbodyid">
                              </tbody>
                           </table>
                        </div>
                        <!-- /.box-body -->
                     </div>
                     <!-- /.box -->
                  </div>
               </div>
            </section>
         </div>
         <!-- /.content-wrapper -->
         <?php include"footer.php"; ?>
         <!-- Add the sidebar's background. This div must be placed
            immediately after the control sidebar -->
         <div class="control-sidebar-bg"></div>
      </div>
      <!-- ./wrapper -->
      <!-- SOUND CODE -->
      <?php include"comman/code_js_sound.php"; ?>
      <!-- TABLES CODE -->
      <?php include"comman/code_js.php"; ?>
      <!-- TABLE EXPORT CODE -->
      <?php include"comman/code_js_export.php"; ?>

      <script src="<?php echo $theme_link; ?>js/sheetjs.js" type="text/javascript"></script>
      <script src="<?php echo $theme_link; ?>js/ajaxselect/customer_select_ajax.js"></script>  
      <script type="text/javascript">
         //Customer Selection Box Search
         function getCustomerSelectionId() {
           return '#customer_id';
         }
         //Customer Selection Box Search - END
      </script>
      <script type="text/javascript">
        var base_url=$("#base_url").val();
        $("#store_id").on("change",function(){
          autoLoadFirstCustomer();
        });
      </script>
      <script type="text/javascript">
         
         $("#view,#view_all").on("click",function(){
         var within_date=document.getElementById("within_date").value;
         var customer_id=document.getElementById("customer_id").value;
   
         if(this.id=="view_all"){
             var view_all='yes';
           }
        else{
          var view_all='no';
        }
      
        $(".box").append('<div class="overlay"><i class="fa fa-refresh fa-spin"></i></div>');
        $.post($("#base_url").val()+"reports/show_customer_orders",{customer_id:customer_id,view_all:view_all,within_date:within_date,store_id:$("#store_id").val()},function(result){
          //alert(result);
            setTimeout(function() {
             $("#tbodyid").empty().append(result);     
             $(".overlay").remove();
            }, 0);
           });
     });
      </script>
      
      <!-- Make sidebar menu hughlighter/selector -->
      <script>$(".<?php echo basename(__FILE__,'.php');?>-active-li , .reports-menu").addClass("active");</script>
   </body>
</html>
