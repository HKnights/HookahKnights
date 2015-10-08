<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Hookah Knights </title>
	<meta name="description" content="Wiredwiki App">
	<!-- Latest compiled and minified CSS -->
	 <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
</head>
<title>Shopping Cart</title>
		<meta name="	" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="/css/custom.css"/>		
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<script type="text/javascript">
function storeUserDetails(userName,userId,userEmail){
	$.ajax({
        url: 'http://localhost:8888/hookahknights?action1=USER_LOGIN',
        type: 'GET',
        data: { name: userName, user_id : userId,email:userEmail} ,
        contentType: 'application/json; charset=utf-8',
        success: function (response) {
            //your success code
        },
        error: function () {
            //your error code
        }
    }); 
}
function addToOrder(){
	document.mainForm.action1.value = "ORDERS_PAGE_ACTION";
	document.mainForm.submit();
}
function MyCtrl($scope, $timeout) {
    $scope.frameName = 'login';
    $scope.frameUrl = '/fblogin.html';
    
    // The timeout is here to be sure that the DOM is fully loaded.
    // This is a dirty-as-hell example, please use a directive in a real application.
    $timeout(function () { console.log(window.frames.foo); }, 1000);
}
</script>
	<style>
	body{
		padding-top: 40px;
	}
	h1,h2,h3{
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
<form action="hookahknights" method="POST" name="mainForm" >
<input type="hidden" name="action1" value="" />
<input type="hidden" name="selected_item" value="" />
<input type="hidden" name="prod_1" id="prod_id_1" value="orderId_1" />
<input type="hidden" name="prod_2" id="prod_id_2" value="orderId_2" />
<input type="hidden" name="prod_3" id="prod_id_3" value="orderId_3" />
  <!-- Navbar -->
  	<nav class="navbar navbar-inverse navbar-fixed-top" id="my-navbar">
  		<div class="container">
  			<div class="navbar-header">
  				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
  					<span class="icon-bar"></span>
  					<span class="icon-bar"></span>
  					<span class="icon-bar"></span>
  					<span class="icon-bar"></span>
  					<span class="icon-bar"></span>
  				</button>
  				<a href="" class="navbar-brand">HookahKnights</a>
  			</div><!-- Navbar Header-->
  			<div class="collapse navbar-collapse" id="navbar-collapse">
  			<%@include file="/common_header.jsp" %>
  				<ul class="nav navbar-nav">
  					<li><a href="#home">Home</a> 
  					<li><a href="#gallery">Gallery</a> 
  					<li><a href="#faq">Faq</a> 
  					<li><a href="#contact">ContactUs</a> 
  				</ul>
  			</div>
			</div><!-- End Container-->
  	</nav><!-- End navbar -->

		
		<div class="container text-center" style="margin-top: 115px;">

			<div class="col-md-5 col-sm-12">
				<div class="bigcart"></div>
				<h1>Your shopping cart</h1>
				<p>
					This is a free and <b><a href="http://tutorialzine.com/2014/04/responsive-shopping-cart-layout-twitter-bootstrap-3/" title="Read the article!">responsive shopping cart layout, made by Tutorialzine</a></b>. It looks nice on both desktop and mobile browsers. Try it by resizing your window (or opening it on your smartphone and pc).
				</p>
			</div>
			
			<div class="col-md-7 col-sm-12 text-left">
				<ul>
					<li class="row list-inline columnCaptions">
						<span>QTY</span>
						<span>ITEM</span>
						<span>Price</span>
					</li>
					<li class="row">
						<span class="quantity">1</span>
						<span class="itemName">Birthday Cake</span>
						<span class="popbtn"><a class="arrow"></a></span>
						<span class="price">$49.95</span>
					</li>
					<li class="row">
						<span class="quantity">50</span>
						<span class="itemName">Party Cups</span>
						<span class="popbtn"><a class="arrow"></a></span>
						<span class="price">$5.00</span>
					</li>
					<li class="row">
						<span class="quantity">20</span>
						<span class="itemName">Beer kegs</span>
						<span class="popbtn"><a class="arrow"></a></span>
						<span class="price">$919.99</span>				
					</li>
					<li class="row">
						<span class="quantity">18</span>
						<span class="itemName">Pound of beef</span>
						<span class="popbtn"><a class="arrow"></a></span>
						<span class="price">$269.45</span>
					</li>
					<li class="row">
						<span class="quantity">1</span>
						<span class="itemName">Bullet-proof vest</span>
						<span class="popbtn"  data-parent="#asd" data-toggle="collapse" data-target="#demo"><a class="arrow"></a></span>
						<span class="price">$450.00</span>				
					</li>
					<li class="row totals">
						<span class="itemName">Total:</span>
						<span class="price">$1694.43</span>
						<span class="order"> <a class="text-center">ORDER</a></span>
					</li>
				</ul>
			</div>

		</div>

		<!-- The popover content -->

		<div id="popover" style="display: none">
			<a href="#"><span class="glyphicon glyphicon-pencil"></span></a>
			<a href="#"><span class="glyphicon glyphicon-remove"></span></a>
		</div>
		
		<!-- JavaScript includes -->

		<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script> 
		<script src="/js/bootstrap.min.js"></script>
		<script src="/js/customjs.js"></script>

				<div id="DemoModal2" class="modal fade"> <!-- class modal and fade -->
		            <div class="modal-body"> <!-- modal body -->
		              <%@include file="/index.jsp" %>
		            </div>
	  			</div>
          </div>
        </div><!-- End the row -->
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
      </div><!-- end Container-->
      
    </footer>
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>	
</html>
