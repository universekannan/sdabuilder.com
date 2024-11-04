<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Auth;
use App\Models\User;

class AdminController extends Controller
 {
    public function __construct()
 {
        $this->middleware( 'auth' );
    }

    public function dashboard() {
       
        return view( 'admin.dashboard' );

    }
    

    public function addproject() {
       
        $categorys = DB::table( 'category' )->where( 'parent_id', 0 )->where( 'status', 1 )->orderBy( 'id', 'desc' )->get();
   
        return view( 'admin/projects/addproject', compact( 'category' ) );
		
    }
    
    public function viewproducts() {
       
        return view( 'admin/projects/viewproducts' );

    }
    

}
