<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Login/Sign-In</title>
    
    
    <link rel="stylesheet" href="css/normalize.css">

    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

        <link rel="stylesheet" href="css/style.css">

    
    
    
  </head>

  <body>
    <div class="logmod" style="margin-top: -37px;">
<%@include file="/login.jsp" %>
  <div class="logmod__wrapper">
    <span class="logmod__close" onclick="closeLoginPage();" style="  margin-right: -299px;margin-top: 47px;z-index: 10;">Close</span>
    <div class="logmod__container">
      <ul class="logmod__tabs">
        <li data-tabtar="lgm-2"><a href="#">Login</a></li>
        <li data-tabtar="lgm-1"><a href="#">Sign Up</a></li>
      </ul>
      <div class="logmod__tab-wrapper">
      <div class="logmod__tab lgm-1">
        <div class="logmod__heading">
          <span class="logmod__heading-subtitle">Enter your personal details <strong>to create an acount</strong></span>
        </div>
        <div class="logmod__form">
          <form accept-charset="utf-8" action="#" class="simform">
            <div class="sminputs">
              <div class="input full">
                <label class="string optional" for="user-name">Email*</label>
                <input class="string optional" maxlength="255" id="user-email2" placeholder="Email" type="email" size="50" />
              </div>
            </div>
            <div class="sminputs">
              <div class="input string optional">
                <label class="string optional" for="user-pw">Password *</label>
                <input class="string optional" maxlength="255" id="user-pw2" placeholder="Password" type="password" size="50" />
              </div>
              <div class="input string optional">
                <label class="string optional" for="user-pw-repeat">Repeat password *</label>
                <input class="string optional" maxlength="255" id="user-pw-repeat2" placeholder="Repeat password" type="password" size="50" />
              </div>
            </div>
            <div class="simform__actions">
              <input type="button" class="sumbit" name="commit" type="sumbit" value="Create Account" onclick="loginUser()"/>
              <span class="simform__actions-sidetext">By creating an account you agree to our <a class="special" href="#" target="_blank" role="link">Terms & Privacy</a></span>
            </div> 
          </form>
        </div> 
        <div class="logmod__alter">
          <div class="logmod__alter-container">
          </div>
        </div>
      </div>
      <div class="logmod__tab lgm-2">
        <div class="logmod__heading">
          <span class="logmod__heading-subtitle">Enter your email and password <strong>to sign in</strong></span>
        </div> 
        <div class="logmod__form">
          <form accept-charset="utf-8" action="#" class="simform">
            <div class="sminputs">
              <div class="input full">
                <label class="string optional" for="user-name">Email*</label>
                <input class="string optional" maxlength="255" id="user-email1" placeholder="Email" type="email" size="50" />
              </div>
            </div>
            <div class="sminputs">
              <div class="input full">
                <label class="string optional" for="user-pw">Password *</label>
                <input class="string optional" maxlength="255" id="user-pw1" placeholder="Password" type="password" size="50" />
                						<span class="hide-password">Show</span>
              </div>
            </div>
            <div class="simform__actions">
              <input type="button" class="sumbit" name="commit" type="sumbit" value="Log In" onclick="loginUser()"/>
              <span class="simform__actions-sidetext"><a class="special" role="link" href="#">Forgot your password?<br>Click here</a></span>
            </div> 
          </form>
        </div> 
          </div>
      </div>
      <div class="logmod__alter">
          <div class="logmod__alter-container">
            <a href="#" class="connect facebook">
              <div class="connect__icon" onclick="checkLoginState();">
                <i class="fa fa-facebook" "></i>
              </div>
              <div class="connect__context" onclick="checkLoginState();" >
                <span >Sign in with <strong>Facebook</strong></span>
              </div>
            </a>
            <a href="#" class="connect googleplus" onclick="gSignIn();">
              <div class="connect__icon">
                <i class="fa fa-google-plus" ></i>
              </div>
              <div class="connect__context" >
                <span onclick="gSignIn();">Sign in with <strong>Google</strong></span>
              </div>
            </a>
          </div>
        </div>
    </div>
  </div>
</div>
<script type="text/javascript">
function loginUser(){
	document.mainForm.user_login.value=false;
	document.mainForm.user_signup.value=false;
	var userEmail=$('input[id=user-email1]').val();
	var userPassword=$('input[id=user-pw1]').val();
	if(userEmail==''){
		userEmail=$('input[id=user-email2]').val();
		userPassword=$('input[id=user-pw2]').val();
		if(userPassword !=$('input[id=user-pw-repeat2]').val()){
			alert('Password do not match');
			return;
		}
	}
	if(!validateEmail(userEmail)){
		alert('please enter valid email Id'); 
		return;
	}
		if(userPassword==''){
			alert('please enter valid password'); 
			return;
		}
		if($('input[id=user-pw2]').val()!='' && $('input[id=user-email2]').val()!=''){
 			document.mainForm.user_signup.value=true;
 			document.mainForm.user_login.value=false;
		}else{
			document.mainForm.user_login.value=true;
			document.mainForm.user_signup.value=false;
		}
		
	document.mainForm.user_name.value=userEmail.split('@')[0];
    document.mainForm.user_id.value='';
    document.mainForm.user_image.value='';
    document.mainForm.user_pass.value=userPassword;
    document.mainForm.user_email.value=userEmail;
    document.mainForm.action1.value='USER_LOGIN';
  	document.mainForm.submit();
}
function validateEmail(email) {
    var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    return re.test(email);
}
function gSignIn(){
	document.getElementsByTagName('button')[2].click();
}
function closeLoginPage(){
	$('.logmod')[0].style.display='none';
	if($('.modal-backdrop').length!=0){
	$('.modal-backdrop')[0].style.display='none';
	//$('#DemoModal2')[0].style.display='none';
	$('#DemoModal2').click();
	}
}
function openLoginPage() {
	$('.logmod')[0].style.display='block';
	if($('.modal-backdrop').length!=0){
		$('.modal-backdrop')[0].style.display='block';
		$('#DemoModal2')[0].style.display='block';
		//$('#SIN').click();
		}
//	$('#DemoModal2')[0].style.display='block';
}
</script>

        <script src="js/index.js"></script>

    
    
    
  </body>
</html>
