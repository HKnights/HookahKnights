<!DOCTYPE html>
<%@page import="main.java.com.eos.cart.ShoppingCart"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="main.java.com.eos.product.Product"%>
<%@page import="java.util.List"%>
<%@page import="main.java.com.eos.accounts.Order"%>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Hookah Knights</title>
<meta name="description" content="Wiredwiki App">
<!-- Latest compiled and minified CSS -->
<!-- Latest compiled and minified CSS -->
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> -->

<!-- Optional theme -->

<link rel="stylesheet" type="text/css"
	href="/css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/sweetalert.css" />
<link rel="stylesheet" type="text/css" href="/css/sweetalert.min.css" />
<script src="/js/sweetalert-dev.js"></script>
<script src="/js/sweetalert-dev.js"></script>
<script src="/js/sweetalert-dev.js"></script>
<script src="/js/sweetalert.min.js"></script>

<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
		<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.js"></script>
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.min.js"></script>
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
 -->
</head>

<style>
.cover {
	height: 100%;
	width: 100%;
	position: absolute;
	z-index: 1;
}

.blur-in {
	-webkit-animation: blur 2s forwards;
	-moz-animation: blur 2s forwards;
	-o-animation: blur 2s forwards;
	animation: blur 2s forwards;
}

.blur-out {
	-webkit-animation: blur-out 1s forwards;
	-moz-animation: blur-out 1s forwards;
	-o-animation: blur-out 1s forwards;
	animation: blur-out 1s forwards;
}

@
-webkit-keyframes 
blur { 0% {
	-webkit-filter: blur(0px);
	-moz-filter: blur(0px);
	-o-filter: blur(0px);
	-ms-filter: blur(0px);
	filter: blur(0px);
}

100%
{
-webkit-filter








:




 




blur








(4
px






);
-moz-filter








:




 




blur








(4
px






);
-o-filter








:




 




blur








(4
px






);
-ms-filter








:




 




blur








(4
px






);
filter








:




 




blur








(4
px






);
}
}
@
-moz-keyframes 
blur { 0% {
	-webkit-filter: blur(0px);
	-moz-filter: blur(0px);
	-o-filter: blur(0px);
	-ms-filter: blur(0px);
	filter: blur(0px);
}

100%
{
-webkit-filter








:




 




blur








(4
px






);
-moz-filter








:




 




blur








(4
px






);
-o-filter








:




 




blur








(4
px






);
-ms-filter








:




 




blur








(4
px






);
filter








:




 




blur








(4
px






);
}
}
@
-o-keyframes 
blur { 0% {
	-webkit-filter: blur(0px);
	-moz-filter: blur(0px);
	-o-filter: blur(0px);
	-ms-filter: blur(0px);
	filter: blur(0px);
}

100%
{
-webkit-filter








:




 




blur








(4
px






);
-moz-filter








:




 




blur








(4
px






);
-o-filter








:




 




blur








(4
px






);
-ms-filter








:




 




blur








(4
px






);
filter








:




 




blur








(4
px






);
}
}
@
keyframes 
blur { 0% {
	-webkit-filter: blur(0px);
	-moz-filter: blur(0px);
	-o-filter: blur(0px);
	-ms-filter: blur(0px);
	filter: blur(0px);
}

100%
{
-webkit-filter








:




 




blur








(4
px






);
-moz-filter








:




 




blur








(4
px






);
-o-filter








:




 




blur








(4
px






);
-ms-filter








:




 




blur








(4
px






);
filter








:




 




blur








(4
px






);
}
}
@
-webkit-keyframes 
blur-out { 0% {
	-webkit-filter: blur(4px);
	-moz-filter: blur(4px);
	-o-filter: blur(4px);
	-ms-filter: blur(4px);
	filter: blur(4px);
}

100%
{
-webkit-filter








:




 




blur








(0
px






);
-moz-filter








:




 




blur








(0
px






);
-o-filter








:




 




blur








(0
px






);
-ms-filter








:




 




blur








(0
px






);
filter








:




 




blur








(0
px






);
}
}
@
-moz-keyframes 
blur-out { 0% {
	-webkit-filter: blur(4px);
	-moz-filter: blur(4px);
	-o-filter: blur(4px);
	-ms-filter: blur(4px);
	filter: blur(4px);
}

100%
{
-webkit-filter








:




 




blur








(0
px






);
-moz-filter








:




 




blur








(0
px






);
-o-filter








:




 




blur








(0
px






);
-ms-filter








:




 




blur








(0
px






);
filter








:




 




blur








(0
px






);
}
}
@
-o-keyframes 
blur-out { 0% {
	-webkit-filter: blur(4px);
	-moz-filter: blur(4px);
	-o-filter: blur(4px);
	-ms-filter: blur(4px);
	filter: blur(4px);
}

100%
{
-webkit-filter








:




 




blur








(0
px






);
-moz-filter








:




 




blur








(0
px






);
-o-filter








:




 




blur








(0
px






);
-ms-filter








:




 




blur








(0
px






);
filter








:




 




blur








(0
px






);
}
}
@
keyframes 
blur-out { 0% {
	-webkit-filter: blur(4px);
	-moz-filter: blur(4px);
	-o-filter: blur(4px);
	-ms-filter: blur(4px);
	filter: blur(4px);
}

100%
{
-webkit-filter








:




 




blur








(0
px






);
-moz-filter








:




 




blur








(0
px






);
-o-filter








:




 




blur








(0
px






);
-ms-filter








:




 




blur








(0
px






);
filter








:




 




blur








(0
px






);
}
}
.content {
	width: 650px;
	margin: 0 auto;
	padding-top: 100px;
}

span {
	color: dimgray;
}

.pop-up {
	position: absolute;
	/* 	margin: 5% auto;
	margin-top: -51px;
 	left: 0;
	right: 0;*/
	transform: translate(0%, 0%);
	z-index: 1;
}

.box {
	background-color: whitesmoke;
	position: relative;
	-webkit-box-shadow: 0px 4px 6px 0px rgba(0, 0, 0, 0.1);
	-moz-box-shadow: 0px 4px 6px 0px rgba(0, 0, 0, 0.1);
	box-shadow: 0px 4px 6px 0px rgba(0, 0, 0, 0.1);
}

.button {margin 0 auto;
	background-color: #FF8566;
	margin-bottom: 33px;
}

.button:hover {
	background-color: #7CCF29;
	-webkit-box-shadow: 0px 4px 6px 0px rgba(0, 0, 0, 0.1);
	-moz-box-shadow: 0px 4px 6px 0px rgba(0, 0, 0, 0.1);
	box-shadow: 0px 4px 6px 0px rgba(0, 0, 0, 0.1);
}

.close-button {
	transition: all 0.5s ease;
	position: absolute;
	background-color: #FF9980;
	padding: 1.5px 7px;
	left: 0;
	margin-left: -10px;
	margin-top: -14px;
	z-index: 10;
	border-radius: 50%;
	border: 2px solid #fff;
	color: white;
	-webkit-box-shadow: -4px -2px 6px 0px rgba(0, 0, 0, 0.1);
	-moz-box-shadow: -4px -2px 6px 0px rgba(0, 0, 0, 0.1);
	box-shadow: -3px 1px 6px 0px rgba(0, 0, 0, 0.1);
}

.close-button:hover {
	background-color: tomato;
	color: #fff;
}

h2 {
	font-size: large;
	margin-top: 5px !important;
	margin-bottom: -4px !important;
}

h1, h3 {
	margin-top: 5px !important;
	margin-bottom: -4px !important;
}

.col-sm-8 {
	background-color: rgba(238, 238, 238, 0.62);
	border-radius: 24px;
	width: 896px;
}

.hookahImg {
	width: 140px;
	border-radius: 110px;
	height: 146px;
}

.shopping-cart {
	display: inline-block;
	width: 24px;
	height: 24px;
	float: right;
	margin: 0 10px 0 0;
}

.cd-customization .add-to-cart {
	color: #ffffff;
	background-color: #46b29d;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

customization .add-to-cart {
	font-size: 1.2rem;
	font-weight: 600;
	text-transform: uppercase;
	line-height: 34px;
	border: none;
}

cart {
	height: 34px;
	border-radius: 3px;
	position: relative;
	overflow: hidden;
}

nav {
	border-radius: 4px;
	box-shadow: 0px 0px 2px #303030;
	color: #000000;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 15px;
	height: 40px;
	margin: 2px 10px;
}

ul>li {
	list-style: none;
}

ul>li a {
	color: #9c9696;;
	font-weight: bold;
	line-height: 40px;
	height: 40px;
	display: block;
	padding: 0px 10px;
}

nav ul li ul {
	background: #333333;
	border-radius: 4px;
	box-shadow: 0px 0px 2px #303030;
	display: none;
	position: relative;
	z-index: 100;
}

nav ul li ul li {
	float: none;
	line-height: 40px;
	width: 150px;
}
li table {
display: none;
}
.menu-trigger {
	display: none;
}
</style>
<%
	String[] inventorDetails = (Order.getInventory()).split("_");
	int smallHookahLeft = Integer.parseInt(inventorDetails[0]);
	int mediumHookahLeft = Integer.parseInt(inventorDetails[1]);
	int largeHookahLeft = Integer.parseInt(inventorDetails[2]);
%>
<%@include file="/progree.jsp"%>
<%List<List<Product>> prevOrders=(List<List<Product>>)request.getAttribute("prev_order"); 

if(!prevOrders.isEmpty()){%>
<nav>
	<button class="menu-trigger">
		<span class="burger"></span> <span class="burger"></span> <span
			class="burger"></span>
	</button>
<ul class="menu">	
<li class="dropdown-trigger"><a href="#" style="margin-top: 14px;">Go with your usuals<span class="caret"></span></a>
<%int itemCount=0;
int showCount=1;
for(List<Product> prevOrder:prevOrders) {
%>
			<ul>
				<li><a style="padding: 21px;" onclick="displayOrders(<%=showCount%>)">View Order <%=showCount%></a>
				<table style="    width: 1000px;" id="Order<%=showCount%>">
				<%for (Product prod:prevOrder) {%>
				<tr><td style="color: aliceblue;    padding-left: 21px;padding-top: 7px;"> <%=prod.getHookahData().getProdSize()%> <%=prod.getHookahData().getProdName()%></td>
				<td style="color: aliceblue;    padding-left: 21px;padding-top: 7px;">Flavour: <%=prod.getHookahData().getFlavourFirst()%></td>
				<td style="color: aliceblue;    padding-left: 21px;padding-top: 7px;">Base: <%=prod.getHookahData().getBase1()%></td>
				</tr>
				<%} %></table>

				<div><button id=<%=itemCount %> 	style=" color: #ffffff;    margin-left: 950px;
				width: 117px; background-color: #46b29d; height: 34px; border-radius: 4px;
				 position: relative; overflow: hidden; -webkit-font-smoothing: antialiased;
				  -moz-osx-font-smoothing: grayscale; font-weight: 900;     margin-bottom: 10px;
				  text-transform: uppercase; line-height: 30px; border: none;" onclick="expressChecout(<%=itemCount %>)" type="button">Checkout</button></div>
				
				</li>
			</ul><%
			itemCount++;
			showCount++;} %></li>

	</ul>
</nav>
<%} %>
<body data-spy="scroll" data-target="#my-navbar">
	<form action="hookahknights" method="POST" name="mainForm">
	<input type="hidden" name="express_checkout" value=""> 
		<input type="hidden" name="from"
			value="${pageContext.request.requestURI}"> <input
			type="hidden" name="action1" value="" /> <input type="hidden"
			name="selected_item" value="" /> <input type="hidden" name="prod_1"
			id="prod_id_1" value="orderId_1" /> <input type="hidden"
			name="prod_2" id="prod_id_2" value="orderId_2" /> <input
			type="hidden" name="prod_3" id="prod_id_3" value="orderId_3" />

		<div id="overlay" class="cover">
			<nav class="navbar navbar-inverse navbar-fixed-top" id="my-navbar">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#navbar-collapse">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>

						<a href="/hookahknights" class="navbar-brand">HookahKnights</a>


					</div>
					<!-- Navbar Header-->
					<div class="collapse navbar-collapse" id="navbar-collapse">
						<%@include file="/common_header.jsp"%>
						<ul class="nav navbar-nav">

							<li><a href="#hookahs">Hookahs</a></li>

							<li><a href="#contact">ContactUs</a>
						</ul>
					</div>
					<div>
						<div id="status"
							style="float: right; margin-top: -36px; margin-right: 176px; font-size: smaller; color: white;"></div>
						<span><img id="user_profile_pic" src="" height="25"
							width="25"
							style="display: none; border-radius: 10px; float: right; margin-top: -36px; margin-right: 138px;"></span>
					</div>
				</div>
				<!-- End Container-->
			</nav>
			<!-- End navbar -->
			<!-- jumbotron-->

			<div class="jumbotron" style="height: 140px; padding-top: 20px;">
				<div class="container text-center" style="margin-top: 15px;">
					<h1>
						<span>HOOKAH KNIGHTS</span>
					</h1>
					<p style="margin-top: 20px;">Your one and only Hookah Stop</p>
				</div>
				<!-- End container -->
			</div>
			<!-- End jumbotron-->

			<!-- Categories -->
			<div class="container" id="hookahs">
				<section>
					<div class="page-header" id="categories"
						style="margin-top: 7px; margin-bottom: 3px; padding-bottom: 0px;">
						<h2>
							Hookah Categories.
							<div style="height: 42px; float: right;">
								<button onclick="submitPage()"
									style="margin-top: -6px; margin-right: -2px;"
									class="usageType btn btn-lg btn-primary btn-warning navbar-btn navbar-right">Proceed
									To Checkout</button>
							</div>
						</h2>
					</div>
					<!-- End Page Header -->

					<table
						style="width: 100%; border: solid 1px rgba(128, 128, 128, 0.21); box-shadow: 1px 1px 1px 1px rgba(0, 0, 0, 0.28);">
						<tr
							style="height: 40px; background-color: rgba(128, 128, 128, 0.19);">
							<td style="text-align: center"><h
									style="font-weight:bold;margin-right: 122px;">Item</h></td>

							<td style="text-align: center"><h
									style="font-weight:bold;margin-right: 122px;">Type</h></td>

							<td style="text-align: center"><h
									style="font-weight:bold;margin-right: 122px;">Details</h></td>

							<td style="text-align: center"><h
									style="font-weight:bold;margin-right: 122px;">Price</h></td>

							<td style="text-align: center"><h style="font-weight:bold;">Delivery
								Details</h></td>

							<td style="text-align: center"><h style="font-weight:bold;"></h></td>
						</tr>

						<tr>
							<td style="width: 20%;">
								<div class="col-sm-4" style="width: 100%">

									<!-- items -->
									<div class="items">
										<!-- single item -->
										<div class="item" style="margin-top: 10px;">
											<img id="hookah_small_img" onmouseout="changeReset();"
												src="hookah_real.png" alt="item" class="hookahImg" />
										</div>
										<!--/ single item -->
										<!-- single item -->

										<!--/ items -->

									</div>
								</div>
							</td>
							<td style="width: 15%;"><span> <b>Small Sized
										Hookah (Glass and Steel)</b>
							</span></td>

							<td style="width: 20%;"><span style="font-size: small;">Very
									Awesome Smokey Flavour.Very Awesome Smokey Flavour.Very Awesome
									Smokey Flavour.</span></td>

							<td><span style="margin-left: 9px;">Rs. 500</span></td>

							<td>
								<p>
									<span style="font-weight: 700; color: Green;">Free</span></br> <span>Delivered
										in 1-2 hours.</span>
								</p>
							</td>
							<td>
								<%
									if (smallHookahLeft == 1) {
								%> <b style="color: red; font-weight: 400;">only <%=smallHookahLeft%>
									hookah left
							</b> <%
 	} else if (smallHookahLeft > 1) {
 %> <b style="color: green; font-weight: 200;">only <%=smallHookahLeft%>
									hookahs left
							</b> <%
 	}
 %>
								<button id="1"
									style="color: #ffffff; width: 117px; background-color: #46b29d; height: 34px; border-radius: 4px; position: relative; overflow: hidden; -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; font-weight: 900; text-transform: uppercase; line-height: 30px; border: none;"
									onclick="showSubProducts(1)" type="button">Customize
									your hookah</button>
							</td>

						</tr>
						<tr>
							<td style="padding-bottom: 15px;" colspan="6">
								<div class="row-page-header" id="large"
									style="padding-bottom: 0px; margin-left: 0px !important;">

								</div>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;">
								<div class="col-sm-4" style="width: 100%">

									<!-- items -->
									<div class="items">
										<!-- single item -->
										<div class="item" style="margin-top: 10px;">
											<img id="hookah_small_img" onmouseout="changeReset();"
												src="hookah_real2.png" alt="item" class="hookahImg" />
										</div>
										<!--/ single item -->
										<!-- single item -->

										<!--/ items -->

									</div>
								</div>
							</td>
							<td style="width: 15%;"><span> <b>Medium Sized
										Hookah (Glass and Steel)</b>
							</span></td>

							<td style="width: 20%;"><span style="font-size: small;">Very
									Awesome Smokey Flavour.Very Awesome Smokey Flavour.Very Awesome
									Smokey Flavour.</span></td>

							<td><span style="margin-left: 9px;">Rs. 600</span></td>

							<td>
								<p>
									<span style="font-weight: 700; color: Green;">Free</span></br> <span>Delivered
										in 1-2 hours.</span>
								</p>
							</td>
							<td>
								<%
									if (mediumHookahLeft == 1) {
								%> <b style="color: red; font-weight: 400;">only <%=mediumHookahLeft%>
									hookah left
							</b> <%
 	} else if (mediumHookahLeft > 1) {
 %> <b style="color: green; font-weight: 200;">only <%=mediumHookahLeft%>
									hookahs left
							</b> <%
 	}
 %>
								<button id="1"
									style="color: #ffffff; width: 117px; background-color: #46b29d; height: 34px; border-radius: 4px; position: relative; overflow: hidden; -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; font-weight: 900; text-transform: uppercase; line-height: 30px; border: none;"
									onclick="showSubProducts(2)" type="button">Customize
									your hookah</button>
							</td>

						</tr>
						<tr>
							<td style="padding-bottom: 15px;" colspan="6">
								<div class="row page-header" id="medium"
									style="padding-bottom: 0px; margin-left: 0px !important;">

								</div>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;">
								<div class="col-sm-4" style="width: 100%">

									<!-- items -->
									<div class="items">
										<!-- single item -->
										<div class="item" style="margin-top: 10px;">
											<img id="hookah_small_img" onmouseout="changeReset();"
												src="hookah_real3.png" alt="item" class="hookahImg" />
										</div>
										<!--/ single item -->
										<!-- single item -->

										<!--/ items -->

									</div>
								</div>
							</td>
							<td style="width: 15%;"><span> <b>Large Sized
										Hookah (Glass and Steel)</b>
							</span></td>

							<td style="width: 20%;"><span style="font-size: small;">Very
									Awesome Smokey Flavour.Very Awesome Smokey Flavour.Very Awesome
									Smokey Flavour.</span></td>

							<td><span style="margin-left: 9px;">Rs. 700</span></td>

							<td>
								<p>
									<span style="font-weight: 700; color: Green;">Free</span></br> <span>Delivered
										in 1-2 hours.</span>
								</p>
							</td>
							<td>
								<%
									if (largeHookahLeft == 1) {
								%> <b style="color: red; font-weight: 400;">only <%=largeHookahLeft%>
									hookah left
							</b> <%
 	} else if (largeHookahLeft > 1) {
 %> <b style="color: green; font-weight: 200;">only <%=largeHookahLeft%>
									hookahs left
							</b> <%
 	}
 %>
								<button id="1"
									style="color: #ffffff; width: 117px; background-color: #46b29d; height: 34px; border-radius: 4px; position: relative; overflow: hidden; -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; font-weight: 900; text-transform: uppercase; line-height: 30px; border: none;"
									onclick="showSubProducts(3)" type="button">Customize
									your hookah</button>
							</td>

						</tr>
						<tr>
							<td style="padding-bottom: 15px;" colspan="6">
								<div class="row-page-header" id="large"
									style="padding-bottom: 0px; margin-left: 0px !important;">

								</div>
							</td>
						</tr>
					</table>
					<hr>
				</section>
			</div>
			<!-- End Container -->

			<!-- Contact -->



			</section>
		</div>
		</div>
		<div id="DemoModal2" class="modal fade">
			<!-- class modal and fade -->
			<div class="modal-body">
				<!-- modal body -->
				<%@include file="/index.jsp"%>
			</div>
		</div>
		<div class="row pop-up" style="display: none;">
			<div class="box large-centered"
				style="height: 466px; width: 898px; margin-left: 195px; margin-top: 94px; border-radius: 24px; box-shadow: 1px 1px 9px 10px rgba(0, 0, 0, 0.28);">
				<a href="#" class="close-button">&#10006;</a>
				<div class="col-sm-8" style="display: none;" id="prod_id_1_div">
					<h3
						style="text-decoration: underline; margin-left: 25px; margin-top: 24px !important; margin-bottom: 3px; font-size: 19px;">Small
						Sized Hookah</h3>
					<div>
						<table style="height: 420px; margin-left: 25px;">
							<tr>
								<td style="width: 400px;"><h2 style="font-size: 16px;">Cost</h2></td>
								<td style="width: 400px;" id="cost_1">Rs 500</td>
							</tr>
							<tr>
								<td><h2 style="font-size: 16px; width: 400px;">Coal</h2></td>
								<td>3 Pieces</td>
							</tr>
							<tr>
								<td style="width: 400px;"><h2 style="font-size: 16px;">Choose
										Flavour</h2></td>
								<td>
									<div>
										<select name="select_flavour" id="select_flavour_id_1_1">
											<option value="Mint" selected>Mint</option>
											<option value="Pan">Pan</option>
											<option value="Apple">Apple</option>
											<option value="Grapes">Grapes</option>
											<option value="BubbleGum">BubbleGum</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td><h2 style="font-size: 16px; width: 400px;">Liquid
										Base</h2></td>
								<td>
									<div style="width: 400px;">
										<label class="radio-inline"><input type="radio"
											name="group1_1" value="Water" checked> Water</label>&nbsp; <label
											class="radio-inline"><input type="radio"
											name="group1_1" value="Milk"> Milk</label>&nbsp; <label
											class="radio-inline"><input type="radio"
											name="group1_1" value="Ice"> Ice</label>
									</div>
								</td>
							</tr>
							<tr>
								<td style="width: 400px;"><h2 style="font-size: 16px;">2
										in 1 Flavours</h2></td>
								<td>Not Available</td>
							</tr>
							<tr>
								<td style="width: 400px;"><h2 style="font-size: 16px;">Security</h2></td>
								<td>Rs 500</td>
						</table>
					</div>
					<div class="item" style="float: right; margin-top: -284px;">
						<img src="hookah_real.png" alt="item" class="hookahImg"
							style="margin-top: -52px;" />
						<h2>Hookah Small</h2>
						<%
							if (smallHookahLeft > 0) {
						%>
						<button id="1"
							style="color: #ffffff; width: 100%; margin-top: 106px; background-color: #46b29d; height: 34px; border-radius: 4px; position: relative; overflow: hidden; -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; font-weight: 900; text-transform: uppercase; line-height: 30px; border: none;"
							class="add-to-cart" type="button">Add to cart</button>
						<%
							} else {
						%>
						<button id="1"
							style="color: #ffffff; width: 100%; margin-top: 106px; background-color: #940332; height: 34px; border-radius: 4px; position: relative; overflow: hidden; -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; font-weight: 900; text-transform: uppercase; line-height: 30px; border: none;"
							class="add-to-cart" disabled="disabled" type="button">Out
							Of Stock</button>
						<%
							}
						%>
					</div>
				</div>
				<div class="col-sm-8" style="display: none;" id="prod_id_2_div">
					<h3
						style="text-decoration: underline; margin-left: 25px; margin-top: 24px !important; margin-bottom: 3px; font-size: 19px;">Medium
						Sized Hookah</h3>
					<div>
						<table style="height: 420px; margin-left: 25px;">
							<tr>
								<td style="width: 400px;"><h2 style="font-size: 16px;">Cost</h2></td>
								<td style="width: 400px;" id="cost_2">Rs 600</td>
							</tr>
							<tr>
								<td><h2 style="font-size: 16px; width: 400px;">Coal</h2></td>
								<td>3 Pieces</td>
							</tr>
							<tr>
								<td style="width: 400px;"><h2 style="font-size: 16px;">Choose
										Flavour 1</h2></td>
								<td>
									<div>
										<select name="select_flavour" id="select_flavour_id_2_1">
											<option value="Mint" selected>Mint</option>
											<option value="Pan">Pan</option>
											<option value="Apple">Apple</option>
											<option value="Grapes">Grapes</option>
											<option value="BubbleGum">BubbleGum</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td><h2 style="font-size: 16px; width: 400px;">Liquid
										Base</h2></td>
								<td>
									<div style="width: 400px;">
										<label class="radio-inline"><input type="radio"
											name="group2_1" value="Water" checked> Water</label>&nbsp; <label
											class="radio-inline"><input type="radio"
											name="group2_1" value="Milk"> Milk</label>&nbsp; <label
											class="radio-inline"><input type="radio"
											name="group2_1" value="Ice"> Ice</label>
									</div>
								</td>
							</tr>
							<tr>
								<td style="width: 400px;"><h2 style="font-size: 16px;">2
										in 1 Flavours</h2></td>
								<td>Not Available</td>
							</tr>
							<tr>
								<td style="width: 400px;"><h2 style="font-size: 16px;">Security</h2></td>
								<td>Rs 600</td>
						</table>
					</div>
					<div class="item" style="float: right; margin-top: -284px;">
						<img src="hookah_real2.png" alt="item" class="hookahImg"
							style="margin-top: -52px;" />
						<h2>Hookah Medium</h2>
						<%
							if (mediumHookahLeft > 0) {
						%>
						<button id="2"
							style="color: #ffffff; width: 100%; margin-top: 106px; background-color: #46b29d; height: 34px; border-radius: 4px; position: relative; overflow: hidden; -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; font-weight: 900; text-transform: uppercase; line-height: 30px; border: none;"
							class="add-to-cart" type="button">Add to cart</button>
						<%
							} else {
						%>
						<button id="2"
							style="color: #ffffff; width: 100%; margin-top: 106px; background-color: #940332; height: 34px; border-radius: 4px; position: relative; overflow: hidden; -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; font-weight: 900; text-transform: uppercase; line-height: 30px; border: none;"
							class="add-to-cart" disabled="disabled" type="button">Out
							Of Stock</button>
						<%
							}
						%>
					</div>
				</div>
				<div class="col-sm-8" style="display: none;" id="prod_id_3_div">
					<h3
						style="text-decoration: underline; margin-left: 25px; margin-top: 24px !important; margin-bottom: 3px; font-size: 19px;">Large
						Sized Hookah</h3>
					<div>
						<table style="height: 420px; margin-left: 25px;">
							<tr>
								<td style="width: 400px;"><h2 style="font-size: 16px;">Cost</h2></td>
								<td style="width: 400px;" id="cost_3">Rs 700</td>
							</tr>
							<tr>
								<td><h2 style="font-size: 16px; width: 400px;">Coal</h2></td>
								<td>3 Pieces</td>
							</tr>
							<tr>
								<td style="width: 400px;"><h2 style="font-size: 16px;">Choose
										Flavour</h2></td>
								<td>
									<div>
										<select name="select_flavour" id="select_flavour_id_3_1">
											<option value="Mint" selected>Mint</option>
											<option value="Pan">Pan</option>
											<option value="Apple">Apple</option>
											<option value="Grapes">Grapes</option>
											<option value="BubbleGum">BubbleGum</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td><h2 style="font-size: 16px; width: 400px;">Liquid
										Base</h2></td>
								<td>
									<div style="width: 400px;">
										<label class="radio-inline"><input type="radio"
											name="group3_1" value="Water" checked> Water</label>&nbsp; <label
											class="radio-inline"><input type="radio"
											name="group3_1" value="Milk"> Milk</label>&nbsp; <label
											class="radio-inline"><input type="radio"
											name="group3_1" value="Ice"> Ice</label>
									</div>
								</td>
							</tr>
							<tr>
								<td style="width: 400px;"><h2 style="font-size: 16px;">2
										in 1 Flavours</h2></td>
								<td>Not Available</td>
							</tr>
							<tr>
								<td style="width: 400px;"><h2 style="font-size: 16px;">Security</h2></td>
								<td>Rs 500</td>
						</table>
					</div>
					<div class="item" style="float: right; margin-top: -284px;">
						<img src="hookah_real3.png" alt="item" class="hookahImg"
							style="margin-top: -52px;" />
						<h2>Hookah Large</h2>
						<%
							if (largeHookahLeft > 0) {
						%>
						<button id="3"
							style="color: #ffffff; width: 100%; margin-top: 106px; background-color: #46b29d; height: 34px; border-radius: 4px; position: relative; overflow: hidden; -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; font-weight: 900; text-transform: uppercase; line-height: 30px; border: none;"
							class="add-to-cart" type="button">Add to cart</button>
						<%
							} else {
						%>
						<button id="3"
							style="color: #ffffff; width: 100%; margin-top: 106px; background-color: #940332; height: 34px; border-radius: 4px; position: relative; overflow: hidden; -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; font-weight: 900; text-transform: uppercase; line-height: 30px; border: none;"
							class="add-to-cart" disabled="disabled" type="button">Out
							Of Stock</button>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script src="/js/jquery-3.1.0.min.js"></script>
	<script src="/js/jquery-ui.js"></script>
	<!-- <script
		src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script> -->
	<script>
	function displayOrders(id){
		 $($('table[id=Order'+id+']')[0]).toggle();
	}
		$(function() {
			startFromHalf();

		});
		
		function submitPage() {
			document.mainForm.action1.value = "CHECKOUT_ACTION";
			document.mainForm.submit();
		}
		function expressChecout(id){
			expressCheckoutAdd(id);
		}
		function expressCheckoutAdd(value) {
			$.ajax({
				url : "/hookahknights?action1=EXPRESSCHECKOUT",
				data : {
					prod : '<%=new Gson().toJson(prevOrders)%>',
					item : value,
				},
				async : true,
				contentType : 'application/json; charset=utf-8',
				type : "GET",
				success : function(response) {
					submitPage();
				},
				error : function(xhr) {

				}

			});

		}
		function ajaxAddToCart(value) {
			var id = value;
			var base1 = $('input[name=group' + value + '_1]:checked').val();
			var flavour_1 = document.getElementById('select_flavour_id_'
					+ value + '_1').value;
			$.ajax({
				url : "/hookahknights?action1=ADD_TO_CART",
				data : {
					prod_id : id,
					base1 : base1,
					flavour_first : flavour_1,
				},
				contentType : 'application/json; charset=utf-8',
				type : "GET",
				success : function(response) {

				},
				error : function(xhr) {

				}

			});

		}
		function updateCart() {
			//show counter if this is the first item added to the cart
			var cartItems = $('#cart_value');
			var value = parseInt(cartItems.text()) + 1;
			cartItems.text(value);
		}
		function showSubProducts(value) {
			$('.pop-up').hide();
			$('#to_display').html($('#prod_id_' + value + '_div').html());
			$('#prod_id_' + value + '_div').toggle();
			$('.pop-up').fadeIn(500);
			$('#overlay').addClass('blur-in');
			$('#overlay').removeClass('blur-out');
			$('.close-button').click(function(e) {
				$('#prod_id_' + 1 + '_div').hide();
				$('#prod_id_' + 2 + '_div').hide();
				$('#prod_id_' + 3 + '_div').hide();
				$('.pop-up').fadeOut(100);
				$('#overlay').removeClass('blur-in');
				$('#overlay').addClass('blur-out');
				e.stopPropagation();
			});
			//$('#prod_id_' + value + '_div').toggle(300);
		}
		$('.add-to-cart').on('click', function() {
			if (isAddMoreApplicable(this.id)) {
				//$('#prod_id_' + this.id + '_div').hide(1000);
				var cart = $('.shopping-cart');
				var imgtodrag = $(this).parent('.item').find("img").eq(0);
				if (imgtodrag) {
					var imgclone = imgtodrag.clone().offset({
						top : imgtodrag.offset().top,
						left : imgtodrag.offset().left
					}).css({
						'opacity' : '0.5',
						'position' : 'absolute',
						'height' : '150px',
						'width' : '150px',
						'z-index' : '100'
					}).appendTo($('body')).animate({
						'top' : cart.offset().top + 10,
						'left' : cart.offset().left + 10,
						'width' : 75,
						'height' : 75
					}, 1000, 'easeInOutExpo');

					setTimeout(function() {
						cart.effect("shake", {
							times : 2
						}, 200);
					}, 1500);

					imgclone.animate({
						'width' : 0,
						'height' : 0
					}, function() {
						$(this).detach()
						updateCart();
					});
				}

				ajaxAddToCart(this.id);
			}
			$('.close-button').click();
		});
		function isAddMoreApplicable(prodId) {
			var retVal = false;
			$
					.ajax({
						url : '/hookahknights?action1=CAN_ADD_MORE',
						type : 'GET',
						data : {
							id : prodId
						},
						async : false,
						contentType : 'application/json; charset=utf-8',
						success : function(response) {
							if (response != '') {
								swal(
										{
											title : response,
											text : "You can either wait or proceed without adding this hookah !!!",
											type : "warning",
											showCancelButton : true,
											confirmButtonColor : "#DD6B55",
											confirmButtonText : "Cool! proceed without adding!",
											cancelButtonText : "No, i'll wait!",
											closeOnConfirm : false,
											closeOnCancel : false
										},
										function(isConfirm) {
											if (isConfirm) {
												swal(
														"",
														"Thanks for proceeding !!!",
														"success");
											} else {
												swal(
														"Thanks for waiting...",
														"Your cart is still the same !!! :)",
														"success");
											}
										});
								retVal = false;
							} else {
								retVal = true;
							}
						},
						error : function() {
							return false;
						}
					});
			return retVal;

		}
		function change() {
			var target = document.getElementById("hookah_small_img");
			target.src = "hookah15.png";
			window.setTimeout(function() {
				target.src = "hookah16.png";
			}, 500);
			window.setTimeout(function() {
				target.src = "hookah14.jpg";
			}, 1000);
			// 			window.setTimeout(function() {
			// 				target.src = "hookah16.png";
			// 			}, 500);
		}
		function changeReset() {
			/* var target = document.getElementById("hookah_small_img");
			target.src = "hookah14.jpg"; */
		}
	</script>

	<!-- Footer -->

	<!--	<footer>
		<hr>
		<div class="container text-center">
			<hr>
			<ul class="list-inline">
				<li><a href="http://www.twitter.com/wiredwiki">Twitter</a></li>
				<li><a href="http://www.facebook.com/askorama">Facebook</a></li>
				<li><a href="http://www.youtube.com/wiredwiki">YouTube</a></li>
			</ul>

			<p>&copy; Copyright @ 2014</p>

		
		end Container


	</footer> -->

	<!-- Latest compiled and minified JavaScript -->
	<script type="text/javascript">
		$(document).ready(function() {
			$(".menu-trigger").click(function() {
				$(".menu").slideToggle(400, function() {
					$(this).toggleClass("nav-expanded").css('display', '');
				});
			});
		});
		/*JS for the dropdown in the menu*/
		$(document).ready(function() {
			$("li").click(function() {
				$('li > ul').not($(this).children("ul").slideToggle()).hide();
			});
		});
	</script>
	<script type="text/javascript" src="/js/bootstrap.min.js"></script>
	<!-- <script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> -->
</body>

</html>