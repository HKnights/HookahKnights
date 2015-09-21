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
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
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
	</style>
<body data-spy="scroll" data-target="#my-navbar">
<form action="hookahknights" method="POST" name="mainForm" >
<input type="hidden" name="user_name" value="">
  <input type="hidden" name="user_pass" value="">
  <input type="hidden" name="user_signup" value="false">
  <input type="hidden" name="user_login" value="false">
  <input type="hidden" name="user_id" value="">
  <input type="hidden" name="user_email" value="">
  <input type="hidden" name="user_image" value="">
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
  			<div id="SIN" onclick="openLoginPage();" href="#DemoModal2" class="btn btn-lg btn-primary btn-warning navbar-btn navbar-right" data-toggle="modal">Login</div>
  			<div id="LGO" onclick="logout();" style="display:none;"class="btn btn-lg btn-primary btn-warning navbar-btn navbar-right" data-toggle="modal">Log Out</div>
  			 <div id="LGOFB" onclick="fbLogout();" style="display:none;"class="btn btn-lg btn-primary btn-warning navbar-btn navbar-right" data-toggle="modal">Log Out</div>
			<div id="LGOGM" onclick="gmSignOut();" style="display:none;"class="btn btn-lg btn-primary btn-warning navbar-btn navbar-right" data-toggle="modal">Log Out</div> 
  				<ul class="nav navbar-nav">
  					<li><a href="#home">Home</a> 
  					<li><a href="#gallery">Gallery</a> 
  					<li><a href="#faq">Faq</a> 
  					<li><a href="#contact">ContactUs</a> 
  				</ul>
  			</div>
			<div><div id="status" style="float: right;margin-top: -36px;margin-right: 130px;font-size: smaller;color: white;"></div>
			<span><img id="user_profile_pic"  src=""  height="25" width="25" style=" display :none;  border-radius: 10px;float: right;margin-top: -36px;margin-right: 101px;"></span></div>
  		</div><!-- End Container-->
  	</nav><!-- End navbar -->
  	<!-- jumbotron-->
  	<div class="jumbotron">
  		<div class="container text-center">
  			<h1>Welcome to HOOKAH KNIGHTS</h1>
  			<p>Your one and only Hookah Stop </p>
  			
  		</div><!-- End container -->
  	</div><!-- End jumbotron-->
  	<!-- Feedback-->
  	<div class="container">
  		<section>
  			<div class="page-header container text-center" id="home" style="padding-bottom: 0px;">
  			<div class="btn-group">
<!--   				<input type="submit" class="btn btn-lg btn-warning" value="Search Hookah/Beverages" /> -->
  				<input type="button" class="btn btn-lg btn-warning" value="Search Hookah/Beverages" onclick="addToOrder();">
  			</div>
  			</div>
  			<div class="row">
  				<div class="col-md-4">
  					<blockquote>
  						<div class="item active">
  						<img src="hookah1.jpg" alt="Text of the image" style="width: 347px;">
  					</div>
  					</blockquote>
  				</div>
  				<div class="col-md-4">
  					<blockquote>
  						<div class="item active">
  						<img src="hookah2.jpg" alt="Text of the image" style=" width: 360px; margin-left: -8px; height: 233px;">
  					</div>
  					</blockquote>
  				</div>
  				<div class="col-md-4">
  					<blockquote>
  						<div class="item active">
  						<img src="hookah3.jpg" alt="Text of the image" style="width: 347px; height: 233px;">
  					</div>
  					</blockquote>
  				</div>
  			</div><!-- End row -->
  		</section>
  	</div><!--End Container-->
  	
  	<!-- Categories -->
<!-- Gallery -->
	<div class="container">
		<section>
			<div class="page-header" id="gallery">
  				<h2>Gallery.<small> Check out the Awesome Gallery</small></h2>
  			</div>
  			<div class="carousel slide" id="screenshot-carousel" data-ride="carousel">
  				<ol class="carousel-indicators">
  					<li data-target="#screenshot-carousel" data-slide-to="0" class="active"></li>
  					<li data-target="#screenshot-carousel" data-slide-to="1"></li>
  				</ol>
  				<div class="carousel-inner">
  					<div class="item active">
  						<img src="hookah4.jpg" alt="Text of the image">
  						<div class="carousel-caption">
  						</div>
  					</div>
  					<div class="item">
  						<img src="hookah2.jpg" alt="Text of the image">
  						<div class="carousel-caption">
  						</div>
  					</div>
  				</div><!-- End Carousel inner -->
  				<a href="#screenshot-carousel" class="left carousel-control" data-slide="prev">
  					<span class="glyphicon glyphicon-chevron-left"></span>
  				</a>
  				<a href="#screenshot-carousel" class="right carousel-control" data-slide="next">
  					<span class="glyphicon glyphicon-chevron-right"></span>
  				</a>
  			</div><!-- End Carousel -->
		</section>
	</div>
<!-- Faq -->
    <div class="container">
      <section>
        <div class="page-header" id="faq">
          <h2>FAQ.<small> Engaging with consumers.</small></h2>
        </div><!-- End Page Header -->
        <div class="panel-group" id="accordion">
          <div class="panel panel-default">
            <div class="panel-heading">
              <div class="panel-title">
                <a href="#collapse-1" data-toggle="collapse" data-parent="#accordion">
                  Question one?
                </a>
              </div><!-- End panel title -->
              <div id="collapse-1" class="panel-collapse collapse in">
                <div class="panel-body">
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec egestas non urna in fringilla. Praesent consequat est at feugiat faucibus
                </div>
              </div><!-- End Panel collapse -->
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <div class="panel-title">
                <a href="#collapse-2" data-toggle="collapse" data-parent="#accordion">
                  Question Two?
                </a>
              </div><!-- End panel title -->
              <div id="collapse-2" class="panel-collapse collapse">
                <div class="panel-body">
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec egestas non urna in fringilla. Praesent consequat est at feugiat faucibus
                </div>
              </div><!-- End Panel collapse -->
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <div class="panel-title">
                <a href="#collapse-3" data-toggle="collapse" data-parent="#accordion">
                  Question Three?
                </a>
              </div><!-- End panel title -->
              <div id="collapse-3" class="panel-collapse collapse">
                <div class="panel-body">
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec egestas non urna in fringilla. Praesent consequat est at feugiat faucibus
                </div>
              </div><!-- End Panel collapse -->
            </div>
          </div>
        </div><!-- End panel group -->
      </section>
    </div><!-- End container -->
<!-- Contact -->
  <div class="container">
    <section>
      <div class="page-header" id="contact">
          <h2>Contact Us.<small> Contact us for more.</small></h2>
        </div><!-- End Page Header -->
        <div class="row">
          <div class="col-lg-4">
            <p>Send us a message, or contact us from the address below</p>
            <address>
              <strong>Wiredwiki Pvt Ltd.</strong></br>
              111, Malviya nagar </br>
              Plot no. 45</br>
              New delhi - 110017</br>
              P: +91 9999999999
            </address>
          </div>
          
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
        <div class="container text-center">
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