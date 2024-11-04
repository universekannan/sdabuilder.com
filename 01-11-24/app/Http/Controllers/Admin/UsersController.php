<?php
namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Hash;
use Auth;
use Jenssegers\Agent\Agent;

class UsersController extends Controller
{

    public function __construct()
    {
        $this->middleware( 'auth' );
    }


	 public function changepassword(){
		 
     return view('admin/users/changepassword');
	 }
	 
	 
    public function users($usertype_id) {
        $referral_id = Auth::user()->id;
        if(Auth::user()->usertype_id == 3){
            $sql="select a.*,b.name as refname,c.usertype_name from users a,users b,user_type c where a.referral_id=b.id and a.usertype_id=c.id and a.referral_id=$referral_id and a.usertype_id=$usertype_id order by a.id";
            $users = DB::select($sql);
        }elseif(Auth::user()->usertype_id == 1){
            if($usertype_id == 3){
            $sql="select a.*,b.name as refname,c.usertype_name from users a,users b,user_type c where a.referral_id=b.id and a.usertype_id=c.id and a.usertype_id=$usertype_id order by a.id";
            }else{
            $sql="select a.*,c.usertype_name from users a,user_type c where a.usertype_id=c.id and a.usertype_id=$usertype_id order by a.id";
            }
            $users = DB::select($sql);
        }else{
            $sql="select a.*,c.usertype_name from users a,user_type c where a.usertype_id=c.id and a.usertype_id=$usertype_id order by a.id";
            $users = DB::select($sql);
        }

        $location = DB::table( 'location' )
        ->whereNotIn( 'id', DB::table( 'deliverable_location' )->pluck( 'deliverable_id' ) )->distinct()
        ->get();
        $leads_type = DB::table( 'leads_type' )->orderBy( 'id', 'Asc' )->get();
        $usertype = DB::table( 'user_type' )->orderBy( 'id', 'Asc' )->get();
        $shop = DB::table( 'users' )->where( 'usertype_id', '5' )->get();
        return view( 'admin/users/index', compact( 'users','location','usertype','shop','usertype_id','leads_type' ) );

    }

	public function viewsalary($month) {
	 if(auth()->user()->usertype_id == '1'){
        $sql="select a.*,b.name from stafs_salery a,users b where a.user_id=b.id and salary_month='$month'";
	} else {
		$userid = Auth::user()->id;
        $sql="select a.*,b.name from stafs_salery a,users b where a.user_id=b.id and salary_month='$month' and a.user_id = '$userid'";
	}
        $salary=DB::select($sql);
        $sql="select distinct salary_month from stafs_salery";
        $months=DB::select($sql);
        $ref_user=2;
        $working_days=1;
        $sql = "select count(user_id) as working_days from attendance where date like '$month%' and user_id=$ref_user";
        $result = DB::select( DB::raw( $sql ) );
        foreach($result as $res){
            $working_days=$res->working_days;
        }
        return view('admin/users/salary',compact('salary','months','month','working_days'));
    }

	public function processsalary() {
        $mon = date('Y-m', strtotime(date('Y-m')." -1 month"));
		$ref_user=2;
		$working_days=1;
		$present=0;
		$sql = "select count(user_id) as working_days from attendance where date like '$mon%' and user_id=$ref_user";
		$result = DB::select( DB::raw( $sql ) );
		foreach($result as $res){
			$working_days=$res->working_days;
		}
		$sql = "select user_id,count(user_id) as present from attendance where date like '$mon%' group by user_id";
		$result = DB::select( DB::raw( $sql ) );
		$sql="delete from stafs_salery where salary_month = '$mon'";
		DB::delete($sql);
		foreach($result as $res){
			$present = $res->present;
            if($present < $working_days) $present++;
			$user_id = $res->user_id;
			$sql2="select salery from users where id=$user_id";
			$result2 = DB::select( DB::raw( $sql2 ) );
			$salary = 0;
			if(count($result2)>0){
				$salary=$result2[0]->salery;
			}
			$pay=round($salary*$present/$working_days);
			$sql="insert into stafs_salery (user_id,working_days,present,salary,salary_month) values ('$user_id','$working_days','$present','$pay','$mon')";
			DB::insert($sql);
            $sql="update users set wallet=wallet+$pay, leavescound=leavescound+1 where id=$user_id";
            DB::update($sql);
		}
		return redirect( '/dashboard')->with( 'success', 'Salary processed Successfully' );
    }

      public function leaves() {
          $sql = "select distinct a.user_id, b.full_name from stafs_salery a ,users b where a.user_id=b.id";
          //$sql = "SELECT stafs_salery.user_id, users.full_name , count(stafs_salery.user_id) AS userid FROM users INNER JOIN stafs_salery ON users.id = stafs_salery.user_id GROUP BY stafs_salery.user_id";
          $leaves=DB::select($sql);

        return view('users/leaves',compact('leaves'));
    }


    public function profile()
     {
      $userid = Auth::user()->id;
      $profile = DB::table('users')->where('id','=', $userid)->get();

     return view('admin/users/profile', compact('profile'));
	 }



     public function updatepass(Request $request){
        $userid = Auth::user()->id;
        $old_password = trim($request->get("oldpassword"));
        $currentPassword = auth()->user()->password;
        if(Hash::check($old_password, $currentPassword)){
            $new_password = trim($request->get("new_password"));
            $confirm_password = trim($request->get("confirm_password"));
            if($new_password != $confirm_password){
                return redirect('changepassword')->with('error', 'Passwords does not match');
            }else{
                $updatepass = DB::table('users')->where('id', '=', $userid)->update([
                    'password'       => Hash::make($new_password),
                    'cpassword'      => $request->new_password,
                ]);
                return redirect('admin/dashboard')->with('success', 'Passwords Change Succesfully');
            }
        }else{
            return redirect("changepassword")->with('error', 'Sorry, your current password was not recognised');
        }
    }

    public function updateprofile(Request $request){
        $userid = Auth::user()->id;
        $updateprofile = DB::table( 'users' )->where('id',$userid)->update([
          'name'       => $request->name,
          'aadhar_no'  => $request->aadhar_no,
          'phone'      => $request->phone,
          'email'      => $request->email,
          'gender'     => $request->gender,
          'address'    => $request->address,
          'upi'        => $request->upi,
        ]);

        $qrcode ="";
        if($request->payment_qr_oode != null){
         $qrcode = $userid.'.'.$request->file('payment_qr_oode')->extension();
         $filepath = public_path('upload'.DIRECTORY_SEPARATOR.'qrcodeimg'.DIRECTORY_SEPARATOR);
         move_uploaded_file($_FILES['payment_qr_oode']['tmp_name'], $filepath.$qrcode);
         $sql = "update users set payment_qr_oode='$qrcode' where id = $userid";
           DB::update(DB::raw($sql));
       }
       return redirect('admin/dashboard')->with('success', 'Update User Successfully ... !');
      }

      public function saveprofile(Request $request){
        $user_id = Auth::user()->id;
        $saveprofile = DB::table( 'users' )->where('id',$user_id)->update([
          'name'       => $request->name,
          'email'      => $request->email,
          'address'    => $request->address,
        ]);

        return redirect()->back()->with( 'success', 'Profile Updated Successfully ... !' );
      }


	public function funnel($id)
	{
		$login_id = Auth::user()->id;
		$users = DB::table('users')->where('id',$id)->get();
        $usersfunnel = DB::table( 'funnel' )->select( 'funnel.*', 'leads_type.*', 'funnel.id as usersID' )
            ->Join( 'leads_type', 'leads_type.id', '=', 'funnel.status' )
            ->where( 'funnel.user_id', $id )
            ->orderBy( 'funnel.id', 'Asc' )->get();

		$leadstype = DB::table('leads_type')->get();
            return view( 'admin/users/funnel', compact( 'users','usersfunnel','leadstype') );
	}

	public function deletefunnel(Request $request){
		//dd ($request->all());die;
        DB::table( 'funnel' )->where( 'id', $request->id )->delete();
		return redirect('admin/funnel/' .$request->project_id)->with('success', 'funnel  delete Successfully');

	}

		public function addfunnel(Request $request){
			$status = $request->status;
			$project_id = $request->project_id;
		DB::table('funnel')->insert([
			'user_id'         =>   $request->project_id,
			'funnel'          =>   $request->funnel,
			'status'          =>   $status,
			'date'            =>   $request->date,
			'update_date'     =>   $request->latest_update,
			'login_id'        =>   Auth::user()->id,
		]);

		  DB::table( 'users' )->where( 'id', $project_id )->update( [
            'folllow_date'    =>   $request->date,
			'leads_type_id'   =>   $status,
			'updated_at'      =>   $request->date,
			'login_id'        =>   Auth::user()->id
        ] );

		return redirect('admin/funnel/' .$project_id)->with('success', 'Project Added Successfully');
	}

    public function addlead(Request $request)
    {
        $referral_id = Auth::user()->id;
        //$leads_type_name = DB::table('leads_type')->orderBy( 'id', 'Asc' )->get();
     DB::table('users')->insert([
    	'name' => $request->name,
    	'email' => $request->email,
    	'phone_number' => $request->phone_number,
        'address' => $request->address,
        'pincode' => $request->pincode,
        'location' => $request->location,
        'referral_id' => $referral_id,
	    'folllow_date'      =>   date( 'Y-m-d' ),
        'leads_type_id' =>1,
        'usertype_id' => 3,
    	]);
    	return redirect()->back()->with('success', 'Add lead Successfully ... !');
    }

    public function attendancein( Request $request ) {
        DB::table( 'attendance' )->insert( [
            'status'           =>   'Time In',
            'time_in'          =>   date( 'h:iA' ),
            'date'             =>   date( 'Y-m-d' ),
            'user_id'          =>   $request->log_id,
        ] );
if (Auth::user()->usertype_id == 1 || Auth::user()->usertype_id == 2 ){
        return redirect( 'admin/dashboard' )->with( 'success', 'Attendance Time In Successfully' );
} else {
        return redirect()->back()->with( 'success', 'Attendance Time In Successfully ... !' );
	}
    }

    public function apprulayer( Request $request ) {
        DB::table( 'attendance' )->where( 'id', $request->row_id )->update( [
            'message'          => 'AppruLeaves',
        ] );
	     $sql="update users set leavescound=leavescound-1 where id=$request->row_id";
          DB::update($sql);
        return redirect()->back()->with( 'success', 'Add Task Successfully ... !' );
    }

	public function attendanceins( Request $request ) {
		$loginid =Auth::user()->id;
        DB::table( 'attendance' )->insert( [
            'date'             => $request->date,
            'time_in'          => '09:00PM',
            'status'           => 'Time In',
            'message'          => 'LeavesApply',
            'user_id'          => $loginid,
        ] );
		$leavescound = '1';
        $sql = "update users set leavescound = leavescound - $leavescound where id = '$loginid'";
        DB::update( DB::raw( $sql ) );

        return redirect()->back()->with( 'success', 'Leaves Apply Successfully ... !' );
    }

	public function deleteapplayer( $id, $user_id ) {
		$leavescound = '1';
        $sql = "DELETE FROM attendance WHERE id = '$id'";
        DB::update( DB::raw( $sql ) );
        $sql = "update users set leavescound = leavescound + $leavescound where id = '$user_id'";
        DB::update( DB::raw( $sql ) );
        return redirect()->back()->with( 'success', 'Leaves Apply Successfully ... !' );
    }


    public function attendanceout( Request $request ) {
        $time_in = $request->time_in;
        $time_out = date( 'h:iA' );
        $datediff = strtotime( $time_out )  - strtotime( $time_in );
        $days = $datediff / ( 60 * 60 );
        $Hours = $days - 1;
        $Hours = number_format( ( float )$Hours, 2, '.', '' );

        DB::table( 'attendance' )->where( 'id', $request->att_id )->update( [
            'status'           =>   'Time Out',
            'date'             =>   date( 'Y-m-d' ),
            'time_out'         =>   date( 'h:iA' ),
            'hours'            => 	$Hours,
            'user_id'          =>   $request->log_id
        ] );
if (Auth::user()->usertype_id == 1 || Auth::user()->usertype_id == 2 ){
        return redirect( 'admin/dashboard' )->with( 'success', 'Attendance Time Out Successfully' );
} else {
        return redirect()->back()->with( 'success', 'Attendance Time Out Successfully ... !' );
	}
    }

	    public function userattendanceout( Request $request ) {
			$hours ="";
        $time_in = $request->time_in;
        $time_out = $request->timeout;
        $datediff = strtotime( $time_out )  - strtotime( $time_in );
        $days = $datediff / ( 60 * 60 );
        $Hours = $days - 1;
        $Hours = number_format( ( float )$Hours, 2, '.', '' );

        DB::table( 'attendance' )->where( 'id', $request->att_id )->update( [
            'status'           =>   'Time Out',
            'date'             =>   date( 'Y-m-d' ),
            'time_out'         =>   $request->time_out,
            'hours'            => 	$hours,
            'user_id'          =>   $request->user_id,
        ] );
if (Auth::user()->usertype_id == 1 || Auth::user()->usertype_id == 2 ){
        return redirect( 'admin/dashboard' )->with( 'success', 'Attendance Time Out Successfully' );
} else {
        return redirect()->back()->with( 'success', 'Attendance Time Out Successfully ... !' );
	}
    }


    public function attendances() {
		$date = date( 'Y-m-d' );
        $attendances = DB::table( 'attendance' )->select( 'attendance.*', 'users.name', 'users.id as users_id' )
        ->Join( 'users', 'users.id', '=', 'attendance.user_id' )
        ->where( 'attendance.date', $date )
        ->orderBy( 'attendance.id', 'Asc' )->get();
        $user = DB::table( 'users' )->where( 'status', 'Active' )->get();

        return view( 'admin/users/attendance', compact( 'attendances','user' ) );
    }

    public function attendancelist ( Request $request ) {
        $from = $request->from;
        $to = $request->to;
        $attendances = DB::table( 'attendance' )->select( 'attendance.*', 'users.full_name', 'attendance.id as attendance_id' )
        ->Join( 'users', 'users.id', '=', 'attendance.user_id' )
        ->where( 'attendance.date', '>=', $from )->where( 'attendance.date', '<=', $to )
        ->orderBy( 'attendance.id', 'Asc' )->get();

        return view( 'admin/users/attendance', compact( 'attendances' ) );
    }

    public function userattendances ( $id ) {
        $attendances = DB::table( 'attendance' )->select( 'attendance.*', 'users.name', 'attendance.id as attendance_id' )
        ->Join( 'users', 'users.id', '=', 'attendance.user_id' )
        ->where( 'attendance.user_id', $id )
        ->orderBy( 'attendance.id', 'Asc' )->get();

        return view( 'admin/users/userattendance', compact( 'attendances' ) );
    }

    public function adduser( Request $request ) {
        //dd($request->all());
        $userid = DB::table( 'users' )->insertGetId( [
            'name' => $request->name,
            'aadhar_no' => $request->aadhar_no,
            'phone' => $request->phone,
            'email' => $request->email,
            'password'=>   Hash::make( $request->password ),
            'cpassword' => $request->password,
            'address' => $request->address,
            'store_id' => $request->store_id,
            'usertype_id' => $request->usertype,
            'referral_id' => Auth::user()->id,
        ] );

        if ( $request->has( 'deliverable_location' ) ) {
            foreach ( $request->input( 'deliverable_location' ) as $key => $loc ) {
// code...
                DB::table( 'deliverable_location' )->insert( [
                    'store_id'          =>   $userid,
                    'deliverable_id'    =>   $loc,
                    'created_at'        =>   date( 'Y-m-d H:i:s' ),

                ] );
            }

        }

        return redirect()->back()->with( 'success', 'Users Added Successfully ... !' );

    }

   public function edituser( $id ) {

        $stores = DB::table( 'users' )->where( 'id', $id )->orderBy( 'id', 'Asc' )->get();
        $usertype = DB::table( 'user_type' )->orderBy( 'id', 'Asc' )->get();
		$shop = DB::table( 'users' )->where( 'usertype_id', 5 )->orderBy( 'id', 'Asc' )->get();
        $stores = json_decode( json_encode( $stores ), true );
        $location = array();
        foreach ( $stores as $key => $store ) {
            $stores[ $key ][ 'deliverable_location' ] = array();
            $store_id = $store[ 'id' ];
            $sql = "select deliverable_id from deliverable_location where store_id=$store_id order by id desc";
            $result = DB::select( $sql );

            $stores[ $key ][ 'deliverable_location' ] = $result;

        }
        $stores = json_decode( json_encode( $stores ) );
        $sql = "select * from location where id not in (select distinct(deliverable_id) from deliverable_location where store_id <> $store_id)";
        $location = DB::select( $sql );

        return view( 'admin/users/edit', compact( 'stores', 'location','usertype','shop' ) );
    }

     public function storesproducts( $id ) {

        //$sql = "select category_id,products.id,product_name,stock_value,max_stock,min_stock from products left outer join stock on (products.id=stock.product_id) where stock.store_id= $id";
        $products = DB::table( 'products' )->orderBy( 'id', 'Asc' )->get();
        $products = json_decode( json_encode( $products ), true );
        foreach ( $products as $key => $prod ) {
            //dd( $products );
            $prodid = $prod[ 'id' ];
            //echo $prodid;
            $stock = DB::table( 'stock' )->select( 'stock_value', 'min_stock', 'max_stock' )->where( 'product_id', $prodid )->where( 'store_id', $id )->orderBy( 'id', 'Asc' )->get();
            $products[ $key ][ 'stock_value' ] = 0;
            $products[ $key ][ 'min_stock' ] = 0;
            $products[ $key ][ 'max_stock' ] = 0;
            if ( count( $stock ) > 0 ) {
                $products[ $key ][ 'stock_value' ] = $stock[ 0 ]->stock_value;
                $products[ $key ][ 'min_stock' ] = $stock[ 0 ]->min_stock;
                $products[ $key ][ 'max_stock' ] = $stock[ 0 ]->max_stock;
            }
            $products[ $key ][ 'storeid' ] = $id;
        }
        $products = json_decode( json_encode( $products ) );
        //dd( $products );

        return view( 'admin/stores/storesproducts', compact( 'products' ) );

    }


    public function updateuser( Request $request ) {
        //dd( $request->all() );
        $userid = $request->row_id;
        DB::table( 'users' )->where( 'id', $userid )->update( [
            'name'        => $request->name,
            'email'       => $request->email,
            'email'       => $request->email,
            'phone'       => $request->phone,
            'store_id'    => $request->store_id,
            'usertype_id' => $request->usertype_id,
            'address'     => $request->address,
            'location'    => $request->location,
            'leavescound' => $request->leavescound,
            'salery'      => $request->salery,
            'status'      => $request->status,
        ] );

        if ($request->has( 'deliverable_location' ) != '' ) {
            DB::table( 'deliverable_location' )->where( 'store_id', $userid )->delete();
            foreach ( $request->input( 'deliverable_location' ) as $key => $loc ) {
                DB::table( 'deliverable_location' )->insert( [
                    'store_id'          =>   $userid,
                    'deliverable_id'    =>   $loc,
                    'created_at'        =>   date( 'Y-m-d H:i:s' ),

                ] );
            }
        }

        $qrcode = '';
        if ( $request->photo != null ) {
            $qrcode = $userid.'.'.$request->file( 'photo' )->extension();

            $filepath = public_path( 'upload'.DIRECTORY_SEPARATOR.'users'.DIRECTORY_SEPARATOR );
            move_uploaded_file( $_FILES[ 'photo' ][ 'tmp_name' ], $filepath.$qrcode );
            $sql = "update users set photo='$qrcode' where id = $userid";
            DB::update( DB::raw( $sql ) );
        }

        return redirect( 'admin/users/'.$request->usertype_id );
    }


    public function saleshistory( $from,$to ){

		  $sql = "select a.*,b.name as refname from users a,users b where a.referral_id=b.id and a.leads_type_id ='4' and a.id not in (select customer_id from orders where order_date >= '$from' and order_date <= '$to') order by a.id desc";
        $saleshistory = DB::select( $sql );
		//dd($saleshistory);

        return view( 'admin/users/saleshistory', compact( 'saleshistory','from','to') );

    }

    public function checkemail( Request $request )
    {
        $email = trim( $request->email );
        $id = trim( $request->id );
        if ( $id == 0 ) {
            $sql = "SELECT * FROM users where email='$email'";
        } else {
            $sql = "SELECT * FROM users where email='$email' and id <> $id";
        }
        $users = DB::select( DB::raw( $sql ) );
        if ( count( $users ) > 0 ) {
            return response()->json( array( 'exists' => true ) );
        } else {
            return response()->json( array( 'exists' => false ) );
        }
    }

    public function checkeditemail( Request $request )
    {
        $email = trim( $request->email );
        $id = trim( $request->id );
        if ( $id == 0 ) {
            $sql = "SELECT * FROM users where email='$email'";
        } else {
            $sql = "SELECT * FROM users where email='$email' and id <> $id";
        }
        $users = DB::select( DB::raw( $sql ) );
        if ( count( $users ) > 0 ) {
            return response()->json( array( 'exists' => true ) );
        } else {
            return response()->json( array( 'exists' => false ) );
        }
    }

    public function purchase( $id ) {
        $purchases = DB::table( 'purchase' )->where( 'member_id', $id )->orderBy( 'id', 'Asc' )->get();
        return view( 'users/purchase', compact( 'purchases', 'id' ) );
    }

    public function addproduct( Request $request ) {
        $log_id = Auth::user()->id;
        $amount = $request->amount;
        $paydate = date('Y-m-d');
        $time = date("H:i:s");
        $member_id = $request->member_id;
        DB::table( 'purchase' )->insert( [
            'member_id' => $request->member_id,
            'amount' => $amount,
            'purchase_date' =>  date( 'Y-m-d' ),
            'added_datetime' =>  date( 'Y-m-d H:i:s' ),
            'log_id' => $log_id,
        ] );
        $percentage = 10;
        $points = round($amount * $percentage / 100);
        $ad_info = "In Payment";
        $service_status = "In Payment";
        $sql = "insert into payment (log_id,from_id,to_id,amount,ad_info,service_status,time,paydate) values ('$log_id','$member_id','$member_id', '$points','$ad_info', '$service_status','$time','$paydate')";
        DB::insert(DB::raw($sql));
        $sql = "update users set wallet = wallet + $points where id = $member_id";
        DB::update(DB::raw($sql));
        $user_id = $member_id;
        $paycount = 1;
        while($paycount < 7){
            $paycount++;
            $sql = "select referral_id from users where id = $user_id";
            $result = DB::select(DB::raw($sql));
            if(count($result) > 0){
                $user_id = $result[0]->referral_id;
                if($user_id == 1) break;
                if($paycount == 2){
                    $percentage = 2;
                }else if($paycount == 3){
                    $percentage = 1;
                }else{
                    $percentage = 0.5;
                }
                $points = round($amount * $percentage / 100);
                $sql = "insert into payment (log_id,from_id,to_id,amount,ad_info,service_status,time,paydate) values ('$log_id','$member_id','$user_id', '$points','$ad_info', '$service_status','$time','$paydate')";
                DB::insert(DB::raw($sql));
                $sql = "update users set wallet = wallet + $points where id = $user_id";
                DB::update(DB::raw($sql));
            }
        }
        return redirect( "/purchase/$member_id" )->with( 'success', 'Purchase added successfully');
    }

    public function delivery () {

        $delivery = DB::table( 'users' )->where( 'usertype_id', 6 )->orderBy( 'id', 'Asc' )->get();
        $shop = DB::table( 'users' )->where( 'usertype_id', 5 )->orderBy( 'id', 'Asc' )->get();

        return view( 'users.delivery', compact( 'delivery', 'shop' ) );
    }

    public function addelivery( Request $request ) {

        $addelivery = DB::table( 'users' )->insert( [
            'name' => $request->name,
            'dob' => $request->dob,
            'aadhar_no' => $request->aadhar_no,
            'phone' => $request->phone,
            'email' => $request->email,
            'password'=>   Hash::make( $request->password ),
            'cpassword' => $request->password,
            'address' => $request->address,
            'store_id' => $request->store_id,
            'usertype_id' => '6',
        ] );

        return redirect()->back()->with( 'success', 'Delivery Person Add Successfully ... !' );

    }

    public function updatedelivery( Request $request ) {

        $updatedelivery = DB::table( 'users' )->where( 'id', $request->deliver_id )->update( [
            'name'      => $request->name,
            'dob'       => $request->dob,
            'aadhar_no' => $request->aadhar_no,
            'phone'     => $request->phone,
            'email'     => $request->email,
            'address'   => $request->address,
            'shop_id'   => $request->store_id,
        ] );

        return redirect()->back()->with( 'success', 'Update Delivery Successfully ... !' );

    }

    public function leads($leads_type_id, $from, $to) {
        $referral_id = Auth::user()->id;
         $sql="select a.*,b.name as refname,c.usertype_name from users a,users b,user_type c where a.referral_id=b.id and a.usertype_id=c.id and a.usertype_id ='3' and a.leads_type_id= $leads_type_id and a.folllow_date >= '$from' and a.folllow_date <= '$to' order by a.id";
        $users = DB::select($sql);

        $location = DB::table('location')
        ->whereNotIn('id', DB::table('deliverable_location')->pluck('deliverable_id') )->distinct()
        ->get();

        $usertype = DB::table( 'user_type' )->orderBy( 'id', 'Asc' )->get();
        $leads_type  = DB::table( 'leads_type' )->orderBy( 'id', 'Asc' )->get();
        $shop = DB::table( 'users' )->where( 'usertype_id', '5' )->get();
        $leadstypename = DB::table( 'leads_type' )->where( 'id', $leads_type_id )->first();
        return view( 'admin/users/leads', compact( 'users','location','usertype','shop','leads_type','leadstypename', 'from', 'to','leads_type_id' ) );

    }
     public function contact() {
      $contact = DB::table('contact_details')->orderBy( 'id', 'DESC' )->get();

        return view('admin/users/contact',compact('contact'));
    }



     public function updatelead(Request $request)
    {
     DB::table('users')->where( 'id', $request->lead_id )->update([
    	'name' => $request->name,
    	'email' => $request->email,
    	'phone' => $request->phone,
    	'phone_number' => $request->phone_number,
        'address' => $request->address,
        'pincode' => $request->pincode,
        'location' => $request->location,
        'leads_type_id' => $request->leads_type_id,
        'folllow_date' => $request->follow_date,
    	]);
    	return redirect()->back()->with('success', 'Update Lead Successfully ... !');
    }

    public function dropleads( $id ) {
        $dropleads = DB::table( 'users' )->where( 'id', $id )->delete();
        return redirect()->back()->with('success', 'Leads deleted Successfully ... !');
    }
    public function droptrafic( $id ) {
        $droptrafic = DB::table( 'users' )->where( 'id', $id )->delete();
        return redirect()->back()->with('success', 'Trafic deleted Successfully ... !');
    }

    public function logout(){
        Auth::guard()->logout();
        return redirect()->intended('/');
    }
}
