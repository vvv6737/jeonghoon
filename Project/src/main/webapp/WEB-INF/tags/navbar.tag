<%@ tag language="java" pageEncoding="UTF-8"%>
<style>
/* 네비게이션 바 */
.margin {
	margin-bottom: 45px;
}
.bg-1 {
	background-color: #1abc9c; /* Green */
	color: #ffffff;
}
.bg-2 {
	background-color: #474e5d; /* Dark Blue */
	color: #ffffff;
}
.bg-3 {
	background-color: #ffffff; /* White */
	color: #555555;
}
.bg-4 {
	background-color: #2f2f2f; /* Black Gray */
	color: #fff;
}
.container-fluid {
	padding-top: 70px;
	padding-bottom: 70px;
}
.navbar {
	padding-top: 1px;
	padding-bottom: 1px;
	border: 0;
	border-radius: 0;
	margin-bottom: 0;
	font-size: 12px;
	letter-spacing: 5px;
}
.navbar-nav  li a:hover {
	color: #1abc9c !important;
}

/* 드롭 서치 */
.dropbtn {
background-color: #f6f6f6;
color: 808080;
padding: 16px;
font-size: 12px;
border: none;
cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
  background-color: #1abc9c;
  color : white;
}

#myInput {
  box-sizing: border-box;
  background-image: url('searchicon.png');
  background-position: 14px 12px;
  background-repeat: no-repeat;
  font-size: 16px;
  padding: 14px 20px 12px 45px;
  border: none;
  border-bottom: 1px solid #ddd;
}

#myInput:focus {outline: 3px solid #ddd;}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f6f6f6;
  min-width: 230px;
  overflow: auto;
  border: 1px solid #ddd;
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}
.dropdown a:hover {background-color: #ddd;}
.show {display: block;}



</style>
<nav class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/member/main">MAIN</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">TOP</a></li>
				<li><a href="#">BUTTOM</a></li>
				<li><a href="#">ACC</a></li>
				<li><a href="/board/list">BOARD</a></li>
				<li><a href="/member/login">MEMBER</a></li>
				<li>
				<div class="dropdown">
				  <button onclick="myFunction()" class="dropbtn">SEARCH</button>
				  <div id="myDropdown" class="dropdown-content">
				    <input type="text" placeholder="Search.." id="myInput" onkeyup="filterFunction()">
				    <a href="#">TOP</a>
				    <a href="#">BUTTOM</a>
				    <a href="#">ACC</a>
				    <a href="/board/list">BOARD</a>
				    <a href="/member/login">MEMBER</a>
				    <a href="#about">About</a>
				    <a href="#base">Base</a>
				    <a href="#blog">Blog</a>
				    <a href="#contact">Contact</a>
				    <a href="#custom">Custom</a>
				    <a href="#support">Support</a>
				    <a href="#tools">Tools</a>
				  </div>
				</div>
				</li>
			</ul>
		</div>
	</div>
	
<script>
/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}
function filterFunction() {
  var input, filter, ul, li, a, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  div = document.getElementById("myDropdown");
  a = div.getElementsByTagName("a");
  for (i = 0; i < a.length; i++) {
    txtValue = a[i].textContent || a[i].innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      a[i].style.display = "";
    } else {
      a[i].style.display = "none";
    }
  }
}
</script>

</nav>