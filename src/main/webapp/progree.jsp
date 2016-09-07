<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Insert title here</title>

		<script type="text/javascript" src="jquery.transit.js"></script>
        <script  type="text/javascript" src="ytLoad.jquery.js"></script>
 		<link href="ytLoad.jquery.css" rel="stylesheet" type="text/css">
 		<script  type="text/json" src="ytLoad.jquery.json"></script>

        <script type="text/javascript">
        var examples = {
                basic: function() {
                    $.ytLoad();
                },

                manual: function() {
                    $.ytLoad({
                        registerAjaxHandlers: false
                    });
                    $.ytLoad('start');
                    $.ytLoad('complete');
                    $.ytLoad('error');
                },

                customDurations: function() {
                	  $.ytLoad({
                          registerAjaxHandlers: false,
                          startPercentage: 50,
                          startDuration: 2000,
                          completeDuration: 500,
                          fadeDelay: 1000,
                          fadeDuration: 1000
                      });

                      $.ytLoad('progress', 70);
                      $.ytLoad('progress', 75);
                      $.ytLoad('progress', 80);
                      $.ytLoad('progress', 90);
                      $.ytLoad('progress', 100);
                },

                setProgress: function() {
                    $.ytLoad({
                        registerAjaxHandlers: false,
                        startPercentage: 50,
                        startDuration: 2000,
                        completeDuration: 500,
                        fadeDelay: 2000,
                        fadeDuration: 2000
                    });

                    $.ytLoad('progress', 0);
                    $.ytLoad('progress', 20);
                    $.ytLoad('progress', 25);
                    $.ytLoad('progress', 30);
                    $.ytLoad('progress', 50);
                },

                callbacks: function() {
                    $.ytLoad({
                        onStart: function() {
                            alert('Started!');
                        },
                        onComplete: function() {
                            alert('Complete!');
                        }
                    });
                },

                multipleRequests: function() {
                    $.ytLoad();

                    for(i=0; i < 2000; i++) {
                        
                    }
                }
            };
            $(document).ready(function() {
       

                $('#loadButton').click(function(){
                   
                });

                $('.usageType').click(function() {
                    $.ytLoad('destroy');
                    examples['setProgress']();
                });

                examples.basic();
            });
            function startFromHalf(){
                    $.ytLoad('destroy');
                    examples['customDurations']();
            }
        </script>
        <style>
            body {
                margin: 0px;
                padding: 0px;
                background-color: #EBEBEB;
                border-bottom: 1px solid #e8e8e8;
            }

            #topBar {
                height: 25px;
                padding: 7px;
                padding-left: 15px;
                background-color: #F1F1F1;
            }

            #socialCodingButtons {
                float: right;
            }

            #ajaxContent {
                width: 800px;
                margin: auto;
                margin-top: 15px;
            }
        </style>
</head>
<body>
</body>
</html>