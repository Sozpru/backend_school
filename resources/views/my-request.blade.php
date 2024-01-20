<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>School Finder</title>

        <!-- Favicons -->
        <link href="{{ asset('assets/img/favicon.png') }}" rel="icon">
        <link href="{{ asset('assets/img/apple-touch-icon.png') }}" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="{{ asset('assets/css/font.css') }}" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="{{ asset('assets/vendor/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">
        <link href="{{ asset('assets/vendor/bootstrap-icons/bootstrap-icons.css') }}" rel="stylesheet">
        <link href="{{ asset('assets/vendor/aos/aos.css') }}" rel="stylesheet">
        <link href="{{ asset('assets/vendor/remixicon/remixicon.css') }}" rel="stylesheet">
        <link href="{{ asset('assets/vendor/swiper/swiper-bundle.min.css') }}" rel="stylesheet">
        <link href="{{ asset('assets/vendor/glightbox/css/glightbox.min.css') }}" rel="stylesheet">
        <link href="{{ asset('swiper/swiper.min.css') }}" rel="stylesheet">


        <!-- Template Main CSS File -->
        <link href="{{ asset('assets/css/style.css') }}" rel="stylesheet">
        <meta name="csrf-token" content="{{ csrf_token() }}" />

    </head>

    <body class="bg-blue">
        <div class="loader"></div>
        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top container-fluid text-white mt-3">
            <div class="d-flex align-items-center justify-content-between container">
                <a href="{{ url('/') }}"><span class="menu" onclick=""><i class="bi bi-chevron-left h1 text-white"></i></span></a>
                <h2>My Request</h2>
                <a class="nav-link" href="{{ url('Notification') }}"><i class="bi bi-bell-fill text-white h2"></i></a>
            </div>
        </header><!-- End Header -->

        <section> </section>



        <!-- ======= list Section ======= -->
        <section id="counts" class="counts bg-white top-rounded">
            <div class="container">
                <div class="row gy-4">
                    @if(count($getdata) >= 1)
                    @foreach($getdata as $request)
                    <?php
                    $string = (strlen($request->username) > 13) ? substr($request->username, 0, 10) . '...' : $request->username;
                    ?>
                    <div class="col-lg-4 col-md-4">
                        <!--<a href="#" data-toggle="modal" data-target="#StudentDetailModal">-->
                        <div class="count-box tutor-img">
                            <img src="{{ (isset($request)) ? ((empty($request->image)) ? asset('assets/img/avatar.png') : asset($request->image) ) : asset('assets/img/avatar.png') }}" class="rounded shadow-sm">
                            <div>
                                <h4 class="text-secondary">{{ $string  }}</h4>
                                <?php
                                $myString = $request->sname;
                                $subject = str_replace(",", " | ", $myString);
                                ?>
                                <li class="d-inline text-secondary font-weight-light">{{ $subject }}</li><br>
                                <li class="d-inline text-secondary font-weight-light">{{ $request->mobile_no }}</li><br>
                                <li class="d-inline text-secondary font-weight-light">{{ $request->location }}</li>
                            </div>
                        </div>
                        <!--</a>-->
                    </div>
                    @endforeach
                    @else
                    <div class="col-lg-12 col-md-12">
                        <!--<a href="#" data-toggle="modal" data-target="#StudentDetailModal">-->
                        <center>
                            <img src="{{ asset('assets/img/no-data.png') }}" class="rounded shadow-sm">
                        </center>
                        <!--</a>-->
                    </div>
                    @endif
                </div>
            </div>
        </section><!-- End Counts Section -->


        <!-- student detail modal -->
        <div class="modal fade" id="StudentDetailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content top-50 shadow border-0">
                    <div class="modal-header top-border border-bottom-0">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="close_model();">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body mb-5">
                        <div class="d-flex align-items-center tutor-img" id="get_tutor_data">

                        </div>
                    </div>
                </div>
            </div>
        </div>


    </main>
    <!-- ======= Footer ======= -->
    <footer id="footer" class="footer">
        <div class="container">
            <div class="copyright">
                &copy; Copyright <strong><span>2023</span></strong>. All Rights Reserved
            </div>
            
        </div>
    </footer>
    <!-- End Footer -->
    <script src="{{ asset('swiper/swiper.min.js') }}"></script>

    <script src="{{ asset('assets/js/jquery.min.js') }}"></script>
<!-- <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a> -->
    <link href="{{ asset('assets/css/stackpath.css') }}" rel="stylesheet">
    <script src="{{ asset('assets/js/stackpath.js') }}"></script>

    <!-- Vendor JS Files -->
    <script src="{{ asset('assets/vendor/bootstrap/js/bootstrap.bundle.js') }}"></script>
    <!-- Template Main JS File -->
    <script src="{{ asset('assets/js/main.js') }}"></script>
    <script type="text/javascript">
                            $('#StudentDetailModal').on('shown.bs.modal', function () {
                                $('#StudentDetailModal').trigger('focus')
                            })
    </script>
    <script>
        $(window).on('load', function () {
            $('.loader').fadeOut();
        });
    </script>
    <!-- Bootstrap core JavaScript -->
    <script src="{{ asset('assets/vendor/jquery/jquery.min.js') }}"></script>

</body>

</html>
