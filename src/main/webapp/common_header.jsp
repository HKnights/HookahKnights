
<html>

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
<body>
	<input type="hidden" name="user_name" value="">
	<input type="hidden" name="user_pass" value="">
	<input type="hidden" name="user_signup" value="false">
	<input type="hidden" name="user_login" value="false">
	<input type="hidden" name="user_id" value="">
	<input type="hidden" name="user_email" value="">
	<input type="hidden" name="user_image" value="">
	<div id="cart_div">
		<span><i class="shopping-cart"><img
				src="white-shopping-cart-png.png"
				style="margin-left: 10px; margin-top: 17px;" /></i></span><span id="cart_value"
			style="float: right; margin-right: -46px; line-height: 18px; margin-top: 9px; background-color: #46b29d; color: #ffffff; font-size: 1rem; font-weight: bold; text-align: center; border-radius: 50%; transition: transform 0.2s 0s; height: 18px; width: 18px;">0</span>
	</div>
	<div><div id="status" style="float: right;margin-top: 20px;position: fixed;margin-left: 865px;font-size: smaller;color: white;"></div>
			<span><img id="user_profile_pic"  src=""  height="25" width="25" style=" display :none;  border-radius: 10px;float: right;margin-top: 18px;margin-left: 969px;position: fixed;"></span></div>
  		
	<div id="SIN" onclick="openLoginPage();" href="#DemoModal2"
		class="btn btn-lg btn-primary btn-warning navbar-btn navbar-right"
		data-toggle="modal">Login</div>
	<div id="LGO" onclick="logout();" style="display: none;"
		class="btn btn-lg btn-primary btn-warning navbar-btn navbar-right"
		data-toggle="modal">Log Out</div>
</body>
</html>