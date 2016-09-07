<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Hookah Knights</title>
<meta name="description" content="Wiredwiki App">
<%@include file="/progree.jsp" %>
<!-- Latest compiled and minified CSS -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- Optional theme -->
</head>
<title>User Account</title>
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
	</style>
	<%String email=SessionManager.getUser(request)!=null?SessionManager.getUser(request).m_email:"";%>
<script type="text/javascript">
$(document).ready(function() {
    $('#user_name_disp').text('<%=SessionManager.getUser(request)!=null?SessionManager.getUser(request).m_name:""%>');
    $('#user_email_disp').text('<%=email%>');
    <%if(SessionManager.getUser(request) !=null && SessionManager.getUser(request).m_profilePicUrl!=null && !("").equals(SessionManager.getUser(request).m_profilePicUrl)){%>
    $('#userpic').attr({'src':'<%=SessionManager.getUser(request)!=null?SessionManager.getUser(request).m_profilePicUrl:""%>'});
    $('#userpic').attr({'style':'height: 141px;'});
    <%}%>
});
$(function(){
	startFromHalf();
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
function toggleItems(itemsDivId){
	$('#div_toggle'+ itemsDivId).toggle(400);
}
function populateDetails(){
	var countItem=0;
	var cartJson=jQuery.parseJSON('<%=request.getAttribute("order_details")%>');
	if(Object.keys(cartJson).length==0){
		$('.col-md-5').html('<img src="empty-cart.png"/>');
		$('.col-md-7').attr({'style':'display:none;'});
		$('#submit_page').toggle();
		$('#continue_shopping').toggle();
		$('body').attr({'style':'background-color: white;'});
	}else{
		for ( var cartItem in cartJson) {
			var orders=cartJson[cartItem];
			var orderC=0;
			for (var orderCount in orders) {
				orderC++;
				var itemList = [];
				var order=orders[orderCount];
				countItem=0;
				var itemsDiv= $('<div id=cart_div_list'+orderC+'">');
				//itemsDiv.attr({'style':'display:none'});
				for (var itemCount in order.items) {
					var item=order.items[itemCount].hookahData;
					itemsDiv.append('<div class="row" id='+item.prodId+'><span class="quantity">'
										+ ++countItem
										+ '</span><span class="itemName">'
										+ item.prodSize+' '+item.prodName
										+ '</span><span class="popbtn"><span id='
										+ cartItem
										+ ' onclick="removeItem('
										+ cartItem
										+ ')" style="margin-top: -30px;margin-left: 34px;" class=""></span></span><span class="price">'
										+ item.price +
										'</span><div style="float: right;margin-top: 30px;margin-right: -82px;" class="arrow"><div id="popover'+countItem+'" style="display: none"><table style="font-weight: bolder;"><tr><td>Coal</td><td>'
										+item.coal+
										'</td></tr><tr><td>Flavour 1</td><td>'
										+item.flavourFirst+
										'</td></tr> <tr><td>Base</td><td>'
										+item.base1+
										'</td></tr> <tr><td>Security</td><td>'
										+item.security+
										'</td>/tr></table></div></div></li>');
					
				}
		    //itemsDiv.append('</div>');
		    var newDiv=$('<div class="row" style="background-color: rgba(13, 43, 68, 0.24);" id="div_'+orderC+'" onclick="toggleItems('+orderC+')">');
		    newDiv.append('<div style="margin-top: 15px;">');
		    var idDiv=$('<span>');
		    idDiv.append(countItem);
		    var nameDiv=$('<span>123');
		    nameDiv.append(countItem);
		    var dateDiv=$('<span>123');
		    var timeDate='generation_time'+orderC;
		    dateDiv.append(orders[timeDate]);
		    newDiv.append(idDiv).append(nameDiv).append(dateDiv);
		    var newDivTo=$('<div id="div_toggle'+orderC+'"style="display:none;">');
		    newDivTo.append(itemsDiv.html());
		    newDiv.append(newDivTo);
			$('#previous_orders').append(newDiv);//.append(itemsDiv.html()).append('</div>');
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
.popbtn{
    margin-right: 25px;
    margin-top: -21px;
    height: 72px;
    }
    .row{
    margin-left: 16px;
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
           .btn-social {
            color: white;
            opacity: 0.8;
        }

            .btn-social:hover {
                color: white;
                opacity: 1;
                text-decoration: none;
            }

        .btn-facebook {
            background-color: #3b5998;
        }

        .btn-twitter {
            background-color: #00aced;
        }

        .btn-linkedin {
            background-color: #0e76a8;
        }

        .btn-google {
            background-color: #c32f10;
        }
</style>
<body data-spy="scroll" data-target="#my-navbar">
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


		 <div class="container">
        <section style="padding-bottom: 50px; padding-top: 50px;">
            <div class="">
                <div class="col-md-4">
                    <img id="userpic" src="assets/img/250x250.png" class="img-rounded img-responsive" />
                    <br />
                    <br />
                    <label>Registered Username</label>
                    <p id="user_name_disp">Registered Username</p>
                    <label>Registered Email</label>
                    <%if(email!=null && !("").equals(email)){ %>
                    <p id="user_email_disp">Registered Username</p>
                    <%}else{ %>
                       <input type="text" class="form-control" placeholder="jnondeao@gmail.com">
                    <%} %>
                    <br>
                    <br /><br/>
                </div>
                <div class="col-md-8">
                    <div class="alert alert-info">
                        <h2>User Bio : </h2>
                        <h4>Bootstrap user profile template </h4>
                        <p>
                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid.
                             3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. 
                        </p>
                    </div>                    
                </div>
                <div class="col-md-7 col-sm-12 text-left">
                <div id="previous_orders">
				<ul id="">
				</ul>
				</div>
			</div>
            </div>
            <!-- ROW END -->


        </section>
        <!-- SECTION END -->
    </div>
    <!-- CONATINER END -->

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
