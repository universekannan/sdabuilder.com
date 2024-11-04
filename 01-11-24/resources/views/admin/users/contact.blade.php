@extends('admin.layouts.app')
@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="content-header">
                </div>
                <div class="card card-primary">

                    <div class="card-header">
                        <h3 class="card-title">Enquiry</h3>
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
                            <table id="example2" class="table table-bordered">
                                <thead>
                                    <tr>
                                         
                                        <th>Id</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Subject</th>
                                        <th>Message</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($contact as $centerslist)
                                        <tr>

                                            <td>{{ $centerslist->id }}</td>
                                            <td>{{ $centerslist->full_name }}</td>
                                            <td>{{ $centerslist->email_address }}</td>
                                            <td>{{ $centerslist->phone }}</td>
                                            <td>{{ $centerslist->subject }}</td>
                                            <td>{{ $centerslist->message }}</td>
                                            @if ($centerslist->status == 1)
                                                <td>Active</td>
                                            @else
                                                <td>Inactive</td>
                                            @endif
                                            <td width="10%" style="white-space: nowrap">
                                                <a onclick="edit_center('{{ $centerslist->id }}','{{ $centerslist->full_name }}','{{ $centerslist->subject }}','{{ $centerslist->message }}','{{ $centerslist->email_address }}','{{ $centerslist->phone }}','{{ $centerslist->status }}')"
                                                    href="#" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i>
                                                    View</a>
                                                </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                         <div class="modal fade" id="editcenter">
                            <form action="{{ url('/updatedetails') }}" enctype="multipart/form-data" method="post">
                                {{ csrf_field() }}
                                <input type="hidden" name="row_id" id="row_id">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Edit  List</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <label for=" full_name" class="col-sm-4 col-form-label"><span
                                                                style="color:red">*</span> Full name</label>
                                                        <div class="col-sm-8">
                                                            <input required="required" type="text"
                                                                class="form-control" name="full_name" id="editfullname"
                                                                maxlength="30" placeholder="full Name">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        
                                        
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <label for="subject" class="col-sm-4 col-form-label"><span
                                                                style="color:red">*</span> Subject</label>
                                                        <div class="col-sm-8">
                                                            <input required="required" type="text"
                                                                class="form-control" name="subject" id="editsubject"
                                                                maxlength="30" placeholder="subject">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <label for="message" class="col-sm-4 col-form-label"><span
                                                                style="color:red">*</span> Message</label>
                                                        <div class="col-sm-8">
                                                            <textarea required="required" type="text"
                                                                class="form-control" name="message" id="editmessage"
                                                                maxlength="30" placeholder="Message"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                           
                                        
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <label for="email_address" class="col-sm-4 col-form-label"><span
                                                                style="color:red">*</span> Email address</label>
                                                        <div class="col-sm-8">
                                                            <input required="required" type="text"
                                                                class="form-control" name="email_address" id="editemailaddress"
                                                                maxlength="30" placeholder="email_address">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                    
                                        
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <label for="phone" class="col-sm-4 col-form-label"><span
                                                                style="color:red">*</span> Phone</label>
                                                        <div class="col-sm-8">
                                                            <input required="required" type="text"
                                                                class="form-control" name="phone" id="editphone"
                                                                maxlength="30" placeholder="phone">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        
                                    
                                        <div class="row">
                                            <div class="col-md-12">
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
        function edit_center(id, full_name, subject, message, email_address,phone, status) {
            $("#row_id").val(id);
            $("#editfullname").val(full_name);
            $("#editsubject").val(subject);
            $("#editmessage").val(message);
            $("#editemailaddress").val(email_address);
            $("#editphone").val(phone);
            $("#editstatus").val(status);
            $("#editcenter").modal("show");
            }

    </script>
@endpush
