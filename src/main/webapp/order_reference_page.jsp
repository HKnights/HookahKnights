aa
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Hookah Knights</title>
<meta name="description" content="Wiredwiki App">
<!-- Latest compiled and minified CSS -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- Optional theme -->
</head>
<title>Orders Page</title>
<meta name="	"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/custom.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
	<style type="text/css">   
		.popover-content { border: solid 1px grey;}
	</style>
<script type="text/javascript">

</script>
<style>
body {
	padding-top: 40px;
}

h1, h2, h3 {
	margin-top: 7px !important;
	margin-bottom: 3px !important;
}

img {
	max-width: 100%;
	width: auto\9;
	/* height: auto; */
	/* vertical-align: middle; */
	border: 0;
	-ms-interpolation-mode: bicubic;
}
</style>
<body data-spy="scroll" data-target="#my-navbar">
	<form action="hookahknights" method="POST" name="mainForm">
		<input type="hidden" name="action1" value="" /> <input type="hidden"
			name="itemToRemove" value="" /> <input type="hidden"
			name="selected_item" value="" /> <input type="hidden" name="prod_1"
			id="prod_id_1" value="orderId_1" /> <input type="hidden"
			name="prod_2" id="prod_id_2" value="orderId_2" /> <input
			type="hidden" name="prod_3" id="prod_id_3" value="orderId_3" />
		<!-- Navbar -->
		<nav class="navbar navbar-inverse navbar-fixed-top" id="my-navbar">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#navbar-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a href="" class="navbar-brand">HookahKnights</a>
				</div>
				<!-- Navbar Header-->
				<div class="collapse navbar-collapse" id="navbar-collapse">
					<%@include file="/common_header.jsp"%>
					<ul class="nav navbar-nav">
						<li><a href="#home">Home</a>
						<li><a href="#gallery">Gallery</a>
						<li><a href="#faq">Faq</a>
						<li><a href="#contact">ContactUs</a>
					</ul>
				</div>
			</div>
			<!-- End Container-->
		</nav>
		<!-- End navbar -->


		<div class="container text-center" style="margin-top: 115px;">

			<div class="col-md-5 col-sm-12">
				<div class="bigcart"></div>
				<h1>HKN123ABC</h1>
				<p>
					<b>Thanks for Ordering!</b>
					Your Order will reach you in Sometime.
					For any query, kindly Contact Us at :
					Phone No. : 9742850966.
				</p>
			</div>
			<div style="float:right;margin-right: 14px;">
				<button onclick="submitPage()" class="btn btn-lg btn-primary btn-warning navbar-btn navbar-right">Shop More</button>
			</div>

		</div>

		<!-- The popover content -->



		<!-- JavaScript includes -->

		<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script src="/js/bootstrap.min.js"></script>
		<script src="/js/customjs.js?v=1234121212"></script>

		<div id="DemoModal2" class="modal fade">
			<!-- class modal and fade -->
			<div class="modal-body">
				<!-- modal body -->
				<%@include file="/index.jsp"%>
			</div>
		</div>
		</div>
		</div>
		<!-- End the row -->
		</section>
		</div>
	</form>
	<!-- Footer -->
	<footer>
		<hr>
		<div class="container text-center" style="margin-top: 115px;">
			<hr>
			<ul class="list-inline">
				<li><a href="http://www.twitter.com/wiredwiki">Twitter</a></li>
				<li><a href="http://www.facebook.com/askorama">Facebook</a></li>
				<li><a href="http://www.youtube.com/wiredwiki">YouTube</a></li>
			</ul>
			<p>&copy; Copyright @ 2014</p>
		</div>
		<!-- end Container-->

	</footer>
	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>
