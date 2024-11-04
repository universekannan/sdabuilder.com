<!DOCTYPE html>

<html lang="en">


<head>

    <!-- META -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>Gallery SDA Builder ,construction,architect,builder,construction company in Thukalay,builders in Thukalay, architect in Thukalay,Thukalay builders,architects in Thukalay,architectural firms in Thukalay,architectural firms in Thukalay,architectural firms in Thukalay,list of architects in Thukalay,top construction companies in Thukalay,Architecture firm,Building contractors,Architects,Home builders,Building promoter's,Construction company in Thukalay,Architecture firm in Thukalay,Building contractors in Thukalay,Architects in Thukalay,Home builders in Thukalay,Building in Thukalay,promoter's in Thukalay,Construction company in Kanyakumari district,Architecture firm in Kanyakumari district,Building contractors in Kanyakumari district,Architects in Kanyakumari district,Home builders in Kanyakumari district,Building in Kanyakumari district,promoter's in Kanyakumari district,Construction company in tamilnadu,Architecture firm in tamilnadu,Building contractors in tamilnadu,Architects in tamilnadu,Home builders in tamilnadu,Building in tamilnadu,promoter's in tamilnadu,Construction company in India,Architecture firm in India,Building contractors in India,Architects in India,Home builders in India,Building in India,promoter's in India,Construction company in marthandam,Architecture firm in marthandam,Building contractors in marthandam,Architects in marthandam,Home builders in marthandam,Building in marthandam,promoter's in marthandam,Construction company in nagercoil,Architecture firm in nagercoil,Building contractors in nagercoil,Architects in nagercoil,Home builders in nagercoil,Building in nagercoil,promoter's in nagercoil,Construction company in colachel,Architecture firm in colachel,Building contractors in colachel,Architects in colachel,Home builders in colachel,Building in colachel,promoter's in colachel,Construction company in Kulashekaram,Architecture firm in Kulashekaram,Building contractors in Kulashekaram,Architects in Kulashekaram,Home builders in Kulashekaram,Building in Kulashekaram,promoter's in Kulashekaram,Construction company in Thirunelveli,Architecture firm in Thirunelveli,Building contractors in Thirunelveli,Architects in Thirunelveli,Home builders in Thirunelveli,Building in Thirunelveli,promoter's in Thirunelveli</title>

<meta name="description" content="SDA Builder is a Construction and Promoters company based in thuckalay. We construct commercial and residential buildings . We are the best constructors in india.">

<meta name="keywords" content="Gallery SDA Builder,construction,architect,builder,construction company in Thukalay,builders in Thukalay, architect in Thukalay,Thukalay builders,architects in Thukalay,architectural firms in Thukalay,architectural firms in Thukalay,architectural firms in Thukalay,list of architects in Thukalay,top construction companies in Thukalay,Architecture firm,Building contractors,Architects,Home builders,Building promoter's,Construction company in Thukalay,Architecture firm in Thukalay,Building contractors in Thukalay,Architects in Thukalay,Home builders in Thukalay,Building in Thukalay,promoter's in Thukalay,Construction company in Kanyakumari district,Architecture firm in Kanyakumari district,Building contractors in Kanyakumari district,Architects in Kanyakumari district,Home builders in Kanyakumari district,Building in Kanyakumari district,promoter's in Kanyakumari district,Construction company in tamilnadu,Architecture firm in tamilnadu,Building contractors in tamilnadu,Architects in tamilnadu,Home builders in tamilnadu,Building in tamilnadu,promoter's in tamilnadu,Construction company in India,Architecture firm in India,Building contractors in India,Architects in India,Home builders in India,Building in India,promoter's in India,Construction company in marthandam,Architecture firm in marthandam,Building contractors in marthandam,Architects in marthandam,Home builders in marthandam,Building in marthandam,promoter's in marthandam,Construction company in nagercoil,Architecture firm in nagercoil,Building contractors in nagercoil,Architects in nagercoil,Home builders in nagercoil,Building in nagercoil,promoter's in nagercoil,Construction company in colachel,Architecture firm in colachel,Building contractors in colachel,Architects in colachel,Home builders in colachel,Building in colachel,promoter's in colachel,Construction company in Kulashekaram,Architecture firm in Kulashekaram,Building contractors in Kulashekaram,Architects in Kulashekaram,Home builders in Kulashekaram,Building in Kulashekaram,promoter's in Kulashekaram,Construction company in Thirunelveli,Architecture firm in Thirunelveli,Building contractors in Thirunelveli,Architects in Thirunelveli,Home builders in Thirunelveli,Building in Thirunelveli,promoter's in Thirunelveli"/>

<meta name="condect" content="9626646255" />

<meta name="adders" content="Kottamkachi Vilai, Muthalakurichy, Thiruvithamcode PO, Kannyakumari dist,Tamil Nadu,India. " />

<meta name="link" content="http://sdabuilders.com/gallery.php" />

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
      <div class="page-content">
        <div class="wt-bnr-inr overlay-wraper" style="background-image:url(assets/images/banner/gallery-banner.jpg);">
            <div class="overlay-main bg-black" style="opacity:0.5;"></div>
            <div class="container">
                <div class="wt-bnr-inr-entry">
                   <center> <h1 class="text-white">Gallery</h1></center>
                </div>
            </div>
        </div>
<div class="section-full p-t80" style="background-image:url(assets/images/background/bg-4.png); background-repeat:repeat;background-color:#273447; ">
   <div class="overlay-main"></div>
   <div class="container">
      <div class="section-head">
         <div class="row">
            <div class="col-md-3">
               <h2 class="text-uppercase text-white m-a0 p-t15">Gallery</h2>
            </div>
            <div class="col-md-9">
               <div class="filter-wrap p-tb15 right">
                  <ul class="masonry-filter outline-style button-skew text-uppercase customize">
                     <li class="active"><a data-filter="*" href="#"><span> All</span></a></li>
					 
@foreach ($projectstatus as $pro)
                     <li><a data-filter=".{{ $pro->id }}"><span> {{ $pro->project_status_name }}</span></a></li>
@endforeach
                  </ul>
               </div>
            </div>
         </div>
      </div>
   </div>
   <div class="section-full p-t80 p-b50  bg-no-repeat bg-bottom-center bg-cover" style="background-image:url(assets/images/background/bg-6.jpg);">
      <div class="container">
         <!-- GALLERY CONTENT START -->
         <div class="row">
            <div class="portfolio-wrap mfp-gallery no-col-gap">
               <!-- COLUMNS 1 -->
@foreach ($projectimg as $pro)
               <div class="masonry-item {{ $pro->project_status_id }} col-lg-4 col-md-4 col-sm-6 col-xs-6">
                  <div class="wt-gallery-bx p-a15">
                     <div class="wt-thum-bx wt-img-effect img-reflection p-a15">
                        <a href="javascript:void(0);">
                        <img src="{{ URL::to('/') }}/upload/projectsave/{{ $pro->photo }}" alt="{{ $pro->project_name }}" alt="">
                        </a>
                        <div class="overlay-bx">
                           <div class="overlay-icon">
                              <a href="javascript:void(0);">
                              <i class="fa fa-link wt-icon-box-xs"></i>
                              </a>
                              <a href="{{ URL::to('/') }}/upload/projectsave/{{ $pro->photo }}" alt="{{ $pro->project_name }}" class="mfp-link">
                              <i class="fa fa-picture-o wt-icon-box-xs"></i>
                              </a>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
@endforeach
            </div>
         </div>
      </div>
   </div>
</div>
</div>
@endsection


