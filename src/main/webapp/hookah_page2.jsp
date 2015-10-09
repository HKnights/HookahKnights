<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Hookah Knights</title>
<meta name="description" content="Wiredwiki App">
<!-- Latest compiled and minified CSS -->
<!-- Latest compiled and minified CSS -->
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> -->

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link
	href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css"
	rel="stylesheet">
</head>
<style>
body {
	padding-top: 40px;
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
	margin-left: 0px;
	    width: 90%;
}

.hookahImg {
	width: 140px;
	border-radius: 110px;
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
</style>

<body data-spy="scroll" data-target="#my-navbar">

	<form action="hookahknights" method="POST" name="mainForm">
		<input type="hidden" name="user_name" value=""> <input
			type="hidden" name="user_pass" value=""> <input type="hidden"
			name="user_signup" value="false"> <input type="hidden"
			name="user_login" value="false"> <input type="hidden"
			name="user_id" value=""> <input type="hidden"
			name="user_email" value=""> <input type="hidden"
			name="user_image" value=""> <input type="hidden"
			name="action1" value="" /> <input type="hidden" name="selected_item"
			value="" /> <input type="hidden" name="prod_1" id="prod_id_1"
			value="orderId_1" /> <input type="hidden" name="prod_2"
			id="prod_id_2" value="orderId_2" /> <input type="hidden"
			name="prod_3" id="prod_id_3" value="orderId_3" />
		<!-- <input type="hidden" name="selected_item" value="" /> -->
		<!-- <input type="hidden" name="selected_item" value="" /> -->

		<!--  
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
  			</div>Navbar Header
  			<div class="collapse navbar-collapse" id="navbar-collapse">
  				
  			<div id="SIN" onclick="openLoginPage();" href="#DemoModal2" class="btn btn-lg btn-primary btn-warning navbar-btn navbar-right" data-toggle="modal">Login</div>
  			<div id="LGO" onclick="logout();" style="display:none;"class="btn btn-lg btn-primary btn-warning navbar-btn navbar-right" data-toggle="modal">Log Out</div>
  				<ul class="nav navbar-nav">
  					<li><a href="">Home Page</a></li> 
  					<li><a href="#hookahs">Hookahs</a></li>
  					<li><a href="#sides">Sides/Beverages</a></li> 
  				</ul>
  			</div>
  			<div><div id="status" style="float: right;margin-top: -36px;margin-right: 130px;font-size: smaller;color: white;"></div>
  			<span><img id="user_profile_pic"  src=""  height="25" width="25" style=" display :none;  border-radius: 10px;float: right;margin-top: -36px;margin-right: 101px;"></span></div>
  		</div>End Container
  	</nav>End navbar -->
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
					<%@include file="/common_header.jsp" %>
					<ul class="nav navbar-nav">
						<li><a href="#home">Home</a>
						<li><a href="#hookahs">Hookahs</a></li>
						<li><a href="#sides">Sides/Beverages</a></li>
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
					<h2>Hookah Categories.</h2>
				</div>
				<!-- End Page Header -->

				<table style="width: 100%">
					<tr >
						<td style="padding-bottom: 15px;">
							<div class="col-sm-4">
							
									<!-- items -->
									<div class="items">
										<!-- single item -->
										<div class="item">
											<img src="hookah14.jpg" alt="item" class="hookahImg" />
											<h2>Hukkah Small</h2>
											<button id="1"
												style="color: #ffffff; width: 117px; background-color: #46b29d; height: 34px; border-radius: 4px; position: relative; overflow: hidden; -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; font-weight: 900; text-transform: uppercase; line-height: 30px; border: none;"
												onclick="showSubProducts(1)" type="button">Customize your hookah</button>
										</div>
										<!--/ single item -->
										<!-- single item -->

										<!--/ items -->
									
								</div>
								</div>
						</td>
					</tr>
					<tr>
						<td style="padding-bottom: 15px;">
							<div class="row-page-header" id="large"
								style="padding-bottom: 0px; margin-left: 0px !important;">
								<div class="col-sm-8"
									style="display: none; background-color: #eee;"
									id="prod_id_1_div">
									<h3
										style="text-decoration: underline; margin-top: 7px; margin-bottom: 3px; font-size: 19px;">Small
										Sized Hookah</h3>
									<div>
										<table>
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
														Flavour 1</h2></td>
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
												<td style="width: 400px;"><h2 style="font-size: 16px;">Choose
														Flavour 2</h2></td>
												<td>
													<div>
														<select name="select_flavour" id="select_flavour_id_1_2">
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
														Base 1</h2></td>
												<td>
													<div style="width: 400px;">
														<label class="radio-inline"><input type="radio"
															name="group1_1" value="Water" checked> Water</label>&nbsp;
														<label class="radio-inline"><input type="radio"
															name="group1_1" value="Milk"> Milk</label>&nbsp; <label
															class="radio-inline"><input type="radio"
															name="group1_1" value="Ice"> Ice</label>
													</div>
												</td>
											</tr>
											<tr>
												<td><h2 style="font-size: 16px; width: 400px;">Liquid
														Base 2</h2></td>
												<td>
													<div style="width: 400px;">
														<label class="radio-inline"><input type="radio"
															name="group1_2" value="Water" checked> Water</label>&nbsp;
														<label class="radio-inline"><input type="radio"
															name="group1_2" value="Milk"> Milk</label>&nbsp; <label
															class="radio-inline"><input type="radio"
															name="group1_2" value="Ice"> Ice</label>&nbsp; <label
															class="radio-inline"><input type="radio"
															name="group1_2" value="Juice"> Juice</label>
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
												<!-- <td><input type="button" onclick="ajaxAddToCart(1)" style="margin-right: -14px;margin-bottom: -3px; width:100px" class="btn btn-warning navbar-btn navbar-right" value="Add" /></td></tr> -->
										</table>
									</div>
										<div class="item" style="float: right;margin-top: -284px;">
											<img src="hookah14.jpg" alt="item" class="hookahImg" />
											<h2>Hukkah Small</h2>
											<button id="1"
												style="color: #ffffff; width: 117px; background-color: #46b29d; height: 34px; border-radius: 4px; position: relative; overflow: hidden; -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; font-weight: 900; text-transform: uppercase; line-height: 30px; border: none;"
												class="add-to-cart" type="button">Add to cart</button>
										</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td style="border-top: solid rgba(112, 115, 108, 0.05) 1px;padding-top: 20px">

							<div class="col-sm-4">
								<div class="items">
									<!-- single item -->
									<div class="item">
										<img src="hookah14.jpg" alt="item" class="hookahImg" />
										<h2>Hukkah Medium</h2>
										<button id="2"
											style="color: #ffffff; width: 117px; background-color: #46b29d; height: 34px; border-radius: 4px; position: relative; overflow: hidden; -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; font-weight: 900; text-transform: uppercase; line-height: 30px; border: none;"
											onclick="showSubProducts(2)" type="button">Customize your hookah</button>
									</div>
									<!--/ single item -->
									<!-- single item -->

									<!--/ items -->
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="row page-header" id="medium"
								style="padding-bottom: 0px; margin-left: 0px !important;">
								<div class="col-sm-8"
									style="display: none; background-color: #eee;"
									id="prod_id_2_div">
									<h3
										style="text-decoration: underline; margin-top: 7px; margin-bottom: 3px; font-size: 19px;">Medium
										Sized Hookah</h3>
									<div>
										<table>
											<tr>
												<td><h2 style="font-size: 16px; width: 400px;">Cost</h2></td>
												<td style="width: 400px;" id="cost_2">Rs 600</td>
											</tr>
											<tr>
												<td><h2 style="font-size: 16px; width: 400px;">Coal</h2></td>
												<td>6 Pieces</td>
											</tr>
											<tr>
												<td><h2 style="font-size: 16px; width: 400px;">Choose
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
												<td><h2 style="font-size: 16px; width: 400px;">Choose
														Flavour 2</h2></td>
												<td>
													<div>
														<select name="select_flavour" id="select_flavour_id_2_2">
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
														Base 1</h2></td>
												<td>
													<div style="width: 400px;">
														<label class="radio-inline"><input type="radio"
															name="group2_1" value="Water" checked> Water</label>&nbsp;
														<label class="radio-inline"><input type="radio"
															name="group2_1" value="Milk"> Milk</label>&nbsp; <label
															class="radio-inline"><input type="radio"
															name="group2_1" value="Ice"> Ice</label>&nbsp; <label
															class="radio-inline"><input type="radio"
															name="group2_1" value="Juice"> Juice</label>
													</div>
												</td>
											</tr>
											<tr>
												<td><h2 style="font-size: 16px; width: 400px;">Liquid
														Base 2</h2></td>
												<td>
													<div style="width: 400px;">
														<label class="radio-inline"><input type="radio"
															name="group2_2" value="Water" checked> Water</label>&nbsp;
														<label class="radio-inline"><input type="radio"
															name="group2_2" value="Milk"> Milk</label>&nbsp; <label
															class="radio-inline"><input type="radio"
															name="group2_2" value="Ice"> Ice</label>&nbsp; <label
															class="radio-inline"><input type="radio"
															name="group2_2" value="Juice"> Juice</label>
													</div>
												</td>
											</tr>
											<tr>
												<td><h2 style="font-size: 16px; width: 400px;">2
														in 1 Flavours</h2></td>
												<td>Not Available</td>
											</tr>
											<tr>
												<td><h2 style="font-size: 16px; width: 400px;">Security</h2></td>
												<td><span>Rs 700 </span></td>
										</table>
									</div>
										<div class="item" style="float: right;margin-top: -284px;">
											<img src="hookah14.jpg" alt="item" class="hookahImg" />
											<h2>Hookah Medium</h2>
											<button id="2"
												style="color: #ffffff; width: 117px; background-color: #46b29d; height: 34px; border-radius: 4px; position: relative; overflow: hidden; -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; font-weight: 900; text-transform: uppercase; line-height: 30px; border: none;"
												class="add-to-cart" type="button">Add to cart</button>
										</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="col-sm-4">
								<div class="items">
									<!-- single item -->
									<div class="item">
										<img src="hookah14.jpg" alt="item" class="hookahImg" />
										<h2>Hukkah Large</h2>
										<button id="3"
											style="color: #ffffff; width: 117px; background-color: #46b29d; height: 34px; border-radius: 4px; position: relative; overflow: hidden; -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; font-weight: 900; text-transform: uppercase; line-height: 30px; border: none;"
											onclick="showSubProducts(3)" type="button">Customize your hookah</button>
									</div>
									<!--/ single item -->
									<!-- single item -->

									<!--/ items -->
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="row-page-header" id="large"
								style="padding-bottom: 0px; margin-left: 0px !important;">
								<div class="col-sm-8"
									style="display: none; background-color: #eee;"
									id="prod_id_3_div">
									<h3
										style="text-decoration: underline; margin-top: 7px; margin-bottom: 3px; font-size: 19px;">Large
										Sized Hookah</h3>
									<div>
										<table>
											<tr>
												<td><h2 style="font-size: 16px; width: 400px;">Cost</h2></td>
												<td style="width: 400px;" id="cost_3">Rs 700</td>
											</tr>
											<tr>
												<td><h2 style="font-size: 16px; width: 400px;">Coal</h2></td>
												<td>6 Pieces</td>
											</tr>
											<tr>
												<td><h2 style="font-size: 16px; width: 400px;">Choose
														Flavour 1</h2></td>
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
												<td><h2 style="font-size: 16px; width: 400px;">Choose
														Flavour 2</h2></td>
												<td>
													<div>
														<select name="select_flavour" id="select_flavour_id_3_2">
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
														Base 1</h2></td>
												<td>
													<div style="width: 400px;">
														<label class="radio-inline"><input type="radio"
															name="group3_1" value="Water" checked> Water</label>&nbsp;
														<label class="radio-inline"><input type="radio"
															name="group3_1" value="Milk"> Milk</label>&nbsp; <label
															class="radio-inline"><input type="radio"
															name="group3_1" value="Ice"> Ice</label>&nbsp; <label
															class="radio-inline"><input type="radio"
															name="group3_1" value="Juice"> Juice</label>&nbsp; <label
															class="radio-inline"><input type="radio"
															name="group3_1" value="Juice"> Coldrink</label>
													</div>
												</td>
											</tr>
											<tr>
												<td><h2 style="font-size: 16px; width: 400px;">Liquid
														Base 2</h2></td>
												<td>
													<div style="width: 400px;">
														<label class="radio-inline"><input type="radio"
															name="group3_2" value="Water" checked> Water</label>&nbsp;
														<label class="radio-inline"><input type="radio"
															name="group3_2" value="Milk"> Milk</label>&nbsp; <label
															class="radio-inline"><input type="radio"
															name="group3_2" value="Ice"> Ice</label>&nbsp; <label
															class="radio-inline"><input type="radio"
															name="group3_2" value="Juice"> Juice</label>&nbsp; <label
															class="radio-inline"><input type="radio"
															name="group3_2" value="Juice"> Coldrink</label>
													</div>
												</td>
											</tr>
											<tr>
												<td><h2 style="font-size: 16px; width: 400px;">2
														in 1 Flavours</h2></td>
												<td>Available</td>
											</tr>
											<tr>
												<td><h2 style="font-size: 16px; width: 400px;">Security</h2></td>
												<td>Rs 1000</td>
										</table>
									</div>
										<div class="item" style="float: right;margin-top: -284px;">
											<img src="hookah14.jpg" alt="item" class="hookahImg" />
											<h2>Hukkah Large</h2>
											<button id="3"
												style="color: #ffffff; width: 117px; background-color: #46b29d; height: 34px; border-radius: 4px; position: relative; overflow: hidden; -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; font-weight: 900; text-transform: uppercase; line-height: 30px; border: none;"
												class="add-to-cart" type="button">Add to cart</button>
										</div>
								</div>
							</div>
						</td>
					</tr>
				</table>
				<hr>
			</section>
		</div>
		<!-- End Container -->

		<!-- Contact -->

		<div class="container">
			<section>
				<div class="page-header" id="contact">
					<h2>Contact Us.</h2>
				</div>
				<!-- End Page Header -->

				<div class="row-page-header" style="margin-left: 0px !important;">
					<div class="col-lg-4">
						<p>Send us a message, or contact us from the address below</p>


						<address>
							<strong>Wiredwiki Pvt Ltd.</strong></br> 111, Malviya nagar </br> Plot no.
							45</br> New delhi - 110017</br> P: +91 9999999999
						</address>
					</div>

					<div class="col-lg-8">
						<form action="" class="form-horizontal">
							<div class="form-group">
								<label for="user-name" class="col-lg-2 control-label">Name</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="user-name"
										placeholder="Enter you name">
								</div>
							</div>
							<!-- End form group -->

							<div class="form-group">
								<label for="user-email" class="col-lg-2 control-label">Email</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="user-email"
										placeholder="Enter you Email Address">
								</div>
							</div>
							<!-- End form group -->

							<div class="form-group">
								<label for="user-message" class="col-lg-2 control-label">Any
									Message</label>
								<div class="col-lg-10">
									<textarea name="user-message" id="user-message"
										class="form-control" cols="20" rows="4"
										placeholder="Enter your Message"></textarea>
								</div>
							</div>
							<!-- End form group -->

							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</div>
						</form>
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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
	<script>
		function ajaxAddToCart(value) {
			var id = value;
			var base1 = $('input[name=group' + value + '_1]:checked').val();
			var base2 = $('input[name=group' + value + '_2]:checked').val();
			var flavour_1 = document.getElementById('select_flavour_id_'+ value + '_1').value;
			var flavour_2 = document.getElementById('select_flavour_id_'+ value + '_2').value;
			$.ajax({
						url : "http://localhost:8888/hookahknights?action1=ADD_TO_CART",
						data : {
							prod_id : id,
							base1 : base1,
							base2 : base2,
							flavour_first : flavour_1,
							flavour_second : flavour_2
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
		function showSubProducts(value){
			$('#prod_id_' + value + '_div').toggle(1000);	
		}
		$('.add-to-cart').on('click', function() {
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
		});
	</script>

	<!-- Footer -->

	<footer>
		<hr>
		<div class="container text-center">
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