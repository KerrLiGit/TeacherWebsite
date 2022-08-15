<?php
require "vendor/lib.php";
safe_session_start();
if (!student_access(5)) {
	header('Location: /learn.php');
	$_SESSION['message'] = 'Отказано в доступе: несоответствие уровня доступа.';
}
?>

<!DOCTYPE html> 
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Сайт Екатерины Анощенковой</title>
	<link rel="stylesheet" href="css\style.css">
	<link rel="stylesheet" href="css\navbar.css">
        <link rel="stylesheet" href="css\anchor.css">       
	<script src="js\navbar.js"></script>
	<link type="image\x-icon" href="img\back_round.jpg" rel="shortcut icon">
    	<link type="Image\x-icon" href="img\back_round.jpg" rel="icon">
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body onLoad="onResize()">

<menu id="content">
	<div class="box1"><a class="nava" href="index.php"><name style="font-size: 24px;">Екатерина Анощенкова</name><br>учитель&nbsp;математики</a></div>
	<?php                
	if (teacher_access()) {
		echo '<div class="box2" id="box2_1"><a class="nava" href="office.php">Рабочий кабинет</a></div>';
	} 
	?>
	<div class="box2" id="box2_2"><a class="nava" href="learn.php">Обучение</a></div>
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
	<div class="anchor_wrapper">
		<nav><div class="anchor_menu" id="anchor_content">
			<div><a id="panel" href="#lesson001" style="font-size: 18px; margin-bottom: 10px;">Урок 1</a></div>
			<div><a id="panel" href="#lesson002" style="font-size: 18px; padding-bottom: 10px;">Урок 2</a></div>
			<div><a id="panel" href="#lesson003" style="font-size: 18px; padding-bottom: 10px;">Урок 3</a></div>
		</div></nav>
		<div class="anchor_main">
			<a class="anchor" id="lesson001"></a>
				<article>Урок 1</article>
				<div style="padding-bottom: 10px;">
					Сюда можно вставить текст.
					Или ссылку: <a href="https://google.com">GOOGLE</a>
				</div>
				<div style="padding-bottom: 10px;">
					&nbsp;&nbsp;<span class="checkmark">&check;</span>&nbsp;
					А тут текст с галочкой.
				</div>
			<a class="anchor" id="lesson002"></a>
				<article>Урок 2</article>
				<div style="padding-bottom: 10px;">
					Тут то же самое.
				</div>
			<a class="anchor" id="lesson003"></a>
				<article>Урок 3</article>
				<div style="padding-bottom: 10px;">
					И тут...
				</div>
		</div>
		<div class="anchor_button"></div>
	</div>
</div>


</body>

</html>