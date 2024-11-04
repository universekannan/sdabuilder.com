<?php
namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Hash;
use Auth;
use Jenssegers\Agent\Agent;
use App\FCM;

class ProductsController extends Controller {

    public function __construct() {
        $this->middleware( 'auth' );
    }

    public function projects($id) {

      $projects = DB::table( 'project' )->where( 'project_status_id', $id )->orderBy( 'id', 'Asc' )->get();

        return view( 'admin/projects/index', compact( 'projects' ) );
    }

    public function dropproject( $id ) {
        $dropproduct = DB::table( 'project' )->where( 'id', $id )->delete();
        return redirect()->back()->with('success', 'product deleted Successfully ... !');
    }

    public function details( $status, $id ) {

        $orders = DB::table( 'order_details' )->select( 'order_details.*', 'orders.net_total')
        ->Join( 'orders', 'orders.id', '=', 'order_details.order_id' )
        ->where( 'order_details.order_id', $id )
        ->where( 'order_details.status', $status )
        ->orderBy( 'order_details.id', 'Asc' )->get();
        return view( 'admin/products/details', compact( 'orders' ) );
    }

    public function addproject() {
        $seller_id = auth()->user()->id;
        $project = DB::table( 'project' )->orderBy( 'id', 'desc' )->get();
       
        $seller = DB::table( 'users' )->where( 'id', $seller_id )->where( 'status', 1 )->orderBy( 'id', 'desc' )->get();

        return view( 'admin/projects/addproject', compact( 'project', 'seller') );
    }

    public function saveproject( Request $request ) {
        $project_status_id = $request->project_status_id;
        $name = $request->project_name;
        $project_name = str_replace( "'", '', $name );
        $project_name = str_replace( [ '\\', '/' ], ' ', $project_name );
        $output = preg_replace( '!\s+!', ' ', $project_name );
        $project_url =  strtolower( str_replace( ' ', '_', $output ) );

        $adduser = DB::table( 'project' )->insert( [
            
            'project_status_id'   => $request->project_status_id,
            'project_name'   => $request->project_name,
            'project_owner'  => $request->project_owner,
            'project_mobile' => $request->project_mobile,
            'project_email'  => $request->project_email,
            'project_amount' => $request->project_amount,
            'project_address'=> $request->project_address,
        ]);

        $last_insert_id = DB::getPdo()->lastInsertId();

        $photo = '';
        if ( $request->photo != null ) {
            $photo = $last_insert_id . '.' . $request->file( 'photo' )->extension();
            $filepath = public_path( 'upload' . DIRECTORY_SEPARATOR . 'projectsave' . DIRECTORY_SEPARATOR );
            move_uploaded_file( $_FILES[ 'photo' ][ 'tmp_name' ], $filepath . $photo );

            $addimg = DB::table( 'project' )->where( 'id', $last_insert_id )->update( [
                'photo'      => $photo,
            ] );
            
            
        } 

        return redirect( 'admin/projects/1' )->with( 'Success', 'Projects Added Successfully' );

    }

    public function editproject( $id ) {
     
	  $projects = DB::table('project')->where( 'id', $id )->first();
	  $project_status = DB::table('project_status')->get();
      $sql = "select * from project_image where project_id=$id";
      $projectimage = DB::select( DB::raw( $sql ) );
     //print_r($projects);die;
      return view( 'admin/projects/editproject', compact( 'projects','project_status','projectimage') );
    }


    public function saveprojectimage( Request $request ) {

        $project_id = $request->project_id;
        $project_name = $request->project_name;
        $output = preg_replace( '!\s+!', ' ', $project_name );
        $project_url =  strtolower( str_replace( ' ', '_', $output ) );

        $photo = '';
        if ( $request->photo != null ) {
            $photo = $project_url . '-' . $project_id . '.' . $request->file( 'photo' )->extension();
            $filepath = public_path( 'upload' . DIRECTORY_SEPARATOR . 'project' . DIRECTORY_SEPARATOR );
            move_uploaded_file( $_FILES[ 'photo' ][ 'tmp_name' ], $filepath . $photo );

             $addimg = DB::table( 'project_image' )->where( 'id', $project_id )->insert( [
                'photo'      => $photo,
                'project_id' => $project_id,

            ] );
        }

    return redirect()->back()->with( 'success', 'Projcets ADD Successfully ... !' );

    }

    public function updateproject( Request $request ) {
        $project_id = $request->project_id;
        $project_status_id = $request->project_status_id;
        $name = $request->project_name;
        $project_name = str_replace( "'", '', $name );
        $project_name = str_replace( [ '\\', '/' ], ' ', $project_name );
        $output = preg_replace( '!\s+!', ' ', $project_name );
        $project_url =  strtolower( str_replace( ' ', '_', $output ) );
        DB::table( 'project' )->where('id',$project_id)->update([ 
            
            'project_status_id'   => $request->project_status_id,
            'project_name'   => $request->project_name,
            'project_owner'  => $request->project_owner,
            'project_mobile' => $request->project_mobile,
            'project_email'  => $request->project_email,
            'project_amount' => $request->project_amount,
            'project_address'=> $request->project_address,
        ] ); 

        $last_insert_id = DB::getPdo()->lastInsertId();

        $photo = '';  
        if ( $request->photo != null ) {
            $photo = $last_insert_id . '.' . $request->file( 'photo' )->extension();
            $filepath = public_path( 'upload' . DIRECTORY_SEPARATOR . 'product' . DIRECTORY_SEPARATOR );
            move_uploaded_file( $_FILES[ 'photo' ][ 'tmp_name' ], $filepath . $photo );

            $addimg = DB::table( 'project' )->where( 'id', $last_insert_id )->update( [
                'photo'      => $photo,
            ] );
        }

        if ( $request->input( 'project' ) == '' ) {
            DB::table( 'project' )->where( 'id', $project_name )->delete();
        } else {
            DB::table( 'project' )->where( 'id', $project_status_id )->delete();
            foreach ( $request->input( 'project' ) as $key => $project_name ) {

                DB::table( 'project' )->insert( [
                    'project_status_id'   =>   $project_status_id,
                    'project_name'       =>   $project_name,
                ] );
            }
        }
        return redirect('admin/projects/'. $request->project_status_id)->with( 'Success', 'Projects Updated Successfully' );
    }

    public function pendingorder() {
        $pendingorder = DB::table( 'productorder' )->select( 'productorder.*', 'products.product_name')
        ->Join( 'products', 'products.id', '=', 'productorder.product_id' )
        ->where( 'productorder.status', 'Active' )
        ->orderBy( 'productorder.id', 'Asc' )->get();
        return view( 'admin/users/pendingorder', compact( 'pendingorder') );
    }

    public function completedorder() {
        $completedorder = DB::table( 'productorder' )->select( 'productorder.*', 'products.product_name')
        ->Join( 'products', 'products.id', '=', 'productorder.product_id' )
        ->where( 'productorder.status', 'Inactive' )
        ->orderBy( 'productorder.id', 'Asc' )->get();
        return view( 'admin/users/completedorder', compact( 'completedorder') );
    }
    
        public function deleteimage( $id ) {
        $dropproject = DB::table( 'project_image' )->where( 'id', $id )->delete();
        return redirect()->back()->with('success', 'Image deleted Successfully ... !');
    }
    
}
