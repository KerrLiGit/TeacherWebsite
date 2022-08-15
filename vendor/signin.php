<?php
	require "lib.php";
	safe_session_start();   	                   	

	$login = $_POST['login'];
	$pass = $_POST['pass'];
	//$pass = md5($_POST['pass']);
	$mysqli = get_sql_connection();
	$stmt = $mysqli->prepare("SELECT a.*, c.num, c.lit FROM accounts a LEFT JOIN classes c ON a.class = c.id ". 
		"WHERE a.login = ? AND a.`password` = ? AND a.confirm = 1");
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
			"num" => $user['num'],
		];
		header('Location: ../index.php');
		$_SESSION['message-auth'] = 'Успешный вход.';	
	}
	else {
		header('Location: ../signin.php');
		$_SESSION['message-auth'] = 'Неверный пароль!';
	}
?>