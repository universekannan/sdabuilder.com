<!DOCTYPE html>
<html>
<title><?= $page_title;?>- Default Format</title>
<head>
  <?php include"comman/code_css.php"; ?>
<link rel='shortcut icon' href='<?php echo $theme_link; ?>images/favicon.ico' />

<style>
@page {
                margin: 10px 20px 10px 20px;
            }
table, th, td {
    border: 0.02pt solid #0070C0;
    border-collapse: collapse;   
  padding: 1px;

}
th, td {
    /*padding: 5px;*/
    text-align: left;   
    vertical-align:top 
}
body{
  word-wrap: break-word;
  font-family:  'sans-serif','Arial';
  font-size: 11px;
  /*height: 210mm;*/
}
.style_hidden{
  border-style: hidden;
}
.fixed_table{
  table-layout:fixed;
}
.text-center{
  text-align: center;
}
.text-left{
  text-align: left;
}
.text-right{
  text-align: right;
}
.text-bold{
  font-weight: bold;
}
.bg-sky{
  background-color: #E8F3FD;
}
@page { size: A5 margin: 5px; }
body { margin: 5px; }

 #clockwise {
       rotate: 90;
    }

    #counterclockwise {
       rotate: -90;
    }
</style>
</head>
<body onload="window.print();"><!-- window.print() -->
<?php
    $q1=$this->db->query("select * from db_store where status=1 and id=".get_current_store_id());
    $res1=$q1->row();
    $store_name=$res1->store_name;
    $company_mobile=$res1->mobile;
    $company_phone=$res1->phone;
    $company_email=$res1->email;
    $previous_balance_bit=$res1->previous_balance_bit;
    $previous_balance_bit=$res1->previous_balance_bit;
    $t_and_c_status=$res1->t_and_c_status;
    // $company_country=$res1->country;
    // $company_state=$res1->state;
    $company_city=$res1->city;
    $company_address=$res1->address;
    $company_gst_no=$res1->gst_no;
    $company_vat_no=$res1->vat_no;
    $store_logo=(!empty($res1->store_logo)) ? $res1->store_logo : store_demo_logo();
    $store_website=$res1->store_website;
    $bank_details=$res1->bank_details;
    $terms_and_conditions="";//$res1->sales_terms_and_conditions;

    $upi_code=$res1->upi_code;
    $upi_id=$res1->upi_id;
    if(!empty($upi_code)){
      //if(file_exists(base_url('uploads/upi/'.$upi_code))){
        $upi_code = base_url('uploads/upi/'.$upi_code);
     // }
    }
    else{
      $upi_code='';
    }

    
    $sales_invoice_footer_text=$res1->sales_invoice_footer_text;
    
    $q3=$this->db->query("SELECT b.coupon_id,b.coupon_amt,b.due_date,b.customer_previous_due,b.customer_total_due,a.customer_name,a.mobile,a.phone,a.gstin,a.tax_number,a.email,a.shippingaddress_id,
                           a.opening_balance,a.country_id,a.state_id,a.created_by,
                           a.postcode,a.address,b.sales_date,b.created_time,b.reference_no,
                           b.sales_code,b.sales_note,b.sales_status,b.invoice_terms,
                           coalesce(b.grand_total,0) as grand_total,
                           coalesce(b.subtotal,0) as subtotal,a.sales_due,
                           coalesce(b.paid_amount,0) as paid_amount,
                           coalesce(b.other_charges_input,0) as other_charges_input,
                           other_charges_tax_id,
                           coalesce(b.other_charges_amt,0) as other_charges_amt,
                           discount_to_all_input,
                           b.discount_to_all_type,
                           coalesce(b.tot_discount_to_all_amt,0) as tot_discount_to_all_amt,
                           coalesce(b.round_off,0) as round_off,
                           b.payment_status

                           FROM db_customers a,
                           db_sales b 
                           WHERE 
                           a.`id`=b.`customer_id` AND 
                           b.`id`='$sales_id' 
                           ");
                         
    
    $res3=$q3->row();
    $customer_name=$res3->customer_name;
    $customer_mobile=$res3->mobile;
    $customer_phone=$res3->phone;
    $customer_email=$res3->email;
    $customer_country=get_country($res3->country_id);
    $customer_state=get_state($res3->state_id);
    $customer_address=$res3->address;
    $customer_postcode=$res3->postcode;
    $customer_gst_no=$res3->gstin;
    $customer_tax_number=$res3->tax_number;
    $customer_opening_balance=$res3->opening_balance;
    $sales_date=$res3->sales_date;
    $due_date=$res3->due_date;
    $created_time=$res3->created_time;
    $reference_no=$res3->reference_no;
    $sales_code=$res3->sales_code;
    $sales_note=$res3->sales_note;
    $sales_status=$res3->sales_status;
    $created_by=$res3->created_by;
    //$previous_due=$res3->customer_previous_due;
    //$total_due=$res3->customer_total_due;
    $invoice_terms=$res3->invoice_terms;

    $previous_due=$res3->sales_due-($res3->grand_total-$res3->paid_amount);//$res3->customer_previous_due;
    $previous_due = ($previous_due>0) ? $previous_due : 0;
    $total_due=$res3->sales_due;//$res3->customer_total_due;

    $coupon_id=$res3->coupon_id;
    $coupon_amt=$res3->coupon_amt;

    $coupon_code = '';
    $coupon_type = '';
    $coupon_value=0;
    if(!empty($coupon_id)){
      $coupon_details =get_customer_coupon_details($coupon_id);
      $coupon_code =$coupon_details->code;
      $coupon_value =$coupon_details->value;
      $coupon_type =$coupon_details->type;
    } 
    
    $subtotal=$res3->subtotal;
    $grand_total=$res3->grand_total;
    $other_charges_input=$res3->other_charges_input;
    $other_charges_tax_id=$res3->other_charges_tax_id;
    $other_charges_amt=$res3->other_charges_amt;
    $paid_amount=$res3->paid_amount;
    $discount_to_all_input=$res3->discount_to_all_input;
    $discount_to_all_type=$res3->discount_to_all_type;
    $discount_to_all_type = ($discount_to_all_type=='in_percentage') ? '%' : 'Fixed';
    $tot_discount_to_all_amt=$res3->tot_discount_to_all_amt;
    $round_off=$res3->round_off;
    $payment_status=$res3->payment_status;
    
    

    $shipping_country='';
    $shipping_state='';
    $shipping_city='';
    $shipping_address='';
    $shipping_postcode='';
    if(!empty($res3->shippingaddress_id)){
        $Q2 = $this->db->select("c.country,s.state,a.city,a.postcode,a.address")
                        ->where("a.id",$res3->shippingaddress_id)
                        ->from("db_shippingaddress a")
                        ->join("db_country c","c.id = a.country_id",'left')
                        ->join("db_states s","s.id = a.state_id",'left')
                        ->get();                    
        if($Q2->num_rows()>0){
          $shipping_country=$Q2->row()->country;
          $shipping_state=$Q2->row()->state;
          $shipping_city=$Q2->row()->city;
          $shipping_address=$Q2->row()->address;
          $shipping_postcode=$Q2->row()->postcode;
        }
      }

    ?>

<caption>
      <center>
        <span style="font-size: 18px;text-transform: uppercase;">
          <?= $this->lang->line('invoice'); ?>
        </span>
      </center>
</caption>

<table autosize="1" style="overflow: wrap" id='mytable' align="center" width="100%" height='100%'  cellpadding="0" cellspacing="0"  >
<!-- <table align="center" width="100%" height='100%'   > -->
  
    <thead>

      <tr>
        <th colspan="16">
          <table width="100%" height='100%' class="style_hidden fixed_table">
              <tr>
                <!-- First Half -->
                <td colspan="4">
                  <img src="<?= base_url($store_logo);?>" width='100%' height='auto'>
                </td>

                <td colspan="4">
                  <b><?php echo $store_name; ?></b><br/>
                  <span style="font-size: 10px;">
                    <?php echo $company_address; ?><br/>
                    <?php echo $this->lang->line('mob.').":".$company_mobile; ?><br/>
                   
                    
                    <?php echo (!empty(trim($company_email))) ? $this->lang->line('email').": ".$company_email."<br>" : '';?>
                    <?php echo (!empty(trim($company_gst_no))) ? $this->lang->line('gst_number').": ".$company_gst_no."<br>" : '';?>
                    <?php echo (!empty(trim($company_vat_no))) ? $this->lang->line('tax_number').": ".$company_vat_no."<br>" : '';?>
                  </span>
                </td>

                <!-- Second Half -->
                <td colspan="8" rowspan="1">
                  <span>
                    <table style="width: 100%;" class="style_hidden fixed_table">
                    
                        
                        <tr>
                          <td colspan="8">
                            <?= $this->lang->line('invoice_no'); ?><br>
                            <span style="font-size: 25px;">
                              <b><?php echo "$sales_code"; ?></b>
                            </span>
                          </td>
                        </tr>
                        <tr>
                          <td colspan="4">
                            <?= $this->lang->line('invoice_date'); ?><br>
                            <span style="font-size: 10px;">
                              <b><?php echo show_date($sales_date); ?></b>
                            </span>
                          </td>
                          <td colspan="4">
                            <?= $this->lang->line('due_date'); ?><br>
                            <span style="font-size: 10px;">
                              <b><?= (!empty($due_date)) ? show_date($due_date) : ''; ?></b>
                            </span>
                          </td>
                        
                          
                          
                        </tr>
                        <tr>
                        <td colspan="8">
                            <?= $this->lang->line('reference_no'); ?><br>
                            <span style="font-size: 10px;">
                              <b><?php echo "$reference_no"; ?></b>
                            </span>
                          </td>
                        </tr>
                        <tr>
                          <td colspan="8">
                            <span>
                                <b><?= $this->lang->line('bank_details'); ?></b><br/>
                              </span>
                              <span style="font-size: 10px;">
                                  <?= nl2br($bank_details);  ?>
                                </span>
                          </td>
                        </tr>

                        <?php if(!empty($upi_id)) {?>
                        <tr>
                          <td colspan="8">
                            <span>
                                <b><?= $this->lang->line('pay_by_upi'); ?></b><br/>
                              </span>
                              <span style="font-size: 10px;">
                                  <?=$upi_id;  ?>
                                </span>
                          </td>
                        </tr>
                        <?php } ?>
                        <!-- if UPI Exist then only show this Row -->
                        <?php if(!empty($upi_code) && show_upi_code()) {?>
                        <tr>
                          <td colspan="8" style="text-align: right;">
                            <b><?= $this->lang->line('pay_by_upi'); ?></b><br/>

                            <img width="35%" src="<?= $upi_code;?>"><br>
                            
                          </td>
                        </tr>
                        <?php } ?>
                        <!-- UPI Image show end -->


                    
                    </table>
                  </span>
                </td>
              </tr>

              <tr>
                <!-- Bottom Half -->
                <td colspan="8">
                  <b><?= $this->lang->line('customer_address'); ?></b><br/>
                  <span style="font-size: 10px;">
                      <?php echo $this->lang->line('name').": ".$customer_name; ?><br/>
                        <?php echo (!empty(trim($customer_mobile))) ? $this->lang->line('mobile').": ".$customer_mobile."<br>" : '';?>
                        <?php 
                                if(!empty($customer_address)){
                                  echo $customer_address;
                                }
                                /*if(!empty($customer_country)){
                                  echo $customer_country;
                                }
                                if(!empty($customer_state)){
                                  echo ",".$customer_state;
                                }
                                if(!empty($customer_city)){
                                  echo ",".$customer_city;
                                }
                                if(!empty($customer_postcode)){
                                  echo "-".$customer_postcode;
                                }*/
                              ?>
                              <br>
                        <?php echo (!empty(trim($customer_email))) ? $this->lang->line('email').": ".$customer_email."<br>" : '';?>
                         <?php echo (!empty(trim($customer_gst_no))) ? $this->lang->line('gst_number').": ".$customer_gst_no."<br>" : '';?>
                        <!--<?php echo (!empty(trim($customer_tax_number))) ? $this->lang->line('tax_number').": ".$customer_tax_number."<br>" : '';?> -->
                  </span>
                </td>

                <td colspan="8">
                            <span>
                                <b><?= $this->lang->line('shipping_address'); ?></b><br/>
                              </span>
                              <span style="font-size: 10px;">
                              <?php echo $this->lang->line('name').": ".$customer_name; ?><br/>
                                <?php echo (!empty(trim($customer_mobile))) ? $this->lang->line('mobile').": ".$customer_mobile."<br>" : '';?>
                               
                               <?php 
                                    echo $this->lang->line('address') .":".$shipping_address;
                                    echo "<br>".$this->lang->line('country') .":".$shipping_country;
                                    echo ", ".$this->lang->line('state') .":".$shipping_state;
                                    echo "<br>".$this->lang->line('city') .":".$shipping_city;
                                    echo ", ".$this->lang->line('postcode') .":".$shipping_postcode;

                                  ?>

                          </span>
                          </td>
              </tr>




            
          </table>
      </th>
      </tr>

      <tr>
        <td colspan="16">&nbsp; </td>
      </tr>
      <tr class="bg-sky"><!-- Colspan 10 -->
        <th colspan='2' class="text-center"><?= $this->lang->line('sl_no'); ?></th>
        <th colspan='4' class="text-center" ><?= $this->lang->line('description_of_goods'); ?></th>
        <th colspan='2' class="text-center"><?= $this->lang->line('hsn'); ?></th>
        <th colspan='2' class="text-center"><?= $this->lang->line('unit_cost'); ?></th>
        <th colspan='1' class="text-center"><?= $this->lang->line('qty'); ?></th>
        <th colspan='1' class="text-center"><?= $this->lang->line('tax'); ?></th>
        <th colspan='1' class="text-center"><?= $this->lang->line('tax_amt'); ?></th>
        <th colspan='1' class="text-center"><?= $this->lang->line('disc.'); ?></th>
        <!-- <th colspan='2' class="text-center"><?= $this->lang->line('rate'); ?></th> -->
        <th colspan='2' class="text-center"><?= $this->lang->line('amount'); ?></th>
      </tr>
  </thead>



<tbody>
  <!-- <tr>
    <td colspan='16' class='test'> -->
 <?php
              $i=1;
              $tot_qty=0;
              $tot_sales_price=0;
              $tot_tax_amt=0;
              $tot_discount_amt=0;
              $tot_unit_total_cost=0;
              $tot_total_cost=0;
              $tot_before_tax=0;
              
              $tot_price_per_unit=0;
              $sum_of_tot_price=0;

              $this->db->select(" a.description,c.item_name, a.sales_qty,a.tax_type,
                                  a.price_per_unit, b.tax,b.tax_name,a.tax_amt,
                                  a.discount_input,a.discount_amt, a.unit_total_cost,
                                  a.total_cost , d.unit_name,c.sku,c.hsn
                              ");
              $this->db->where("a.sales_id",$sales_id);
              $this->db->from("db_salesitems a");
              $this->db->join("db_tax b","b.id=a.tax_id","left");
              $this->db->join("db_items c","c.id=a.item_id","left");
              $this->db->join("db_units d","d.id = c.unit_id","left");
              $q2=$this->db->get();

              
              foreach ($q2->result() as $res2) {
                  $discount = (empty($res2->discount_input)||$res2->discount_input==0)? '0':$res2->discount_input."%";
                  $discount_amt = (empty($res2->discount_amt)||$res2->discount_input==0)? '0':$res2->discount_amt."";
                  $before_tax=$res2->unit_total_cost;// * $res2->sales_qty;
                  $tot_cost_before_tax=$before_tax * $res2->sales_qty;

                  $price_per_unit = $res2->price_per_unit;
                  if($res2->tax_type=='Inclusive'){
                    $price_per_unit -= ($res2->tax_amt/$res2->sales_qty);
                  }

                  $tot_price = $price_per_unit * $res2->sales_qty;

                  echo "<tr>";  
                  echo "<td colspan='2' class='text-center'>".$i++."</td>";
                  echo "<td colspan='4'>";
                  echo $res2->item_name;
                  echo (!empty($res2->description)) ? "<br><i>[".nl2br($res2->description)."]</i>" : '';
                  echo "</td>";
                  echo "<td colspan='2' class='text-left'>".$res2->hsn."</td>";
                  echo "<td colspan='2' class='text-right'>".store_number_format($price_per_unit)."</td>";
                  
                  echo "<td class='text-center'>".format_qty($res2->sales_qty)."</td>";
                  echo "<td colspan='1' class='text-right'>".store_number_format($res2->tax)."%</td>";
                  echo "<td style='text-align: right;'>".store_number_format($res2->tax_amt)."</td>";
                  //echo "<td style='text-align: right;'>".$discount."</td>";
                  echo "<td style='text-align: right;'>".store_number_format($discount_amt)."</td>";
 
                  //echo "<td colspan='2' class='text-right'>".number_format($before_tax,2)."</td>";
                  //echo "<td class='text-right'>".$res2->price_per_unit."</td>";
                  
                  echo "<td colspan='2' class='text-right'>".store_number_format($res2->total_cost)."</td>";
                  echo "</tr>";  
                  $tot_qty +=$res2->sales_qty;
                  //$tot_sales_price +=$res2->price_per_unit;
                  $tot_tax_amt +=$res2->tax_amt;
                  $tot_discount_amt +=$res2->discount_amt;
                  $tot_unit_total_cost +=$res2->unit_total_cost;
                  $tot_before_tax +=$before_tax;
                  $tot_total_cost +=$res2->total_cost;

                  $tot_price_per_unit +=$price_per_unit;
                  $sum_of_tot_price +=$tot_price;


              }
              ?>
  <!--     </td>
  </tr> -->
  </tbody>


<tfoot>
 

  <tr class="bg-sky">
    <td colspan="8" class='text-center text-bold'><?= $this->lang->line('total'); ?></td>
    <td colspan="2" class='text-right' ><b><?php echo store_number_format($tot_price_per_unit); ?></b></td>
    <td colspan="1" class='text-bold text-center'><?=format_qty($tot_qty); ?></td>
    <td colspan="1" class='text-bold text-center'></td>
    <td colspan="1" class='text-right' ><b><?php echo store_number_format($tot_tax_amt); ?></b></td>
    <td colspan="1" class='text-right' ><b><?php echo store_number_format($tot_discount_amt); ?></b></td>
    <td colspan="2" class='text-right' ><b><?php echo store_number_format($tot_total_cost); ?></b></td>
  </tr>
  <tr>
    <td colspan="14" class='text-right'><b><?= $this->lang->line('subtotal'); ?></b></td>
    <td colspan="2" class='text-right' ><b><?php echo store_number_format($tot_total_cost); ?></b></td>
  </tr>


  <tr>
    <td colspan="14" class='text-right'><b><?= $this->lang->line('other_charges'); ?></b></td>
    <td colspan="2" class='text-right' ><b><?php echo store_number_format($other_charges_amt); ?></b></td>
  </tr>
  
  <?php if(!empty($coupon_code)){ ?>
  <tr>
    <td colspan="6" class='text-left'><b>
      <?= $this->lang->line('couponCode'); ?> : <?=getTruncatedCCNumber($coupon_code);?>
    </b>
    </td>
    <td colspan="8" class='text-right'><b>
      <?= $this->lang->line('couponDiscount'); ?> <?= ($coupon_type=='Percentage') ? $coupon_value .'%' : '[Fixed]' ;?>
    </b>
    </td>
    <td colspan="2" class='text-right' ><b><?= store_number_format($res3->coupon_amt); ?></b></td>
  </tr>
  <?php } ?>
  <tr>
    <td colspan="14" class='text-right'><b><?= $this->lang->line('discount_on_all'); ?>(<?= store_number_format($discount_to_all_input)." ".$discount_to_all_type; ?>)</b></td>
    <td colspan="2" class='text-right' ><b><?php echo store_number_format($tot_discount_to_all_amt); ?></b></td>
  </tr>
  
  <tr>
    <td colspan="14" class='text-right'><b><?= $this->lang->line('grand_total'); ?></b></td>
    <td colspan="2" class='text-right' ><b><?php echo store_number_format($grand_total); ?></b></td>
  </tr>

  <tr>
    <td colspan="14" class='text-right'><b><?= $this->lang->line('paid_amount'); ?></b></td>
    <td colspan="2" class='text-right' ><b><?php echo store_number_format($paid_amount); ?></b></td>
  </tr>

  <?php if($previous_balance_bit==1){ ?>
  <tr>
    <td colspan="14" class='text-right text-italic'><?= $this->lang->line('previous_balance'); ?></td>
    <td colspan="2" class='text-right' ><?php echo store_number_format($previous_due); ?></td>
  </tr>
  <tr>
    <td colspan="14" class='text-right text-italic'><?= $this->lang->line('total_due'); ?></td>
    <td colspan="2" class='text-right' ><?php echo store_number_format($total_due); ?></td>
  </tr>  
  <?php } ?>

  <tr>
    <td colspan="16">
      <span class='amt-in-word'>
        <?= $this->lang->line('note') .":<b>". nl2br($sales_note)."</b>";?>
    </span>  
    </td>
  </tr>
  <?php if(!empty($invoice_terms) && $t_and_c_status) {?>
  <tr>
    <td colspan="16">
      <span class='amt-in-word'>
        <b><?= $this->lang->line('invoiceTerms') .":</b>". nl2br(html_entity_decode($invoice_terms))."";?>
    </span>  
    </td>
  </tr>
<?php } ?>
  
  <tr>

    

    <td colspan="16">
<?php
     
      echo "<span class='amt-in-word'>".$this->lang->line('amount_in_words').": <i style='font-weight:bold;'>".$this->session->userdata('currency_code')." ".no_to_words($grand_total)."</i></span>";

      ?>
  
</td>
  </tr>



      <!-- T&C & Bank Details & signatories-->
      <tr>
        <td colspan="16">
          <table width="100%" class="style_hidden fixed_table">
           
              <tr>
                <td colspan="16">
                  <span>
                    <table style="width: 100%;" class="style_hidden fixed_table">
                    
                        <!-- T&C & Bank Details -->
                        <!-- <tr>
                          <td colspan="16">
                            <span><b> <?= $this->lang->line('terms_and_conditions'); ?></b></span><br>
                            <span style='font-size: 8px;'><?= nl2br($terms_and_conditions);  ?></span>
                          </td>
                        </tr>
 -->
                         <tr>
                          <td colspan='8' style="height:50px;">
                            <span><b> <?= $this->lang->line('customer_signature'); ?></b></span>
                          </td>
                          <td colspan='8'>
                            <span><b> <?= $this->lang->line('authorised_signatory'); ?></b></span>
                          </td>
                        </tr>
                     
                    </table>
                  </span>
                </td>
              </tr>
           
          </table>
      </td>
      </tr>
      <!-- T&C & Bank Details & signatories End -->

      <?php if(!empty($sales_invoice_footer_text)) {?>
      <tr>
        <td colspan="16" style="text-align: center;font-size: 8px;">
          <?= $sales_invoice_footer_text; ?>
        </td>
      </tr>
      <?php } ?>
</tfoot>

</table>
<!-- <caption>
      <center>
        <span style="font-size: 11px;text-transform: uppercase;">
          This is Computer Generated Invoice
        </span>
      </center>
</caption> -->
</body>
</html>
