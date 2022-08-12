<?php
	require "lib.php";
	safe_session_start();   

	$surname = $_POST['surname'];
	$name = $_POST['name'];
	$secname = $_POST['secname'];
	$class = $_POST['class'];
	$login = $_POST['login'];
	$pass = $_POST['pass'];
	$role = "student";

	echo $surname . " " . $name . " " . $secname . " " . $class . " " . $login . " " . $pass;

	$mysqli = get_sql_connection();
	$stmt = $mysqli->prepare("INSERT INTO accounts (role, login, `password`, surname, name, secname, class) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("ssssssi", $role, $login, $pass, $surname, $name, $secname, $class);
	if (!$stmt->execute()) {
		$_SESSION['message-auth'] = "Ошибка регистрации. " . $mysqli->error;
		header('Location: ../');
		return;
	}
	$_SESSION['message-auth'] = "Успешная регистрация. " . $mysqli->error;
	header('Location: ../index.php');			
?>
