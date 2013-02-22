<!DOCTYPE html>
<html>
<head>
	<title>
		donia profile
	</title>
	<link rel="stylesheet" type="text/css" href="style.css">
		<script src="jquery-1.9.1.min.js">
				</script>

<script>
$(document).ready(function(){
	 $("#ab").hover(function(){
   	 $(this).css("font-size", "28px");
  });
});
</script>
<script>
$(document).ready(function(){
	 $("#r").hover(function(){
   	 $(this).css("font-size", "28px");
  });
});
</script>
<script>
$(document).ready(function(){
	 $("#s").hover(function(){
   	 $(this).css("font-size", "28px");
  });
});
</script>
<script>
$(document).ready(function(){
	 $("#ab1").hover(function(){
   	 $(this).css("font-size", "28px");
  });
});
</script>
<script>
$(document).ready(function(){
	 $("#r1").hover(function(){
   	 $(this).css("font-size", "28px");
  });
});
</script>
<script>
$(document).ready(function(){
	 $("#ss1").hover(function(){
   	 $(this).css("font-size", "28px");
  });
});
</script>
	<script>
	$(document).ready(function(){
	    // Set the interval to be 3 seconds
	    var t = setInterval(function(){
	        $("#switched").animate({marginLeft:-480},1000,function(){
	            $(this).find("li:last").after($(this).find("li:first"));
	            $(this).css({marginLeft:0});
	        })
	    },3000);
	});
	</script>
</head>
<body>
<div class="img">
	<ul class="l-img" id="switched"><li><img src="IMG-20130218-WA003.jpg" width="300" /></li>
<li><img src="IMG_0707.JPG" width="300" /></li>
<li><img src="IMG_0711.JPG" width="300" height="370"></li>
</ul>
</div>
<h1 class="name">Donia Amer Shaarawy</h1>
<div class="div2">

	<ul class="list">
		<li class="me" id= "ab">About Me:</li>
		 <p id="ab1">I am 19 years, 3rd year BI. I have four sisters. I am a funny person, always motivated. LOVE horses and Travelling &#9786   </p>
		<li class="role" id="r">Role in the Company: </li>
		 <p id="r1">Manager &#9787 </p>
	<li class="skills" id="s">Programming Skills: </li>
	 <ul id="ss1">
	 	<li>Java</li>
	 	<li>HTML</li>
	 	<li>CSS</li>
	 	<li>jQuery</li>
	 	<li>javaScript</li>
	 	<li>&#9788</li>
	 </ul>
</ul>
</div>
<audio controls>
  <source src="song.mp3" type="audio/mp3">
</audio>

</body>
</html>