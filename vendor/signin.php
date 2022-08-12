<?php
	require "lib.php";
	safe_session_start();   	                   	

	$login = $_POST['login'];
	$pass = $_POST['pass'];
	//$pass = md5($_POST['pass']);
	$mysqli = get_sql_connection();
	$stmt = $mysqli->prepare("SELECT a.*, r.descript FROM accounts a LEFT JOIN roles r ON a.role = r.role " .  
					"WHERE login = ? AND password = ?");
	$stmt->bind_param("ss", $login, $pass);
	$stmt->execute();
	$check = $stmt->get_result();
	if (mysqli_num_rows($check) > 0) {	
		$user = $check->fetch_assoc();
		$_SESSION['user'] = [
			"login" => $user['login'],
			"surname" => $user['surname'],
			"name" => $user['name'],
			"secname" => $user['secname'],
			"role" => $user['role'],
			"descript" => $user['descript']
		];
		header('Location: ../index.php');	
	}
	else {
		header('Location: ../signin.php');
		$_SESSION['message-auth'] = 'Неверный пароль!';
	}
?>