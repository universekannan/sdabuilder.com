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
                  <li><a href="<?php echo $base_url; ?>dashboard"><i class="fa fa-dashboard"></i>Home</a></li>
                  <li class="active"><?=$page_title;?></li>
               </ol>
            </section>
            <section class="content">
               <div class="row">
                  <div class="col-md-12">
                     <div class="form-group col-md-3">
                            <label for="to_date">Select Date</label>
                            
                               <div class="input-group">
                                  <button type="button" class="btn btn-default pull-right" id="pl-daterange-btn" name="pl-daterange-btn">
                                  <span>
                                  <i class="fa fa-calendar"></i> Select Date Range
                                  </span>
                                  <i class="fa fa-caret-down"></i>
                                  </button>
                               </div>
                            
                            <span id="sku_msg" style="display:none" class="text-danger"></span>
                         </div>
                     <div class="col-md-3">
                        <!-- Store Code -->
                        <?php if(store_module() && is_admin()) {$this->load->view('store/store_code',array('show_store_select_box'=>true,'store_id'=>get_current_store_id(),'div_length'=>'','label_length'=>'','show_all'=>'true')); }else{
                           echo "<input type='hidden' name='store_id' id='store_id' value='".get_current_store_id()."'>";
                           }?>
                        <!-- Store Code end -->
                     </div>
                     
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-6">
                     <div class="box">
                        <div class="box-header">
                           <?php $this->load->view('components/export_btn',array('tableId' => 'report-data-2'));?>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                           <table class="table table-bordered table-hover " id="report-data-2" >
                              <!-- Total Gross Profit -->
                              <tr>
                                 <td><?= $this->lang->line('gross_profit'); ?></td>
                                 <td class="text-right text-bold gross_profit"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <!-- Total Net Profit -->
                              <tr>
                                 <td><?= $this->lang->line('net_profit'); ?></td>
                                 <td class="text-right text-bold tot_net_profit"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                           </table>
                        </div>
                        <!-- /.box-body -->
                     </div>
                     <!-- /.box -->
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-6">
                     <div class="box box-primary">
                        <div class="box-header">
                           <?php $this->load->view('components/export_btn',array('tableId' => 'report-data'));?>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                           <table class="table table-bordered table-hover " id="report-data" >
                              <!-- Total Opening Stock -->
                              <tr>
                                 <td><?= $this->lang->line('opening_stock'); ?></td>
                                 <td class="text-right text-bold opening_stock_price"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <!-- <tr>
                                 <td><?= $this->lang->line('closing_stock'); ?><br><small class="text-primary ">(By Purchase Price)</small></td>
                                 <td class="text-right text-bold closing_stock_price"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <tr>
                                 <td><?= $this->lang->line('closing_stock'); ?><br><small class="text-primary ">(By Sales Price)</small></td>
                                 <td class="text-right text-bold closing_stock_price"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr> -->
                              <tr>
                                 <td colspan="2" class="text-bold font-italic text-primary"><?= $this->lang->line('purchase'); ?></td>
                              </tr>
                              <!-- Total Purchase -->
                              <tr>
                                 <td><?= $this->lang->line('total_purchase'); ?></td>
                                 <td class="text-right text-bold pur_total"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <!-- Total Purchase Tax -->
                              <tr>
                                 <td><?= $this->lang->line('total_purchase_tax'); ?></td>
                                 <td class="text-right text-bold purchase_tax_amt"><?php echo $CI->currency(number_format((0),2,'.','')); ?></td>
                              </tr>
                              <!-- Total Purchase Other Charges -->
                              <tr>
                                 <td><?= $this->lang->line('total_other_charges_of_purchase'); ?></td>
                                 <td class="text-right text-bold pur_other_charges_amt"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <!-- Total Purchase Doscount -->
                              <tr>
                                 <td><?= $this->lang->line('total_discount_on_purchase'); ?></td>
                                 <td class="text-right text-bold purchase_discount_amt"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <!-- Total Purchase Paid Amount -->
                              <tr>
                                 <td><?= $this->lang->line('paid_amount'); ?></td>
                                 <td class="text-right text-bold text-success purchase_paid_amount"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <!-- Total Purchase Due -->
                              <tr>
                                 <td><?= $this->lang->line('purchase_due'); ?></td>
                                 <td class="text-right text-bold text-danger purchase_due_total"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>

                              <tr>
                                 <td colspan="2">&nbsp;</td>
                              </tr>

                              <tr>
                                 <td colspan="2" class="text-bold font-italic text-primary"><?= $this->lang->line('purchase_return'); ?></td>
                              </tr>
                              <!-- Total Purchase Return -->
                              <tr>
                                 <td><?= $this->lang->line('total_purchase_return'); ?></td>
                                 <td class="text-right text-bold pur_return_total"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <!-- Total Purchase return Tax -->
                              <tr>
                                 <td><?= $this->lang->line('total_purchase_return_tax'); ?></td>
                                 <td class="text-right text-bold purchase_return_tax_amt"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <!-- Total Purchase return Other Charges -->
                              <tr>
                                 <td><?= $this->lang->line('total_other_charges_of_purchase_return'); ?></td>
                                 <td class="text-right text-bold pur_return_other_charges_amt"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <!-- Total Purchase return Doscount -->
                              <tr>
                                 <td><?= $this->lang->line('total_discount_on_purchase_return'); ?></td>
                                 <td class="text-right text-bold purchase_return_discount_amt"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <!-- Total Purchase Return Paid Amount -->
                              <tr>
                                 <td><?= $this->lang->line('paid_amount'); ?></td>
                                 <td class="text-right text-bold text-success purchase_return_paid_amount"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <!-- Total Purchase returns Due -->
                              <tr>
                                 <td><?= $this->lang->line('purchase_return_due'); ?></td>
                                 <td class="text-right text-bold text-danger purchase_return_due_total"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <tr>
                                 <td colspan="2">&nbsp;</td>
                              </tr>
                           </table>
                        </div>
                        <!-- /.box-body -->
                     </div>
                     <!-- /.box -->
                  </div>
                  <div class="col-md-6">
                     <div class="box">
                        <div class="box-header">
                           
                           <?php $this->load->view('components/export_btn',array('tableId' => 'report-data-4'));?>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                           <table class="table table-bordered table-hover " id="report-data-4" >
                              <!-- Total Expenses -->
                              <tr>
                                 <td><?= $this->lang->line('total_expense'); ?></td>
                                 <td class="text-right text-bold exp_total"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <tr>
                                 <td colspan="2" class="text-bold font-italic text-primary"><?= $this->lang->line('sales'); ?></td>
                              </tr>
                              <!-- Total Sales -->
                              <tr>
                                 <td><?= $this->lang->line('sales'); ?> (<?= $this->lang->line('before_tax'); ?>)</td>
                                 <td class="text-right text-bold sal_total"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <!-- Total Sales Tax -->
                              <tr>
                                 <td><?= $this->lang->line('total_sales_tax'); ?></td>
                                 <td class="text-right text-bold sales_tax_amt"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <!-- Total Sales Other Charges -->
                              <tr>
                                 <td><?= $this->lang->line('total_other_charges_of_sales'); ?></td>
                                 <td class="text-right text-bold sal_other_charges_amt"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <!-- Total Sales Doscount -->
                              <tr>
                                 <td><?= $this->lang->line('total_discount_on_sales'); ?></td>
                                 <td class="text-right text-bold sales_discount_amt"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <!-- Coupon Discount -->
                              <tr>
                                 <td><?= $this->lang->line('couponDiscount'); ?></td>
                                 <td class="text-right text-bold coupon_discount_amt"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <!-- Net Sales -->
                              <tr>
                                 <td><?= $this->lang->line('total_sales'); ?></td>
                                 <td class="text-right text-bold text-danger net_sales bg-gray"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <!-- Total Sales Paid Amount -->
                              <tr>
                                 <td><?= $this->lang->line('paid_amount'); ?></td>
                                 <td class="text-right text-bold text-success sales_paid_amount"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              
                              <!-- Total Sales Due -->
                              <tr>
                                 <td><?= $this->lang->line('sales_due'); ?></td>
                                 <td class="text-right text-bold text-danger sales_due_total"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <tr>
                                 <td colspan="2" class="text-bold font-italic text-primary"><?= $this->lang->line('sales_return'); ?></td>
                              </tr>
                              <!-- Total sales Return -->
                              <tr>
                                 <td><?= $this->lang->line('total_sales_return'); ?></td>
                                 <td class="text-right text-bold sal_return_total"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <!-- Total sales return Tax -->
                              <tr>
                                 <td><?= $this->lang->line('total_sales_return_tax'); ?></td>
                                 <td class="text-right text-bold sales_return_tax_amt"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <!-- Total Sales return Other Charges -->
                              <tr>
                                 <td><?= $this->lang->line('total_other_charges_of_sales_return'); ?></td>
                                 <td class="text-right text-bold sal_return_other_charges_amt"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <!-- Coupon Discount -->
                              <tr>
                                 <td><?= $this->lang->line('couponDiscount'); ?></td>
                                 <td class="text-right text-bold return_coupon_discount_amt"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>

                              <!-- Total Sales return Doscount -->
                              <tr>
                                 <td><?= $this->lang->line('total_discount_on_sales_return'); ?></td>
                                 <td class="text-right text-bold sales_return_discount_amt"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <!-- Total Sales return Paid Amount -->
                              <tr>
                                 <td><?= $this->lang->line('return_total'); ?></td>
                                 <td class="text-right text-bold text-success sales_return_total bg-gray"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <!-- Total Sales return Paid Amount -->
                              <tr>
                                 <td><?= $this->lang->line('paid_amount'); ?></td>
                                 <td class="text-right text-bold text-success sales_return_paid_amount"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                              <!-- Total Sales Return Due -->
                              <tr>
                                 <td><?= $this->lang->line('sales_return_due'); ?></td>
                                 <td class="text-right text-bold text-danger sales_return_due_total"><?php echo $CI->currency(number_format(0,2,'.','')); ?></td>
                              </tr>
                           </table>
                        </div>
                        <!-- /.box-body -->
                     </div>
                     <!-- /.box -->
                  </div>
                  <!-- right column -->
                  
               </div>
               <div class="row hide">
                  <!-- left column -->
                  
                  <div class="col-md-12">
                     <div class="box">
                        <div class="box-header">
                           <?= form_open('#', array('class' => 'form', 'id' => 'profit-loss-report', 'enctype'=>'multipart/form-data', 'method'=>'POST'));?>
                           <input type="hidden" id="base_url" value="<?php echo $base_url;; ?>">     
                            <!-- Warehouse Code -->
                                  <?php if(warehouse_module() && warehouse_count()>1) {$this->load->view('warehouse/warehouse_code',array('show_warehouse_select_box_1'=>true,'div_length'=>'col-md-3','label_length'=>'col-md-3','show_all'=>'true','show_all_option'=>true)); }else{
                                     echo "<input type='hidden' name='warehouse_id' id='warehouse_id' value='".get_store_warehouse_id()."'>";
                                     }?>
                                  <!-- Warehouse Code end -->   

                                 <div class="form-group">
                                    <div class="form-group col-md-4">
                                       <label for="to_date">Select Date</label>
                                       
                                          <div class="input-group">
                                             <button type="button" class="btn btn-default pull-right" id="daterange-btn">
                                             <span>
                                             <i class="fa fa-calendar"></i> Select Date Range
                                             </span>
                                             <i class="fa fa-caret-down"></i>
                                             </button>
                                          </div>
                                       
                                       <span id="sku_msg" style="display:none" class="text-danger"></span>
                                    </div>
                                 </div>
                    
                           <?= form_close(); ?>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                           <div class="col-md-12">
                              <!-- Custom Tabs -->
                              <div class="nav-tabs-custom">
                                 <ul class="nav nav-tabs">
                                    <li class="active"><a href="#tab_1" data-toggle="tab"><?= $this->lang->line('item_wise_profit'); ?></a></li>
                                    <li><a href="#tab_2" data-toggle="tab"><?= $this->lang->line('invoice_wise_profit'); ?></a></li>
                                 </ul>
                                 <div class="tab-content">
                                    <div class="tab-pane active" id="tab_1">
                                       <div class="row">
                                          <!-- right column -->
                                          <div class="col-md-12">
                                             <!-- form start -->
                                             <input type="hidden" id="base_url" value="<?php echo $base_url;; ?>">
                                             <?php $this->load->view('components/export_btn',array('tableId' => 'profit_by_item_table'));?>
                                             <br><br>
                                             <div class="table-responsive">
                                                <table class="table table-bordered table-hover " id="profit_by_item_table" >
                                                   <thead>
                                                      <tr class="bg-blue">
                                                         <th style="">#</th>
                                                         <th style=""><?= $this->lang->line('item_name'); ?></th>
                                                         <th style=""><?= $this->lang->line('sales_quantity'); ?></th>
                                                         <th style=""><?= $this->lang->line('sales_price'); ?></th>
                                                         <th style=""><?= $this->lang->line('purchase_price'); ?></th>
                                                         <!-- <th style=""><?= $this->lang->line('purchase_return_quantity'); ?></th>
                                                            <th style=""><?= $this->lang->line('purchase_return_price'); ?>(+)</th>
                                                            <th style=""><?= $this->lang->line('sales_return_quantity'); ?></th>
                                                            <th style=""><?= $this->lang->line('sales_return_price'); ?>(-)</th> -->
                                                         <th style=""><?= $this->lang->line('gross_profit'); ?></th>
                                                         
                                                      </tr>
                                                   </thead>
                                                   <tbody id="tbodyid">
                                                   </tbody>
                                                </table>
                                             </div>
                                             <!-- /.box-body -->
                                          </div>
                                          <!--/.col (right) -->
                                       </div>
                                       <!-- /.row -->
                                    </div>
                                    <!-- /.tab-pane -->
                                    <div class="tab-pane" id="tab_2">
                                       <div class="row">
                                          <!-- right column -->
                                          <div class="col-md-12">
                                             <!-- form start -->
                                             <input type="hidden" id="base_url" value="<?php echo $base_url;; ?>">
                                             
                                             <?php $this->load->view('components/export_btn',array('tableId' => 'profit_by_invoice_table'));?>

                                             <br><br>
                                             <div class="table-responsive">
                                                <table class="table table-bordered table-hover " id="profit_by_invoice_table" >
                                                   <thead>
                                                      <tr class="bg-blue">
                                                         <th style="">#</th>
                                                         <th style=""><?= $this->lang->line('invoice_no'); ?></th>
                                                         <th style=""><?= $this->lang->line('sales_date'); ?></th>
                                                         <th style=""><?= $this->lang->line('customer_name'); ?></th>
                                                         <th style=""><?= $this->lang->line('sales_price'); ?></th>
                                                         <th style=""><?= $this->lang->line('purchase_price'); ?></th>
                                                         <th style=""><?= $this->lang->line('gross_profit'); ?></th>
                                                      </tr>
                                                   </thead>
                                                   <tbody id="tbodyid">
                                                   </tbody>
                                                </table>
                                             </div>
                                             <!-- /.box-body -->
                                          </div>
                                          <!--/.col (right) -->
                                       </div>
                                       <!-- /.row -->
                                    </div>
                                    <!-- /.tab-pane -->
                                 </div>
                                 <!-- /.tab-content -->
                              </div>
                              <!-- nav-tabs-custom -->
                           </div>
                           <!-- /.col -->
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
      <script>
        var base_url=$("#base_url").val();
        function get_pl_values(){
         var store_id=$("#store_id").val();
         var warehouse_id=$("#warehouse_id").val();

         var from_date = _get_start_date('pl-daterange-btn');
         var to_date = _get_end_date('pl-daterange-btn');

          $.post(base_url+"reports/get_profit_loss_report",{
                        store_id:store_id,
                        warehouse_id:warehouse_id,
                        from_date:from_date,
                        to_date:to_date
                     },function(result){
              var data = jQuery.parseJSON(result);
              $.each(data, function(index, element) {
                      $("."+index).html(element);
              });
              get_all_reports();
          });
        }
        $("#store_id").on("change",function(){
          get_pl_values();
          load_warehouse_list();
        });
        $("#warehouse_id").on("change",function(){
          get_all_reports();
        });

        function load_warehouse_list(){
         var store_id=$("#store_id").val();
         $.post(base_url+"sales/get_warehouse_select_list",{store_id:store_id},function(result){
              result='<option value="">All</option>'+result;
              $("#warehouse_id").html('').append(result).select2();
          });
        }

         
         
         function get_reports(report_type,table_name){
           $(".box").append('<div class="overlay"><i class="fa fa-refresh fa-spin"></i></div>');
           return $.post(base_url+'reports/'+report_type, {from_date: get_start_date(), to_date: get_end_date(),store_id:$("#store_id").val(),warehouse_id:$("#warehouse_id").val()}, function(result) {
             //console.log(result);
             $("#"+table_name+" tbody").html(result);
             $(".overlay").remove();
           });
         }
        // function get_all_reports(){
           // get_reports('get_profit_by_item','profit_by_item_table');
           // get_reports('get_profit_by_invoice','profit_by_invoice_table');
        // }
         jQuery(document).ready(function($) {
            get_pl_values();
            //get_all_reports();
         });
         
         /*Date Range picker event*/
         /*$('#daterange-btn').on('apply.daterangepicker', function(ev, picker) {
           get_all_reports();
         });*/
         /*end*/
         

            /*Date Range picker event 1*/
            $('#pl-daterange-btn').on('apply.daterangepicker', function(ev, picker) {
                console.log("pl-daterange-btn");
              get_pl_values();
            });
            /*end*/
     
            $(function() {
                var start = moment().subtract(29, 'days');
                var end = moment();
                function cb(start, end) {
                    $('.daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
                    $('#pl-daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
                }
                cb(start, end);

            });



            //Date picker 1
                $('#pl-daterange-btn').daterangepicker(
                  {
                    ranges   : {
                      'Today'       : [moment(), moment()],
                      'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                      'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
                      'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                      'This Month'  : [moment().startOf('month'), moment().endOf('month')],
                      'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                    },
                    startDate: moment().subtract(29, 'days'),
                    endDate  : moment()
                  },
                  function (start, end) {
                    
                    $('#pl-daterange-btn span').html(start.format('<?php echo strtoupper($VIEW_DATE) ;?>') + ' - ' + end.format('<?php echo strtoupper($VIEW_DATE);?>'))
                  }
                );
            //End

            function _get_start_date(input_id){
              return $('#'+input_id).data('daterangepicker').startDate.format('<?php echo strtoupper($VIEW_DATE) ;?>');
          }
          function _get_end_date(input_id){
              return $('#'+input_id).data('daterangepicker').endDate.format('<?php echo strtoupper($VIEW_DATE) ;?>');
          }


      </script>
      <!-- Make sidebar menu hughlighter/selector -->
      <script>$(".<?php echo basename(__FILE__,'.php');?>-active-li , .reports-menu").addClass("active");</script>
   </body>
</html>
