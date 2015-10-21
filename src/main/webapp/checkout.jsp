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
function removeItem(itemToRemoveId){
	document.mainForm.action1.value = "ITEM_REMOVE";
	document.mainForm.itemToRemove.value=itemToRemoveId;
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
function populateDetails(){
	var countItem=0;
	var cartJson=jQuery.parseJSON('<%=request.getAttribute("cart_json")%>');
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
				<h1>Your shopping cart</h1>
				          <div class="col-lg-8">
              <div class="form-group">
                <label for="user-name" class="col-lg-2 control-label">Name</label>
                <div class="col-lg-10">
                  <input type="text" class="form-control" id="user-name" placeholder="Enter you name">
                </div>
              </div><!-- End form group -->
              <div class="form-group">
                <label for="user-email" class="col-lg-2 control-label">Email</label>
                <div class="col-lg-10">
                  <input type="text" class="form-control" id="user-email" placeholder="Enter you Email Address">
                </div>
              </div><!-- End form group -->
              <div class="form-group">
                <label for="user-url" class="col-lg-2 control-label">Your Website</label>
                <div class="col-lg-10">
                  <input type="text" class="form-control" id="user-email" placeholder="If you have Any.">
                </div>
              </div><!-- End form group -->
              <div class="form-group">
                <label for="user-message" class="col-lg-2 control-label">Any Message</label>
                <div class="col-lg-10">
                  <textarea name="user-message" id="user-message" class="form-control" 
                  cols="20" rows="10" placeholder="Enter your Message"></textarea>
                </div>
              </div><!-- End form group -->
              <div class="form-group">
                <div class="col-lg-10 col-lg-offset-2">
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
              </div>
			</div>

			<div class="col-md-7 col-sm-12 text-left">
				<ul id="cart_div_list">
					<li class="row list-inline columnCaptions"><span>Item Number</span> <span>ITEM</span>
						<span>Price</span></li>
				</ul>
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
			
		</div>
		<!-- end Container-->

	</footer>
	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>
