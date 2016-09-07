<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Test</title>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<link href="../axZm/axZm.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../axZm/jquery.axZm.js"></script>

<script type="text/javascript"
	src="../axZm/extensions/axZmThumbSlider/lib/jquery.mousewheel.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="../axZm/extensions/axZmThumbSlider/skins/default/jquery.axZm.thumbSlider.css" />
<script type="text/javascript"
	src="../axZm/extensions/axZmThumbSlider/lib/jquery.axZm.thumbSlider.js"></script>

<link rel="stylesheet" type="text/css"
	href="../axZm/extensions/jquery.axZm.mouseOverZoomTiles.css" />
<script type="text/javascript"
	src="../axZm/extensions/jquery.axZm.mouseOverZoomTiles.js"></script>

</head>
<body>
	<div class="mouseOverTilesWrapper">
		<!-- Container for preview image (AJAX-ZOOM "image map") -->
		<div id="mouseOverTilesMapContainer" style="height: 300px;">
			<!-- Optional enlarge icon -->
			<div class="mouseOverTilesEnlarge"></div>
			<!-- Optional message -->
			<div class="mouseOverTilesMsg">use mousewheel to zoom in and
				out, click to enlarge</div>
		</div>
		<!-- Gallery with thumbs (will be filled with JS instantly as UL, LI) -->
		<div id="mouseOverTilesGallery" class="horizontal">Gellery
			loading...</div>
	</div>

<script type="text/javascript">
$(document).ready(function(){
	    $.mouseOverZoomTiles({
	        axZmPath: "../axZm/", // path to /axZm directory, e.g. /test/axZm/ or "auto" (auto might not always work)
	        mapDivID: "mouseOverTilesMapContainer", // ID of the container for mouseover element
	        galleryDivID: "mouseOverTilesGallery", // ID of the container where thumbnails will be inserted into
	        images: {
	            1: {img: "/hookah14.jpg", title: "hookah14.jpg"}
// 	            2: {img: "fashion2.png", title: "test_fashion2.png"},
// 	            3: {img: "fashion3.png", title: "test_fashion3.png"},
// 	            4: {img: "fashion4.png", title: "test_fashion4.png"},
// 	            5: {img: "test_portrait1.png", title: "test_portrait1.png"},
// 	            6: {img: "test_portrait2.png", title: "test_portrait2.png"},
// 	            7: {img: "test_portrait3.png", title: "test_portrait3.png"},
// 	            8: {img: "test_world1.png", title: "test_world1.png"},
// 	            9: {img: "test_world2.png", title: "test_world2.png"},
// 	            10: {img: "test_world3.png", title: "test_world3.png"}
	        },
	        firstImageToLoad: 1,
	        mediaQueryFullWidth: 900,
	        thumbWidth: 86, // width of the thumbnail image
	        thumbHeight: 86, // height of the thumbnail image
	        galleryAxZmThumbSlider: true, // use $.axZmThumbSlider for the gallery. If false a different Ul->LI structure will be applied without scrolling capeability
	        heightRatio: "1.0|+140", // Instantly adjust the height of the parent contaoner for mouseover image (defined as "mapDivID" option) depending on it's width which can be responsive
	        disableTouchMouseover: true, // Disable mouseover for touch devices.
	        zoomWidth: ".rightLayer", // max width of the image that will be shown in the zoom window
	        zoomHeight: "#mouseOverTilesMapContainer|+105", // max height of the image that will be shown in the zoom window
	        adjustX: 20, // space between mouse over zoom ("mapDivID") and flyout window to the right
	        adjustY: 0, // vertical shift of the flyout window
	        mapSelSmoothDrag: false, // activate smooth drag
	        mapSelSmoothDragSpeed: 500, // speed of the dragging
	        scrollZoom: 16, // prc zoom on mouse scroll
	        fullScreenApi: false, // try to open AJAX-ZOOM at browsers fullscreen mode, possible on modern browsers
	        axZmCallBacks: {}  // callbacks which can be passed to AJAX-ZOOM
	    });
	});
</script>

</body>
</html>