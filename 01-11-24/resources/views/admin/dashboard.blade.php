@extends('admin.layouts.app')
@section('content')

<div class="content-header">
<div class="container-fluid">
<div class="row mb-2">
<div class="col-sm-6">
<h1 class="m-0">Dashboard</h1>
</div>
<div class="col-sm-6">
<ol class="breadcrumb float-sm-right">
<li class="breadcrumb-item"><a href="#">Home</a></li>
<li class="breadcrumb-item active">Dashboard v1</li>
</ol>
</div>
</div>
</div>
</div>

<section class="content">
<div class="container-fluid">

<div class="row">
<div class="col-lg-3 col-6">


<div class="small-box bg-info">
<div class="inner">
<h3>{{ $project }}</h3>
<p>Project</p>
</div>
<div class="icon">
<i class="ion ion-bag"></i>
</div>
<a href="{{ url('admin/projects/addproject') }}" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
</div>
</div>
<div class="col-lg-3 col-6">

<div class="small-box bg-danger">
<div class="inner">
<h3>{{ $banners }}</h3>
<p>Banners</p>
</div>
<div class="icon">
<i class="ion ion-pie-graph"></i>
</div>
<a href="{{ url('admin/banners') }}" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
</div>
</div>
</div>
</section>

@endsection
