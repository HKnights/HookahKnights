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
<title>Shopping Cart</title>
<meta name="	"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/custom.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script  src="/js/codejquery_min.js"></script>

	
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<style type="text/css"> 
		.popover-content { border: solid 1px grey;}
		
		/* Absolute Center Spinner */
.loading {
  position: fixed;
  z-index: 999;
  height: 2em;
  width: 2em;
  overflow: show;
  margin: auto;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
}

/* Transparent Overlay */
.loading:before {
  content: '';
  display: block;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0,0,0,0.3);
}

/* :not(:required) hides these rules from IE9 and below */
.loading:not(:required) {
  /* hide "loading..." text */
  font: 0/0 a;
  color: transparent;
  text-shadow: none;
  background-color: transparent;
  border: 0;
}

.loading:not(:required):after {
  content: '';
  display: block;
  font-size: 10px;
  width: 1em;
  height: 1em;
  margin-top: -0.5em;
  -webkit-animation: spinner 1500ms infinite linear;
  -moz-animation: spinner 1500ms infinite linear;
  -ms-animation: spinner 1500ms infinite linear;
  -o-animation: spinner 1500ms infinite linear;
  animation: spinner 1500ms infinite linear;
  border-radius: 0.5em;
  -webkit-box-shadow: rgba(0, 0, 0, 0.75) 1.5em 0 0 0, rgba(0, 0, 0, 0.75) 1.1em 1.1em 0 0, rgba(0, 0, 0, 0.75) 0 1.5em 0 0, rgba(0, 0, 0, 0.75) -1.1em 1.1em 0 0, rgba(0, 0, 0, 0.5) -1.5em 0 0 0, rgba(0, 0, 0, 0.5) -1.1em -1.1em 0 0, rgba(0, 0, 0, 0.75) 0 -1.5em 0 0, rgba(0, 0, 0, 0.75) 1.1em -1.1em 0 0;
  box-shadow: rgba(0, 0, 0, 0.75) 1.5em 0 0 0, rgba(0, 0, 0, 0.75) 1.1em 1.1em 0 0, rgba(0, 0, 0, 0.75) 0 1.5em 0 0, rgba(0, 0, 0, 0.75) -1.1em 1.1em 0 0, rgba(0, 0, 0, 0.75) -1.5em 0 0 0, rgba(0, 0, 0, 0.75) -1.1em -1.1em 0 0, rgba(0, 0, 0, 0.75) 0 -1.5em 0 0, rgba(0, 0, 0, 0.75) 1.1em -1.1em 0 0;
}

/* Animation */

@-webkit-keyframes spinner {
  0% {
    -webkit-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}
@-moz-keyframes spinner {
  0% {
    -webkit-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}
@-o-keyframes spinner {
  0% {
    -webkit-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}
@keyframes spinner {
  0% {
    -webkit-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}
		
	</style>
<script type="text/javascript">
$(function(){
	 //startFromHalf();
	});
function submitPage(){
	document.mainForm.action1.value = "CHECKOUT_ACTION";
	document.mainForm.submit();
}
function continueShopping(){
	document.mainForm.action1.value = "ORDERS_PAGE_ACTION";
	document.mainForm.submit();
}
function removeItem(itemToRemoveId){
	document.mainForm.action1.value = "ITEM_REMOVE";
	document.mainForm.itemToRemove.value=itemToRemoveId;
	document.mainForm.request_from.value="shopping_cart";
	document.mainForm.submit();
}
function storeUserDetails(userName,userId,userEmail){
	$.ajax({
        url: '/hookahknights?action1=USER_LOGIN',
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
$(function(){
	populateDetails();
});
$( document ).ready(function() {
   $('.loading').attr({'style':'display:none;'});
   $('#cart_display_div').attr({'style':'block;'});
});
function populateDetails(){
	var countItem=0;
	var cartJson=jQuery.parseJSON('<%=request.getAttribute("cart_json")%>');
	if(Object.keys(cartJson).length==0){
		$('.col-md-5').html('<img src="empty-cart.png"/>');
		$('.col-md-7').attr({'style':'display:none;'});
		$('#submit_page').attr({'style':'display:none;'});
		$('#continue_shopping').attr({'style':'display:block;'});
		$('body').attr({'style':'background-color: white;'});
	}else{
		for ( var cartItem in cartJson) {
			var itemDetails = cartJson[cartItem].split('_');
			for (var i = 0; i < itemDetails[0]; i++) {
				$('ul[id=cart_div_list]')
						.append(
								'<li class="row" id='+cartItem+'><span class="quantity">'
										+ ++countItem
										+ '</span><span class="itemName">'
										+ itemDetails[1]
										+ ' Hookah</span><span class="popbtn"><span id='
										+ cartItem
										+ ' onclick="removeItem('
										+ cartItem
										+ ')" style="margin-top: -30px;margin-left: 34px;" class="glyphicon glyphicon-remove"></span></span><span class="price">'
										+ itemDetails[2]/itemDetails[0] +
										'</span><div style="float: right;margin-top: 30px;margin-right: -82px;" class="arrow"><div id="popover'+countItem+'" style="display: none"><table style="font-weight: bolder;"><tr><td>Coal</td><td>'
										+itemDetails[3]+
										'</td></tr><tr><td>Flavour 1</td><td>'
										+itemDetails[4]+
										'</td></tr> <tr><td>Flavour 2</td><td>'
										+itemDetails[5]+
										'</td></tr> <tr><td>Liquid Base</td><td>'
										+itemDetails[6]+
										'</td></tr> <tr><td>Security</td><td>'
										+itemDetails[7]+
										'</td>/tr></table></div></div></li>');
			}
		}
		}
	$('.col-md-5').toggle();
	}


	function addToOrder() {
		document.mainForm.action1.value = "ORDERS_PAGE_ACTION";
		document.mainForm.submit();
	}
	function MyCtrl($scope, $timeout) {
		$scope.frameName = 'login';
		$scope.frameUrl = '/fblogin.html';

		// The timeout is here to be sure that the DOM is fully loaded.
		// This is a dirty-as-hell example, please use a directive in a real application.
		$timeout(function() {
			console.log(window.frames.foo);
		}, 1000);
	}
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
<body  data-spy="scroll" data-target="#my-navbar">
<div class="loading">Loading&#8230;</div>
<div id="cart_display_div" style="display: none;">
	<form action="hookahknights" method="POST" name="mainForm">
	<input type="hidden" name="from" value="${pageContext.request.requestURI}">
		<input type="hidden" name="action1" value="" /> <input type="hidden"
			name="itemToRemove" value="" /> <input type="hidden"
			name="selected_item" value="" /> <input type="hidden" name="prod_1"
			id="prod_id_1" value="orderId_1" /> <input type="hidden"
			name="prod_2" id="prod_id_2" value="orderId_2" /> <input
			type="hidden" name="prod_3" id="prod_id_3" value="orderId_3" />
			 <input type="hidden"
			name="request_from" value="" /> 
		<!-- Navbar -->
		<nav class="navbar-inverse navbar-fixed-top" id="my-navbar">
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

			<div class="col-md-5 col-sm-12" style="display:none;">
				<div class="bigcart"></div>
				<h1>Your shopping cart</h1>
				<p>
					This is a free and <b><a
						href="http://tutorialzine.com/2014/04/responsive-shopping-cart-layout-twitter-bootstrap-3/"
						title="Read the article!">responsive shopping cart layout,
							made by Tutorialzine</a></b>. It looks nice on both desktop and mobile
					browsers. Try it by resizing your window (or opening it on your
					smartphone and pc).
				</p>
			</div>

			<div class="col-md-7 col-sm-12 text-left">
				<ul id="cart_div_list">
					<li class="row list-inline columnCaptions"><span>QTY</span> <span>ITEM</span>
						<span>Price</span></li>
				</ul>
			</div>
			<div class="usageType" id="submit_page" style="float:right;margin-right: 14px;">
				<button onclick="submitPage()" class="btn btn-lg btn-primary btn-warning navbar-btn navbar-right">Proceed To Checkout</button>
			</div>
			<div class="usageType" id="continue_shopping" style="float:right;margin-right: 182px;margin-top: 100px;display:none;" >
				<button onclick="continueShopping()" class="btn btn-lg btn-primary btn-warning navbar-btn navbar-right">Continue Shopping</button>
			</div>

		</div>

		<!-- The popover content -->



		<!-- JavaScript includes -->

		<script src="/js/customjs.js?v=1234121212"></script>

		<div id="DemoModal2" class="modal fade">
			<!-- class modal and fade -->
			<div class="modal-body">
				<!-- modal body -->
				<%@include file="/index.jsp"%>
			</div>
		</div>
		</form>
		</div>
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
		</div>
</body>
</html>
