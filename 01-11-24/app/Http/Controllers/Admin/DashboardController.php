<?php
namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Auth;
use App\Models\User;
use Jenssegers\Agent\Agent;
use App\FCM;

class DashboardController extends Controller
{
    public function __construct()
    {
        $this->middleware( 'auth' );
    }

    public function dashboard() {
	
       $sql = "select count(*) as project from project";
        $result = DB::select( DB::raw( $sql ) );
        if(count($result)>0){
            $project = $result[ 0 ]->project;
        }

        $sql = "select count(*) as banners from banners";
        $result = DB::select( DB::raw( $sql ) );
        if(count($result)>0){
            $banners = $result[ 0 ]->banners;
        }
		
	
    return view('admin/dashboard',compact( 'project','banners' ) );
    }
}
