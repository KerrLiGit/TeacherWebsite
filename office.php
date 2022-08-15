<?php
require "vendor/lib.php";
safe_session_start();
if (!teacher_access()) {
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
	<link rel="stylesheet" href="css\cboard.css">
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
		echo '<div class="box2" id="box2_1"><a class="nava">Рабочий кабинет</a></div>';
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
			<?php
			$mysqli = get_sql_connection();
			$stmt = $mysqli->query("SELECT a.id FROM accounts a, classes c WHERE a.confirm = false AND a.class = c.id");
			$student = $stmt->fetch_row();
			if ($student[0]) {
				echo '<div><a id="panel" href="#confirm" style="font-size: 18px; margin-bottom: 10px;">Подтверждение регистрации</a></div>';
			}
			?>
			<div><a id="panel" href="#outclass" style="font-size: 18px; padding-bottom: 10px;">Список классов</a></div>
			<div><a id="panel" href="#create" style="font-size: 18px; padding-bottom: 10px;">Создание урока</a></div>
		</div></nav>
		<div class="anchor_main">
			<?php
			$mysqli = get_sql_connection();
			$stmt = $mysqli->query("SELECT a.surname, a.name, a.secname, c.num, c.lit, a.id FROM accounts a, classes c WHERE a.confirm = false AND a.class = c.id");
			$student = $stmt->fetch_row();
			if ($student[0]) {
				echo '<a class="anchor" id="confirm"></a>';
				echo '<article>Подтверждение регистрации</article>';
				echo '<a class="anchor" id="confirm"></a>';
				echo '<table class="cboard">';
				$flag = 0;
				while ($student) {
					if ($flag % 2 == 0) {
						echo '<tr class="blue">';
					}
					else {
						echo '<tr class="white">';
					}
					$flag++;
					echo '<td>' . $student[0] . ' ' . $student[1] . ' ' . $student[2] . '</td>';
					echo '<td>' . $student[3] . $student[4] . ' класс</td>';
					echo '<td><a href="vendor/confirm.php?id=' . $student[5] . '">&nbsp;&check;&nbsp;</a></td>';
					echo '<td><a href="vendor/reject.php?id=' . $student[5] . '">&nbsp;&cross;&nbsp;</a></td>'; 
					echo '</tr>';
					$student = $stmt->fetch_row();
				}
				echo '</table>';
			}
			?>
			<a class="anchor" id="outclass"></a>
				<article>Список классов</article>
				<div style="padding-bottom: 10px;">
					<form action="vendor/getclassid.php" method="post">
						<label>Класс</label>
						<label>
							<select name="class" required>
								<option></option>
								<?php
								$mysqli = get_sql_connection();
								$result = $mysqli->query("SELECT * FROM classes");
								foreach ($result as $res) {
									echo '<option value=' . $res['id'] . '>' . $res['num'] . $res['lit'] . '</option>';				
								}
								?>
							</select>
						</label>
						<button type="submit" title="Вывести список класса">Вывести</button>
						<label class="message"><?php echo session_message("message-outclass"); ?></label>
					</form>
				</div>
				<div style="padding-bottom: 10px;">
					<?php 
					if ($_GET) {
						$classid = $_GET['classid'];
						$mysqli = get_sql_connection();
						$stmt = $mysqli->prepare('SELECT num, lit FROM classes WHERE id = ?');
						$stmt->bind_param('i', $classid);
						if ($stmt->execute()) {
							$result = $stmt->get_result();
							$class = $result->fetch_row();
							echo $class[0] . $class[1] . ' класс';
						}
						else {
							echo 'Техническая ошибка: ' . $mysqli->error;
						}
						$stmt = $mysqli->prepare('SELECT surname, name, secname FROM accounts WHERE class = ? AND confirm = true');
						$stmt->bind_param('i', $classid);
						if ($stmt->execute()) {
							$result = $stmt->get_result();
							$student = $result->fetch_row();           
							$flag = 0;
							echo '<table class="cboard">';
							while ($student) {
								if ($flag % 2 == 0) {
									echo '<tr class="blue">';
								}
								else {
									echo '<tr class="white">';
								}
								$flag++;
								echo '<td>' . $student[0] . ' ' . $student[1] . ' ' . $student[2] . '</td>';
								$student = $result->fetch_row();
							}				
							echo '</table>';
						}
						else {
							echo 'Техническая ошибка: ' . $mysqli->error;
						}
					}
					?>
				</div>
			<a class="anchor" id="another"></a>
				<article>Создание урока</article>
				<div style="padding-bottom: 10px;">
					И тут...
				</div>
		</div>
		<div class="anchor_button"></div>
	</div>
</div>


</body>

</html>