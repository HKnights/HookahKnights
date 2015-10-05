<%@page import="main.java.com.eos.accounts.User"%>
<%@page import="main.java.com.eos.utils.SessionManager"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.net.CookieStore"%>
<%@page import="sun.net.www.http.HttpClient"%>
<html lang="en">
  <head>
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="845473618760-8v6rabh48mpdecntb77dkd81h1ovpmva.apps.googleusercontent.com">	
    <script src = "https://plus.google.com/js/client:platform.js" async defer></script>
    <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
    
  </head>
  <body>
  <%Cookie []cookies=request.getCookies(); 
  HttpSession nsession =request.getSession();
  String userImage=(String)nsession.getAttribute("user_image");
  String userName=(String)nsession.getAttribute("user_name");
  String error=(String)nsession.getAttribute("error");
  if(error!=null){
	  nsession.invalidate();
  }
  boolean isUserLoggedOut=true;
  if(cookies!=null){
  for(Cookie ck:cookies){ 
	  if(ck.getName().equals("userId")){
		  isUserLoggedOut=false;
	  }
  }
  }
  %>
    <script type="text/javascript">
    $(function(){
    	if(<%=!isUserLoggedOut%>){
    		  if(<%=userName!=null || "null".equals(userName)%>){
    			  userLoggedInDiv();
    		 	  document.getElementById('status').innerHTML = 'Hi, <%=userName%> !';
    		  	  document.getElementById('user_profile_pic').src='<%=userImage%>';
    		  	  if(<%=userImage !=null && !userImage.equals("")%>){
    		  	  	document.getElementById('user_profile_pic').style.display='block';
    		  	  }
    		  }
    	  }
	});
    if(<%=error!=null%>){
  	  alert('<%=error%>');
    }
      /**
     * Handler for the signin callback triggered after the user selects an account.
     */
     function userLoggedInDiv() {
    	 $('#LGO').toggle();
    	 $('#SIN').toggle();
       }
    function onSignInCallback(resp) {
    //  gapi.client.load('plus', 'v1', apiClientLoaded);
    }

    /**
     * Sets up an API call after the Google API client loads.
     */
    function apiClientLoaded() {
      gapi.client.plus.people.get({userId: 'me'}).execute(handleEmailResponse);
    }

    /**
     * Response callback for when the API client receives a response.
     *
     * @param resp The API response object with the user email and profile information.
     */
    function handleEmailResponse(resp) {
      var primaryEmail;
      /* for (var i=0; i < resp.emails.length; i++) {
        if (resp.emails[i].type === 'account') primaryEmail = resp.emails[i].value;
      } */
      /* document.getElementById('status').innerHTML =
          'Hi, ' + resp.displayName + '!';
  	  document.getElementById('user_profile_pic').src=resp.image.url;
  	  document.getElementById('user_profile_pic').style.display='block'; */
  	 document.mainForm.user_name.value=resp.displayName;
     document.mainForm.user_id.value=resp.id;
     document.mainForm.user_image.value=resp.image.url;
     //document.mainForm.user_email.value=resp.emails[0].value;
     document.mainForm.action1.value='USER_LOGIN';
     if(document.readyState === "complete")
   	document.mainForm.submit();
      // The ID token you need to pass to your backend:
      //toggleGmLgBtn();
      //closeLoginPage();
//       storeUserDetails(resp.displayName,resp.id,resp.emails[0].value);
    }
    // This is called with the results from from FB.getLoginStatus().
    function statusChangeCallback(response) {
      console.log('statusChangeCallback');
      console.log(response);
      // The response object is returned with a status field that lets the
      // app know the current login status of the person.
      // Full docs on the response object can be found in the documentation
      // for FB.getLoginStatus().
      if (response.status === 'connected') {
        // Logged into your app and Facebook.
       // testAPI();
      } else if (response.status === 'not_authorized') {
        // The person is logged into Facebook, but not your app.
        
      } else {
        // The person is not logged into Facebook, so we're not sure if
        // they are logged into this app or not.
       
      }
    }
    function gmSignOut() {
    	window.location = "https://mail.google.com/mail/u/0/?logout&hl=en";
    	gapi.auth.signOut();
    	toggleGmLgBtn();
    	document.getElementById('status').innerHTML ='';
    	document.getElementById('user_profile_pic').style.display='none';
    	alert("You have been Logged out !!!");
		}
   
    // This function is called when someone finishes with the Login
    // Button.  See the onlogin handler attached to it in the sample
    // code below.
    function checkLoginState() {
         
    	FB.getLoginStatus(function(response) {
            /* if (response.status == 'connected') {
              getCurrentUserInfo(response)
            } else { */
            	FB.login(function(){
            	    FB.api('/me',
            	    function(response){
            	    	if(response && !response.error){
            	    	testAPI();
            	    	closeLoginPage();
            	            console.log(response.email);
            	    	}
            	    });
            	},{'scope':'email'});
            
          });
            
    }
    
      function getCurrentUserInfo() {
        FB.api('me', function(userInfo) {
          console.log(userInfo.name + ': ' + userInfo.email);
        },{ scope: 'email,user_photos,publish_actions' });
      }

    window.fbAsyncInit = function() {
    FB.init({
      appId      : '1484009795227981',
      cookie     : true,  // enable cookies to allow the server to access 
                          // the session
      xfbml      : true,  // parse social plugins on this page
      version    : 'v2.2' // use version 2.2
    });

    FB.getLoginStatus(function(response) {
     // statusChangeCallback(response);
    });

    };

    // Load the SDK asynchronously
    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "https://connect.facebook.net/en_US/sdk.js";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    // Here we run a very simple test of the Graph API after login is
    // successful.  See statusChangeCallback() for when this call is made.
    function testAPI() {
      console.log('Welcome!  Fetching your information.... ');
      FB.api('/me', function(response) {
    	  FB.api(
      		    '/'+response.id+'/picture',
      		    function (response) {
      		      if (response && !response.error) {
      		    	document.mainForm.user_image.value=response.data.url;
      		    	document.mainForm.submit();
      		    	//document.getElementById('user_profile_pic').src=
      		    	//document.getElementById('user_profile_pic').style.display='block';
      		      }
      		    }
      		);
        console.log('Successful login for: ' + response.name);
        document.getElementById('status').innerHTML =
          'Hi, ' + response.name + '!';
        document.mainForm.user_name.value=response.name;
        document.mainForm.user_id.value=response.id;
        document.mainForm.action1.value='USER_LOGIN';
        //storeUserDetails(response.name,response.id)
        toggleLgBtn();
        
      }, {scope: 'email'});
    }
function logout(){
    	
	 document.mainForm.action1.value='USER_LOGOUT';
	 document.mainForm.submit();
//     FB.logout(function(response) {
//     	toggleLgBtn();
//     	document.getElementById('status').innerHTML ='';
//     	document.getElementById('user_profile_pic').style.display='none';
//     	});
    }
    function toggleLgBtn(){
    	 $('#LGO').toggle();
         $('#SIN').toggle();
         
    }
    function toggleGmLgBtn(){
   	 $('#LGO').toggle();
        $('#SIN').toggle();
        
   }
    
    </script>
    <fb:login-button style="display:none;" class="fb-login-button" data-max-rows="1" data-size="xlarge" data-show-faces="false" data-auto-logout-link="false" scope="public_profile,email" style="float:right;" onlogin="checkLoginState()">
</fb:login-button>

<div style="display:none; " id="gConnect" class="button">
      <button class="g-signin" 
          data-scope="email"
          data-clientid="845473618760-8v6rabh48mpdecntb77dkd81h1ovpmva.apps.googleusercontent.com"
          data-callback="onSignInCallback"
          data-theme="dark"
          data-cookiepolicy="single_host_origin">
      </button>
    </div>
  </body>
</html>
