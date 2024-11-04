@extends('admin/layouts.app')
@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="content-header">
                </div>
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Projects Details</h3>
                    </div>
                    <div class="card-body">
                        @if (session()->has('success'))
                            <div class="alert alert-success alert-dismissable" style="margin: 15px;">
                                <a href="#" style="color:white !important" class="close" data-dismiss="alert"
                                    aria-label="close">&times;</a>
                                <strong> {{ session('success') }} </strong>
                            </div>
                        @endif
                        <table id="example2" class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Project Name</th>
                                    <th>Project Amount</th>
                                    <th>Project Type</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($projects as $pro)
                                    <tr>
                                        <td>{{ $pro->id }}</td>
                                        <td>{{ $pro->project_name }}</td>
                                        <td>{{ $pro->project_amount }}</td>
                                        <td>{{ $pro->project_status_id }}</td>
                                        <td>
                                        <a class="btn btn-primary btn-sm"
                                            href="{{ url('admin/editproject', $pro->id) }}"><i class="fa fa-edit"> Edit</i></a>

                                        <a onclick="return confirm('Do you want to perform delete operation?')"
                                            href="{{ url('/dropproject', $pro->id) }}" class="btn btn-danger btn-sm"><i class="fa fa-trash"> Delete</i></a>

                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('page_scripts')
    <script>
    </script>
@endpush
