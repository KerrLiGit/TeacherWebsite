<!DOCTYPE html> 
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Сайт Екатерины Анощенковой</title>
	<link rel="stylesheet" href="css\style.css">
	<link rel="stylesheet" href="css\navbar.css">
        <link rel="stylesheet" href="css\learn.css">
	<script src="js\navbar.js"></script>
	<link type="image/x-icon" href="img\back_round.jpg" rel="shortcut icon">
    	<link type="Image/x-icon" href="img\back_round.jpg" rel="icon">
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body onLoad="onResize()">

<menu id="content">
	<div class="box1"><a class="nava" href="index.php"><name style="font-size: 24px;">Екатерина Анощенкова</name><br>учитель&nbsp;математики</a></div>
	<?php
	require "vendor/lib.php";
	safe_session_start();
	if (teacher_access()) {
		echo '<div class="box2" id="box2_1"><a class="nava" href="office.php">Рабочий кабинет</a></div>';
	} 
	?>
	<div class="box2" id="box2_2"><a class="nava">Обучение</a></div>
	<div class="box2" id="box2_3"><a class="nava" href="about.php">Обо мне</a></div>
	<?php 
	if ($_SESSION['user']) {
		echo '<div class="box2" id="box2_4"><a class="nava" href="vendor\signout.php">Выйти</a></div>';
	}
	else {
		echo '<div class="box2" id="box2_4"><a class="nava" href="signin.php">Войти</a></div>';
	}
	?>
	
</menu>

<div class="box1o" id="btno" onclick="openNav()"><b>&#9776;</b></div>  
<div class="box1c" id="btnc" onclick="closeNav()"><b>&times;</b></div>

<div id="unic_content">
	<div class="wrapper">
		<div class="math5">
			<image src="img\learn\learn_math5.png" style="width: 100px;"></image><br>
			<div><a href="learn05math.php" style="font-size: 20px">5 класс<br>Математика</a></div>
		</div>
		<div class="math6">
			<image src="img\learn\learn_math6.png" style="width: 100px;"></image><br>
			6 класс<br> Математика 
		</div>
		<div class="alg7">
			<image src="img\learn\learn_alg7.png" style="width: 100px;"></image><br>
			7 класс<br> Алгебра
		</div>
		<div class="geo7">
			<image src="img\learn\learn_geo7.png" style="width: 100px;"></image><br>
			7 класс<br> Геометрия
		</div>
		<div class="alg8">
			<image src="img\learn\learn_alg8.png" style="width: 100px;"></image><br>
			8 класс<br> Алгебра
		</div>
		<div class="geo8">
			<image src="img\learn\learn_geo8.png" style="width: 100px;"></image><br>
			8 класс<br> Геометрия
		</div>
		<div class="alg9">
			<image src="img\learn\learn_alg9.png" style="width: 100px;"></image><br>
			9 класс<br> Алгебра
		</div>
		<div class="geo9">
			<image src="img\learn\learn_geo9.png" style="width: 100px;"></image><br>
			9 класс<br> Геометрия
		</div>
		<div class="math10">
			<image src="img\learn\learn_math10.png" style="width: 100px;"></image><br>
			10 класс<br> Алгебра и начала<br> математического анализа
		</div>
		<div class="geo10">
			<image src="img\learn\learn_geo10.png" style="width: 100px;"></image><br>
			10 класс<br> Геометрия
		</div>
		<div class="math11">
			<image src="img\learn\learn_math11.png" style="width: 100px;"></image><br>
			11 класс<br> Алгебра и начала<br> математического анализа
		</div>
		<div class="geo11">
			<image src="img\learn\learn_geo11.png" style="width: 100px;"></image><br>
			11 класс<br> Геометрия
		</div>
	</div>
</div>


</body>

</html>