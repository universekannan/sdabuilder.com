<!DOCTYPE html>

<html lang="en">


<head>

    <!-- META -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>Progress Project SDA Builder ,construction,architect,builder,construction company in Thukalay,builders in Thukalay, architect in Thukalay,Thukalay builders,architects in Thukalay,architectural firms in Thukalay,architectural firms in Thukalay,architectural firms in Thukalay,list of architects in Thukalay,top construction companies in Thukalay,Architecture firm,Building contractors,Architects,Home builders,Building promoter's,Construction company in Thukalay,Architecture firm in Thukalay,Building contractors in Thukalay,Architects in Thukalay,Home builders in Thukalay,Building in Thukalay,promoter's in Thukalay,Construction company in Kanyakumari district,Architecture firm in Kanyakumari district,Building contractors in Kanyakumari district,Architects in Kanyakumari district,Home builders in Kanyakumari district,Building in Kanyakumari district,promoter's in Kanyakumari district,Construction company in tamilnadu,Architecture firm in tamilnadu,Building contractors in tamilnadu,Architects in tamilnadu,Home builders in tamilnadu,Building in tamilnadu,promoter's in tamilnadu,Construction company in India,Architecture firm in India,Building contractors in India,Architects in India,Home builders in India,Building in India,promoter's in India,Construction company in marthandam,Architecture firm in marthandam,Building contractors in marthandam,Architects in marthandam,Home builders in marthandam,Building in marthandam,promoter's in marthandam,Construction company in nagercoil,Architecture firm in nagercoil,Building contractors in nagercoil,Architects in nagercoil,Home builders in nagercoil,Building in nagercoil,promoter's in nagercoil,Construction company in colachel,Architecture firm in colachel,Building contractors in colachel,Architects in colachel,Home builders in colachel,Building in colachel,promoter's in colachel,Construction company in Kulashekaram,Architecture firm in Kulashekaram,Building contractors in Kulashekaram,Architects in Kulashekaram,Home builders in Kulashekaram,Building in Kulashekaram,promoter's in Kulashekaram,Construction company in Thirunelveli,Architecture firm in Thirunelveli,Building contractors in Thirunelveli,Architects in Thirunelveli,Home builders in Thirunelveli,Building in Thirunelveli,promoter's in Thirunelveli</title>

<meta name="description" content="SDA Builder is a Construction and Promoters company based in thuckalay. We construct commercial and residential buildings . We are the best constructors in india.">

<meta name="keywords" content="Progress Project SDA Builder,construction,architect,builder,construction company in Thukalay,builders in Thukalay, architect in Thukalay,Thukalay builders,architects in Thukalay,architectural firms in Thukalay,architectural firms in Thukalay,architectural firms in Thukalay,list of architects in Thukalay,top construction companies in Thukalay,Architecture firm,Building contractors,Architects,Home builders,Building promoter's,Construction company in Thukalay,Architecture firm in Thukalay,Building contractors in Thukalay,Architects in Thukalay,Home builders in Thukalay,Building in Thukalay,promoter's in Thukalay,Construction company in Kanyakumari district,Architecture firm in Kanyakumari district,Building contractors in Kanyakumari district,Architects in Kanyakumari district,Home builders in Kanyakumari district,Building in Kanyakumari district,promoter's in Kanyakumari district,Construction company in tamilnadu,Architecture firm in tamilnadu,Building contractors in tamilnadu,Architects in tamilnadu,Home builders in tamilnadu,Building in tamilnadu,promoter's in tamilnadu,Construction company in India,Architecture firm in India,Building contractors in India,Architects in India,Home builders in India,Building in India,promoter's in India,Construction company in marthandam,Architecture firm in marthandam,Building contractors in marthandam,Architects in marthandam,Home builders in marthandam,Building in marthandam,promoter's in marthandam,Construction company in nagercoil,Architecture firm in nagercoil,Building contractors in nagercoil,Architects in nagercoil,Home builders in nagercoil,Building in nagercoil,promoter's in nagercoil,Construction company in colachel,Architecture firm in colachel,Building contractors in colachel,Architects in colachel,Home builders in colachel,Building in colachel,promoter's in colachel,Construction company in Kulashekaram,Architecture firm in Kulashekaram,Building contractors in Kulashekaram,Architects in Kulashekaram,Home builders in Kulashekaram,Building in Kulashekaram,promoter's in Kulashekaram,Construction company in Thirunelveli,Architecture firm in Thirunelveli,Building contractors in Thirunelveli,Architects in Thirunelveli,Home builders in Thirunelveli,Building in Thirunelveli,promoter's in Thirunelveli"/>

<meta name="condect" content="9626646255" />

<meta name="adders" content="Kottamkachi Vilai, Muthalakurichy, Thiruvithamcode PO, Kannyakumari dist,Tamil Nadu,India. " />

<meta name="link" content="http://sdabuilders.com/progress.php" />

<meta name="map" content="https://goo.gl/maps/nDQDuA2hwPP2" />

<meta name="author" content="Galaxy Kannan" />

<meta name="copyright" content="SDA Builder" />

<link rel="shortcut icon" href="assets/images/logo.png" title="SDA Builder"  />

<link href="" rel="search" title="Search SDA Builder" type="application/opensearchdescription+xml"/>

<meta http-equiv="content-type" content="text/html; charset=utf-8"/>

<link rel="icon" type="image/png" href="assets/images/logo.png">

<meta name="viewport" content="width=device-width, initial-scale=1"/>
    
	@extends('layouts.app')
@section('content')
<div class="page-content ">
        <div class="wt-bnr-inr overlay-wraper" style="background-image:url({{ URL::to('/') }}/assets/images/banner/all.jpg);">
            <div class="overlay-main bg-black" style="opacity:0.5;"></div>
                <div class="container">
                    <div class="wt-bnr-inr-entry">
                      <center>  <h1 class="text-white">About  {{ $project->project_name }}</h1></center>
                    </div>
                </div>
            </div>       
			
            <div class="section-full p-t80 p-b50 bg-gray">
                <div class="container">
                    <div class="row">
                        <div class="col-md-9">
                            <div class="blog-post blog-lg date-style-3 date-skew">
                                <div class="wt-post-media wt-img-effect zoom-slow">
                                   <img src="{{ URL::to('/') }}/upload/projectsave/{{ $project->photo }}" alt="{{ $project->project_name }}">
                                </div>
                                <div class="wt-post-info p-a30 p-b15  bg-white">
                                    
                                    <div class="wt-post-text">
                                       <p>{{ $project->project_name }}</p>
                                       <p>{{ $project->project_owner }}</p>
                                       <p>{{ $project->project_address }}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
						<div class="col-lg-3 col-md-3 col-sm-3">
                            <div class="section-head">
                                <h4 class="text-uppercase">Upcoming Projects</h4>

                            </div>
                            <div class="section-content">
                                                
                                <div class="owl-carousel client-logo-carousel-1 owl-btn-center-lr">
@foreach ($Upcomingprojects as $pro)
                                    <div class="item">
                                        <div class="ow-client-logo">
                                            <div class="client-logo wt-img-effect client-logo-media on-color bdr-1 bdr-gray">
                                            <a href="javascript:void(0);"><img src="{{ URL::to('/') }}/upload/projectsave/{{ $pro->photo }}" alt=""></a></div>
                                        </div>
                                    </div>
@endforeach
                                </div>
                            </div>   
							<hr>
							
                                <div class="section-head">
                                <h4 class="text-uppercase">Progress Projects</h4>

                            </div>
                            <div class="section-content">
                                                
                                <div class="owl-carousel client-logo-carousel-1 owl-btn-center-lr">
@foreach ($Progressprojects as $pro)
                                    <div class="item">
                                        <div class="ow-client-logo">
                                            <div class="client-logo wt-img-effect client-logo-media on-color bdr-1 bdr-gray">
                                            <a href="javascript:void(0);"><img src="{{ URL::to('/') }}/upload/projectsave/{{ $pro->photo }}" alt=""></a></div>
                                        </div>
                                    </div>
@endforeach
                                </div>
                            </div>   
							<hr>
							
 <div class="section-head">
                                <h4 class="text-uppercase">Completed Projects</h4>

                            </div>
                            <div class="section-content">
                                                
                                <div class="owl-carousel client-logo-carousel-1 owl-btn-center-lr">
@foreach ($Completedprojects as $pro)
                                    <div class="item">
                                        <div class="ow-client-logo">
                                            <div class="client-logo wt-img-effect client-logo-media on-color bdr-1 bdr-gray">
                                            <a href="javascript:void(0);"><img src="{{ URL::to('/') }}/upload/projectsave/{{ $pro->photo }}" alt=""></a></div>
                                        </div>
                                    </div>
@endforeach
                                </div>
                            </div>   
							<hr>

                            </div>     
							
						</div>
				   </aside>
                </div>
            </div>            
        </div>
		
		
</div>

<footer class="site-footer footer-dark">
<div class="call-to-action-wrap call-to-action-skew" style="background-image:url(assets/images/background/bg-4.png); background-repeat:repeat;background-color:#273447;">
   <div class="container">
      <div class="row">
         <div class="col-md-8 col-sm-8">
            <div class="call-to-action-left p-tb20 p-r50">
               <h4 class="text-uppercase m-b10">We are ready to build your dream tell us more about your project</h4>
               <p></p>
            </div>
         </div>
         <div class="col-md-4">
            <div class="call-to-action-right p-tb30">
               <a href="contact-us.php" class="site-button skew-icon-btn m-r15 text-uppercase"  style="font-weight:600;">
               Contact us <i class="fa fa-angle-double-right"></i>
               </a>
            </div>
         </div>
      </div>
   </div>
</div>
@endsection



