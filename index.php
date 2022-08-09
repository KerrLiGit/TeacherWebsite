<!DOCTYPE html> 
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Сайт Екатерины Анощенковой</title>
	<link rel="stylesheet" href="css\style.css">
	<link rel="stylesheet" href="css\navbar.css">
        <link rel="stylesheet" href="css\index.css">
	<script src="js\navbar.js"></script>
	<link type="image/x-icon" href="img\back_round.jpg" rel="shortcut icon">
    	<link type="Image/x-icon" href="img\back_round.jpg" rel="icon">
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body onLoad="onResize()">

<menu id="content">
	<div class="box1"><a><name style="font-size: 24px;">Екатерина Анощенкова</name><br>учитель&nbsp;математики</a></div>
	<div class="box2" id="box2_1"><a href="learning_activities.html">Обучение</a></div>
	<div class="box2" id="box2_2"><a href="extracurricular_activities.html">Подготовка&nbsp;к<br>олимпиадам</a></div>
	<div class="box2" id="box2_3"><a href="preparation_for_the_exam.html">Подготовка&nbsp;к<br>ОГЭ/ЕГЭ</a></div>
	<div class="box2" id="box2_4"><a href="certificates.html">Обо мне</a></div>
</menu>

<div class="box1o" id="btno" onclick="openNav()"><b>&#9776;</b></div>  
<div class="box1c" id="btnc" onclick="closeNav()"><b>&times;</b></div>

<div class="image_block">
	<image class="back_image" src="img\back.png"></image>
</div>

<div id="unic_content">
	<div class="main_wrapper">
		<div class="main_photo">
			<image src="img\main_photo.jpg" id="adapt_image"></image>
		</div>
		<div class="main_text">
			<div id="name" style="font-size: 40px;">Анощенкова<br>Екатерина Васильевна</div>
			<div id="name"style=" margin-top: 0px;">учитель математики</div>
			<div style="margin-top: 30px;">
				Приветствую всех, кто интересуется математикой.
			</div>
			<div>
				Этот сайт посвящен любым разделам школьной математики. Здесь вы найдете объяснение тем с 5 по 11 класс. 
				Это видеоуроки, конспекты, тесты и тренажеры. Изложенная информация поможет изучить ту или иную тему, 
				если вы пропустили урок, быстро повторить материал перед зачетом, контрольной работой или подготовиться к 
				предстоящим экзаменам.
			</div>
			<div style="margin-top: 30px;">
				Если вы интересуетесь логическими задачами, или вам интересно искать выход в казалось бы безвыходной ситуации, 
				то обратите внимание на олимпиадные задачи.
			</div>
			<div style="margin-top: 30px;">
				Решение этих задач развивает мышление, умение объяснять ход своих мыслей и доказывать правильность своих выводов.
			</div>
			<div style="margin-top: 30px;">
				Надеюсь, посещение данного сайта откроет вам новые грани математики. Математика – это всего лишь модель, идеальная 
				среда для тренировки ума. А умение мыслить применимо в любой области знаний.
			</div>
		</div>
		<div class="main_footer" style="font-size: 12px;">
			<p>(С) <span class="fio">Екатерина Васильевна Анощенкова</span>, <address>Россия, Саранск</address></p>
		</div>
	</div>
</unic_content>


</body>

</html>