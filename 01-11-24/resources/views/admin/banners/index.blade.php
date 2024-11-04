@extends('admin/layouts.app')
@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="content-header">
                </div>
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Banners</h3>
                        <button type="button" class="btn btn-sm btn-secondary float-right" data-toggle="modal"
                            data-target="#addbanner"><i class="fa fa-plus"> </i> Add Banner</button>
                    </div>
                    <div class="card-body">
                        @if (session()->has('success'))
                            <div class="alert alert-success alert-dismissable" style="margin: 15px;">
                                <a href="#" style="color:white !important" class="close" data-dismiss="alert"
                                    aria-label="close">&times;</a>
                                <strong> {{ session('success') }} </strong>
                            </div>
                        @endif
                        <div class="table-responsive">
                            <table id="example2" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>S No</th>
                                        <th>Id</th>
                                        <th>Banner Name</th>
                                        <th>Photo</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    @foreach ($banners as $key => $bannersslist)
                                        <tr>
                                            <td>{{ $key + 1 }}</td>
                                            <td>{{ $bannersslist->id }}</td>
                                            <td>{{ $bannersslist->banner_name }}</td>
                                            <td><img src="../upload/banners/{{ $bannersslist->photo }}" width="50" height="50"></td>

                                            @if ($bannersslist->status == 1)
                                                <td>Active</td>
                                            @else
                                                <td>Inactive</td>
                                            @endif
                                            <td style="white-space: nowrap">
                                                <a onclick="edit_banners('{{ $bannersslist->id }}','{{ $bannersslist->banner_name }}','{{ $bannersslist->banner_url }}','{{ $bannersslist->description }}','{{ $bannersslist->photo }}','{{ $bannersslist->status }}')"
                                                    href="#" class="btn btn-sm btn-primary"><i
                                                        class="fa fa-edit"></i>Edit</a>

                                                <a onclick="return confirm('Do you want to Confirm delete operation?')"
                                                    href="{{ url('/deletebanners', $bannersslist->id) }}"
                                                    class="btn btn-danger btn-sm"><i class="fa fa-trash"></i> Delete</a>

                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>

                        <div class="modal fade" id="addbanner">
                            <form action="{{ url('/addbanner') }}" enctype="multipart/form-data" method="post">
                                {{ csrf_field() }}
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Add Banners List</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <label for="banner_name" class="col-sm-4 col-form-label"><span
                                                                style="color:red">*</span> Banner name</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" class="form-control"
                                                                name="banner_name" id="banner_name" maxlength="30"
                                                                placeholder="Banner Name">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <label for="description" class="col-sm-4 col-form-label"><span
                                                                style="color:red">*</span>Short Description</label>
                                                        <div class="col-sm-8">
                                                            <textarea required="required" type="text" class="form-control"
                                                                name="description" row="2" maxlength="200"
                                                                placeholder="Banner Description"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <label for="banner_url" class="col-sm-4 col-form-label"><span
                                                                style="color:red">*</span>ReadMor Url</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" class="form-control"
                                                                name="banner_url" maxlength="500"
                                                                placeholder="ReadMor Url">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <label for="photo" class="col-sm-4 col-form-label"><span
                                                                style="color:red">*</span>Photo</label>
                                                        <div class="col-sm-8">
                                                            <input required="required" type="file" class="form-control"
                                                                name="photo" id="photo" maxlength="30"
                                                                placeholder="photo">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="modal-footer justify-content-between">
                                                <button type="button" class="btn btn-default"
                                                    data-dismiss="modal">Close</button>
                                                <input id="save" class="btn btn-primary" type="submit"
                                                    value="Submit" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="modal fade" id="editbanners">
                            <form action="{{ url('/updatebanners') }}" enctype="multipart/form-data" method="post">
                                {{ csrf_field() }}
                                <input type="hidden" name="row_id" id="row_id">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Edit Banners List</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <label for=" banner_name" class="col-sm-4 col-form-label"><span
                                                                style="color:red">*</span> Banner name</label>
                                                        <div class="col-sm-8">
                                                            <input required="required" type="text"
                                                                class="form-control" name="banner_name" id="editname"
                                                                maxlength="30" placeholder="Banner Name">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <label for="description" class="col-sm-4 col-form-label"><span
                                                                style="color:red">*</span>Short Description</label>
                                                        <div class="col-sm-8">
                                                            <textarea required="required" type="text"
                                                                class="form-control" name="description" id="editdescription" row="2"
                                                                maxlength="200" placeholder="Description"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <label for=" banner_name" class="col-sm-4 col-form-label"><span
                                                                style="color:red">*</span> ReadMore Url</label>
                                                        <div class="col-sm-8">
                                                            <input required="required" type="text"
                                                                class="form-control" name="banner_title" id="edittitle"
                                                                maxlength="30" placeholder="Banner Title">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <label for="photo" class="col-sm-4 col-form-label"><span
                                                                style="color:red">*</span>Photo</label>
                                                        <div class="col-sm-8">
                                                            <input required="required" type="file"
                                                                class="form-control" name="photo" id="editphoto"
                                                                maxlength="30" placeholder="photo">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="name" class="col-sm-4 col-form-label"><span
                                                        style="color:red">*</span>Status</label>
                                                <div class="col-sm-8">
                                                    <select name="status" class="form-control" id="editstatus">
                                                        <option value="1">Active</option>
                                                        <option value="0">Inactive</option>
                                                    </select>
                                                </div>
                                            </div>


                                            <div class="modal-footer justify-content-between">
                                                <button type="button" class="btn btn-default"
                                                    data-dismiss="modal">Close</button>
                                                <input id="save" class="btn btn-primary" type="submit"
                                                    value="Submit" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('page_scripts')
    <script>
        function edit_banners(id, banner_name, banner_url, description, photo, status) {
            $("#row_id").val(id);
            $("#editname").val(banner_name);
            $("#edittitle").val(banner_url);
            $("#editdescription").val(description);
            $("#editphoto").attr("src", "../upload/catimage/" + photo);
            $("#editstatus").val(status);
            $("#editbanners").modal("show");
        }

        function userdatas(id, full_name, regesteration_no, district_name, taluk_name, panchayath_name, pas,
            phone, status) {
            $("#id").text(id);
            $("#full_names").text(full_name);
            $("#username").text(regesteration_no);
            $("#districtname").text(district_name);
            $("#talukname").text(taluk_name);
            $("#panchayathname").text(panchayath_name);
            $("#pas").text(pas);
            $("#phones").text(phone);
            $("#status").text(status);
            $('#msgbtn').attr('href', 'https://api.whatsapp.com/send?phone=91' + phone +
                '&text=Sir, We are from NalaVariyam , Your Login UserName : ' + username + ', Password : ' + pas +
                ', Contact Us : Mobile 7598984380 Email : ramjitrust039@gmail.com, Websit : www.nalavariyam.com. I have attached your Login website  link below https://nalavariyam.com/apps/'
            )
            $("#userdata").modal("show");
        }
    </script>
@endpush
