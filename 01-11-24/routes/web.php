<?php
use Illuminate\Support\Facades\Route;


Auth::routes();
Route::get('', [App\Http\Controllers\MainController::class, 'home'])->name('home');
Route::get('home', [App\Http\Controllers\MainController::class, 'home'])->name('home');
Route::get('projects', [App\Http\Controllers\MainController::class, 'projects'])->name('projects');
Route::get('about_us', [App\Http\Controllers\MainController::class, 'about_us'])->name('about_us');
Route::get('gallery', [App\Http\Controllers\MainController::class, 'gallery'])->name('gallery');
Route::get('testimonial', [App\Http\Controllers\MainController::class, 'testimonial'])->name('testimonial');
Route::get('contactus', [App\Http\Controllers\MainController::class, 'contactus'])->name('contactus');
ROUTE::post('contactdetails', [App\Http\Controllers\MainController::class, 'contactdetails'])->name('contactdetails');
Route::get('admin/contact',[App\Http\Controllers\Admin\UsersController::class, 'contact'])->name('contact');
Route::post('/updatedetails',[App\Http\Controllers\MainController::class, 'updatedetails'])->name('updatedetails');



Route::get('project/{id}', [App\Http\Controllers\MainController::class, 'project'])->name('project');
Route::get('projects/{id}', [App\Http\Controllers\MainController::class, 'projects'])->name('projects');
Route::get('admin', [App\Http\Controllers\MainController::class, 'admin'])->name('admin');

Route::get('slider', [App\Http\Controllers\MainController::class, 'slider'])->name('slider');
Route::get('admin/category/{id}', [App\Http\Controllers\MainController::class, 'categoryproducts'])->name('categoryproduct');
Route::post('saveorder', [App\Http\Controllers\MainController::class, 'saveorder'])->name('saveorder');


//admin
Route::get('admin/dashboard', [App\Http\Controllers\Admin\DashboardController::class, 'dashboard'])->name('dashboard');
Route::get('admin/addproject', [App\Http\Controllers\Admin\ProductsController::class, 'addproject'])->name('addproject');

Route::get('admin/projects/{id}', [App\Http\Controllers\Admin\ProductsController::class, 'projects'])->name('projects');
Route::get('admin/project/viewproducts', [App\Http\Controllers\Admin\ProductsController::class, 'project'])->name('project');
Route::post('saveproject', [App\Http\Controllers\Admin\ProductsController::class, 'saveproject'])->name('saveproject');
Route::post('saveprojectimage', [App\Http\Controllers\Admin\ProductsController::class, 'saveprojectimage'])->name('saveprojectimage');


Route::get('admin/editproject/{id}', [App\Http\Controllers\Admin\ProductsController::class, 'editproject'])->name('editproject');

ROUTE::post('updateproject', [App\Http\Controllers\Admin\ProductsController::class, 'updateproject'])->name('updateproject');



Route::get('/dropproject/{id}', [App\Http\Controllers\Admin\ProductsController::class, 'dropproject'])->name('dropproject');

Route::get('admin/pendingorder', [App\Http\Controllers\Admin\ProductsController::class, 'pendingorder'])->name('pendingorder');
Route::get('admin/completedorder', [App\Http\Controllers\Admin\ProductsController::class, 'completedorder'])->name('completedorder');
ROUTE::get('deleteimage/{id}', [App\Http\Controllers\Admin\ProductsController::class, 'deleteimage'])->name('deleteimage');


ROUTE::post('addcategory', [App\Http\Controllers\Admin\CategoryController::class, 'AddCategory'])->name('addcategory');
ROUTE::post('editcategory', [App\Http\Controllers\Admin\CategoryController::class, 'EditCategory'])->name('editcategory');
ROUTE::post('updatecategory', [App\Http\Controllers\Admin\CategoryController::class, 'updatecategory'])->name('updatecategory');



Route::get('admin/category', [App\Http\Controllers\Admin\CategoryController::class, 'category'])->name('category');

ROUTE::get('/dashboard', [App\Http\Controllers\Admin\BackupController::class, 'index'])->name('dashboard');


ROUTE::get('/admin/backup', [App\Http\Controllers\Admin\BackupController::class, 'index'])->name('backup');
ROUTE::get('/admin/backup/create', [App\Http\Controllers\Admin\BackupController::class, 'create'])->name('create');
ROUTE::get('/admin/backup/download/{file_name}', [App\Http\Controllers\Admin\BackupController::class, 'download'])->name('download');
ROUTE::get('/admin/backup/delete/{file_name}', [App\Http\Controllers\Admin\BackupController::class, 'delete'])->name('delete');


Route::get('logout', [App\Http\Controllers\Admin\UsersController::class, 'logout'])->name('logout');


Route::get('/admin/banners',[App\Http\Controllers\Admin\BannersController::class, 'banners'])->name('banners');
Route::post('addbanner',[App\Http\Controllers\Admin\BannersController::class, 'addbanner'])->name('addbanner');
Route::post('/updatebanners',[App\Http\Controllers\Admin\BannersController::class, 'updatebanners'])->name('updatebanners');
Route::get('deletebanner/{id}',[App\Http\Controllers\Admin\BannersController::class, 'deletebanner'])->name('deletebanner');
Route::get('/deletebanners/{id}',[App\Http\Controllers\Admin\BannersController::class, 'deletebanners'])->name('deletebanners');
Route::get('changepassword',[App\Http\Controllers\Admin\UsersController::class, 'changepassword'])->name('changepassword');
