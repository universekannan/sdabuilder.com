<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>{{ config('app.name') }}</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="{!! asset('plugins/fontawesome-free/css/all.min.css') !!}">
<!-- overlayScrollbars -->
<link rel="stylesheet" href="{!! asset('plugins/overlayScrollbars/css/OverlayScrollbars.min.css') !!}">
<!-- Theme style -->
<link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">

<!-- icheck bootstrap -->
<link rel="stylesheet" href="{!! asset('plugins/icheck-bootstrap/icheck-bootstrap.min.css') !!}">
<!-- DataTables -->
<link rel="stylesheet" href="{!! asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') !!}">
<link rel="stylesheet" href="{!! asset('plugins/datatables-responsive/css/responsive.bootstrap4.min.css') !!}">
<link rel="stylesheet" href="{!! asset('plugins/datatables-buttons/css/buttons.bootstrap4.min.css') !!}">
<link rel="stylesheet" href="{!! asset('plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css') !!}">
<link rel="stylesheet" href="{!! asset('plugins/icheck-bootstrap/icheck-bootstrap.min.css') !!}">
<!-- fullCalendar -->
<link rel="stylesheet" href="{!! asset('plugins/fullcalendar/main.css') !!}">
<!-- daterange picker -->
<link rel="stylesheet" href="{!! asset('plugins/daterangepicker/daterangepicker.css') !!}">
<!-- Ekko Lightbox -->
<link rel="stylesheet" href="{!! asset('plugins/ekko-lightbox/ekko-lightbox.css') !!}">
<!-- Select2 -->
<link rel="stylesheet" href="{!! asset('plugins/select2/css/select2.min.css') !!}">
<link rel="stylesheet" href="{!! asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') !!}">
<link href="{{ asset('css/jquery-ui.css') }}" rel="stylesheet"/>
<link rel="stylesheet" href="{!! asset('plugins/select2/css/select2.min.css') !!}">
<link rel="stylesheet" href="{!! asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') !!}">

<link href="{{ asset('css/app.css') }}" rel="stylesheet">
<link href="{{ asset('css/dropzone.css') }}" rel="stylesheet">
<link href="{{ asset('css/cropper.css') }}" rel="stylesheet">

<meta name="theme-color" content="#6777ef"/>
<link rel="apple-touch-icon" href="{{ asset('/AdminLTELogo.png') }}">
<link rel="manifest" href="{{ asset('/manifest.json') }}">


@yield('third_party_stylesheets')

@stack('page_css')
 </head>
   <body>
      <div id="top-bar" class="container">
         <div class="row">
            <div class="span1"></div>
            <div class="span10">
               <img src="{!! asset('assets/images/logo/heder.png') !!}" alt="Jawaharlal International Institute for Education and Research " />
            </div>
            <div class="span1"></div>
         </div>
      </div>
      <div id="wrapper" class="container">
	  
	  @include('layouts.sidebar')

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <section class="content">
    @yield('content')
  </section>
</div>

<footer class="main-footer">
<strong><a target="_blank" href="https://galaxytechnologypark.com/">Galaxy Technology Park Inc</a></strong> 2023 &copy; All rights reserved.
</footer>
</div>


@yield('third_party_scripts')
 <script>
         function open_popup(){
         	$('#myModal').modal('show');
         }
         							
      </script>	
      <script src="{!! asset('assets/js/common.js') !!}"></script>
      <script src="{!! asset('assets/js/jquery.flexslider-min.js') !!}"></script>
      <script type="text/javascript">
         $(function() {
         	$(document).ready(function() {
         		$('.flexslider').flexslider({
         			animation: "fade",
         			slideshowSpeed: 4000,
         			animationSpeed: 600,
         			controlNav: false,
         			directionNav: true,
         			controlsContainer: ".flex-container" // the container that holds the flexslider
         		});
         	});
         });
         					
      </script>
	  
	  
</body>
</html>
