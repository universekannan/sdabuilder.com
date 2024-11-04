<?php
namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Hash;
use Auth;
use App\Models\User;

class BannersController extends Controller
{

  public function __construct()
  {
         $this->middleware( 'auth' );
     }

	public function banners()
     {
      $banners = DB::table('banners')->orderBy('id', 'Asc')->get();
     return view('admin/banners/index', compact('banners'));

    }

    public function addbanner(Request $request)
    {
        $banner_name = $request->banner_name;
        $output = preg_replace( '!\s+!', ' ', $banner_name );
        $banner_url =  strtolower( str_replace( ' ', '_', $output ) );

        $addbanners = DB::table('banners')->insert([
            'banner_name'   => $request->banner_name,
            'description'   => $request->description,
            'banner_url'    => $banner_url,
            'status'        => 1,
        ]);

        $last_insert_id = DB::getPdo()->lastInsertId();

        $profile_photo = '';
        if ( $request->photo != null ) {
            $profile_photo = $last_insert_id . '.' . $request->file( 'photo' )->extension();
            $filepath = public_path( 'upload' . DIRECTORY_SEPARATOR . 'banners' . DIRECTORY_SEPARATOR );
            move_uploaded_file( $_FILES[ 'photo' ][ 'tmp_name' ], $filepath . $profile_photo );
        }

        $addimg = DB::table( 'banners' )->where( 'id', $last_insert_id )->update( [
            'photo' => $profile_photo,
        ] );
        return redirect('admin/banners')->with('success', 'Banner Added Successfully');

	  }

    public function updatebanners (Request $request)
    {

        $updatebanners  = DB::table('banners')->where('id', $request->row_id)->update([
            'banner_name'   => $request->banner_name,
            'banner_title'  => $request->banner_title,
            'description'   => $request->description,
            'status'        => $request->status,
        ]);

        $qrcode ="";
        if($request->photo != null){
         $qrcode = $request->row_id .'.'.$request->file('photo')->extension();
         $filepath = public_path('upload'.DIRECTORY_SEPARATOR.'banners'.DIRECTORY_SEPARATOR);
         move_uploaded_file($_FILES['photo']['tmp_name'], $filepath.$qrcode);

           $addimg = DB::table( 'banners' )->where( 'id', $request->row_id)->update( [
            'photo' => $qrcode,
        ] );
       }

        return redirect()->back()->with( 'success', 'Update Edit Banner Successfully ... !' );
    }

    public function deletebanner($id)
    {
      $sql = "delete from banners where id=$id";
        DB::delete(DB::raw($sql));
        return redirect('admin/banners')->with('success', 'Banners Deleted Successfully');
    }

    public function deletebanners($id)
    {
      $sql = "delete from banners where id=$id";
        DB::delete(DB::raw($sql));
        return redirect('admin/banners')->with('success', 'Banners Deleted Successfully');
    }

}
