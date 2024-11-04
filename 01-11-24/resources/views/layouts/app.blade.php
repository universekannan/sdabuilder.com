

<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
<link rel="icon" type="image/png" href="images/logo.png">
<meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- FAVICONS ICON -->
    <link rel="icon" href="images/logo.png" type="image/x-icon" />
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
    
    <!-- PAGE TITLE HERE -->
    
    <!-- MOBILE SPECIFIC -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- BOOTSTRAP STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="{!! asset('assets/css/bootstrap.min.css') !!}">
    <!-- FONTAWESOME STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="{!! asset('assets/css/fontawesome/css/font-awesome.min.css') !!}" />
    <!-- FLATICON STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="{!! asset('assets/css/flaticon.min.css') !!}">
    <!-- ANIMATE STYLE SHEET --> 
    <link rel="stylesheet" type="text/css" href="{!! asset('assets/css/animate.min.css') !!}">
    <!-- OWL CAROUSEL STYLE SHEET -->
	<link rel="stylesheet" type="text/css" href="{!! asset('assets/css/owl.carousel.min.css') !!}">
    <!-- BOOTSTRAP SELECT BOX STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="{!! asset('assets/css/bootstrap-select.min.css') !!}">
    <!-- MAGNIFIC POPUP STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="{!! asset('assets/css/magnific-popup.min.css') !!}">
    <!-- LOADER STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="{!! asset('assets/css/loader.min.css') !!}">    
    <!-- MAIN STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="{!! asset('assets/css/style.css') !!}">
    <!-- THEME COLOR CHANGE STYLE SHEET -->
    <link rel="stylesheet" class="skin" type="text/css" href="{!! asset('assets/css/skin/skin-1.css') !!}">
    <!-- CUSTOM  STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="{!! asset('assets/css/custom.css') !!}">
    <!-- SIDE SWITCHER STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="{!! asset('assets/css/switcher.css') !!}">    
    
    <!-- REVOLUTION SLIDER CSS -->
    <link rel="stylesheet" type="text/css" href="{!! asset('assets/plugins/revolution/revolution/css/settings.css') !!}">
    <!-- REVOLUTION NAVIGATION STYLE -->
    <link rel="stylesheet" type="text/css" href="{!! asset('assets/plugins/revolution/revolution/css/navigation.css') !!}">
    
    <!-- GOOGLE FONTS -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,300italic,400italic,500,500italic,700,700italic,900italic,900' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,800italic,800,700italic' rel='stylesheet' type='text/css'>

@yield('third_party_stylesheets')

@stack('page_css')
</head>
<body id="bg">
	<div class="page-wraper"> 

        @include('layouts.header')

    @yield('content')
        @include('layouts.footer')

@yield('third_party_scripts')
<!-- LOADING AREA  END ====== -->
<!-- JAVASCRIPT  FILES ========================================= --> 
<script type="text/javascript"  src="{!! asset('assets/js/jquery-1.12.4.min.js') !!}"></script><!-- JQUERY.MIN JS -->
<script type="text/javascript"  src="{!! asset('assets/js/bootstrap.min.js') !!}"></script><!-- BOOTSTRAP.MIN JS -->
<script type="text/javascript"  src="{!! asset('assets/js/bootstrap-select.min.js') !!}"></script><!-- FORM JS -->
<script type="text/javascript"  src="{!! asset('assets/js/jquery.bootstrap-touchspin.min.js') !!}"></script><!-- FORM JS -->
<script type="text/javascript"  src="{!! asset('assets/js/magnific-popup.min.js') !!}"></script><!-- MAGNIFIC-POPUP JS -->
<script type="text/javascript"  src="{!! asset('assets/js/waypoints.min.js') !!}"></script><!-- WAYPOINTS JS -->
<script type="text/javascript"  src="{!! asset('assets/js/counterup.min.js') !!}"></script><!-- COUNTERUP JS -->
<script type="text/javascript"  src="{!! asset('assets/js/waypoints-sticky.min.js') !!}"></script><!-- COUNTERUP JS -->
<script type="text/javascript" src="{!! asset('assets/js/isotope.pkgd.min.js') !!}"></script><!-- MASONRY  -->
<script type="text/javascript"  src="{!! asset('assets/js/owl.carousel.min.js') !!}"></script><!-- OWL  SLIDER  -->
<script type="text/javascript"  src="{!! asset('assets/js/stellar.min.js') !!}"></script><!-- PARALLAX BG IMAGE   --> 
<script type="text/javascript"  src="{!! asset('assets/js/scrolla.min.js') !!}"></script><!-- ON SCROLL CONTENT ANIMTE   -->
<script type="text/javascript"  src="{!! asset('assets/js/custom.js') !!}"></script><!-- CUSTOM FUCTIONS  -->
<script type="text/javascript"  src="{!! asset('assets/js/shortcode.js') !!}"></script><!-- SHORTCODE FUCTIONS  -->
<script type="text/javascript"  src="{!! asset('assets/js/switcher.js') !!}"></script><!-- SWITCHER FUCTIONS  -->
 
<!-- REVOLUTION JS FILES -->
<script type="text/javascript" src="{!! asset('assets/plugins/revolution/revolution/js/jquery.themepunch.tools.min.js') !!}"></script>
<script type="text/javascript" src="{!! asset('assets/plugins/revolution/revolution/js/jquery.themepunch.revolution.min.js') !!}"></script>
<!-- SLIDER REVOLUTION 5.0 EXTENSIONS  (Load Extensions only on Local File Systems !  The following part can be removed on Server for On Demand Loading) -->	
<script type="text/javascript" src="{!! asset('assets/plugins/revolution/revolution/js/extensions/revolution.extension.actions.min.js') !!}"></script>
<script type="text/javascript" src="{!! asset('assets/plugins/revolution/revolution/js/extensions/revolution.extension.carousel.min.js') !!}"></script>
<script type="text/javascript" src="{!! asset('assets/plugins/revolution/revolution/js/extensions/revolution.extension.kenburn.min.js') !!}"></script>
<script type="text/javascript" src="{!! asset('assets/plugins/revolution/revolution/js/extensions/revolution.extension.layeranimation.min.js') !!}"></script>
<script type="text/javascript" src="{!! asset('assets/plugins/revolution/revolution/js/extensions/revolution.extension.migration.min.js') !!}"></script>
<script type="text/javascript" src="{!! asset('assets/plugins/revolution/revolution/js/extensions/revolution.extension.navigation.min.js') !!}"></script>
<script type="text/javascript" src="{!! asset('assets/plugins/revolution/revolution/js/extensions/revolution.extension.parallax.min.js') !!}"></script>
<script type="text/javascript" src="{!! asset('assets/plugins/revolution/revolution/js/extensions/revolution.extension.slideanims.min.js') !!}"></script>
<script type="text/javascript" src="{!! asset('assets/plugins/revolution/revolution/js/extensions/revolution.extension.video.min.js') !!}"></script>
<!-- REVOLUTION SLIDER FUNCTION  ===== -->

@stack('page_scripts')
<script type="text/javascript">
    var tpj = jQuery;
    var revapi1014;
	
    tpj(document).ready(function() {
        if (tpj("#rev_slider_1014_1").revolution == undefined) {
            revslider_showDoubleJqueryError("#rev_slider_1014_1");
        } else {
            revapi1014 = tpj("#rev_slider_1014_1").show().revolution({
                sliderType: "standard",
                jsFileLocation: "revolution/js/",
                sliderLayout: "fullwidth",
                dottedOverlay: "none",
                delay: 9000,
                navigation: {
                    keyboardNavigation: "off",
                    keyboard_direction: "horizontal",
                    mouseScrollNavigation: "off",
                    mouseScrollReverse: "default",
                    onHoverStop: "off",
                    touch: {
                        touchenabled: "on",
                        swipe_threshold: 75,
                        swipe_min_touches: 1,
                        swipe_direction: "horizontal",
                        drag_block_vertical: false
                    },
                    arrows: {
                        style: "hermes",
                        enable: true,
                        hide_onmobile: false,
                        hide_onleave: false,
                        tmp: '',
                        left: {
                            h_align: "left",
                            v_align: "center",
                            h_offset: 0,
                            v_offset: 0
                        },
                        right: {
                            h_align: "right",
                            v_align: "center",
                            h_offset: 0,
                            v_offset: 0
                        }
                    }
                },
                viewPort: {
                    enable: true,
                    outof: "pause",
                    visible_area: "80%",
                    presize: false
                },
                responsiveLevels: [1240, 1024, 778, 480],
                visibilityLevels: [1240, 1024, 778, 480],
                gridwidth: [1240, 1240, 1240, 800],
                gridheight: [700, 700, 700, 700],
                lazyType: "none",
                parallax: {
                    type: "mouse",
                    origo: "slidercenter",
                    speed: 2000,
                    levels: [2, 3, 4, 5, 6, 7, 12, 16, 10, 50, 47, 48, 49, 50, 51, 55],
                    type: "mouse",
                },
                shadow: 0,
                spinner: "off",
                stopLoop: "off",
                stopAfterLoops: -1,
                stopAtSlide: -1,
                shuffle: "off",
                autoHeight: "off",
                hideThumbsOnMobile: "off",
                hideSliderAtLimit: 0,
                hideCaptionAtLimit: 0,
                hideAllCaptionAtLilmit: 0,
                debugMode: false,
                fallbacks: {
                    simplifyAll: "off",
                    nextSlideOnWindowFocus: "off",
                    disableFocusListener: false,
                }
            });
        }
    }); /*ready*/
</script>
