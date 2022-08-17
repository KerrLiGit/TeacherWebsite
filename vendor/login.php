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

	$mysqli = get_sql_connection();

	$stmt = $mysqli->prepare("SELECT count(*) FROM accounts WHERE login = ?");
        $stmt->bind_param("s", $login);
	if (!$stmt->execute()) {
		$_SESSION['message-auth'] = "Ошибка сервера. " . $mysqli->error;
		header('Location: ../login.php');
		return;	
	}
	if ($stmt->get_result()->fetch_row()[0] > 0) {
		$_SESSION['message-auth'] = "Такой логин уже существует.";
		header('Location: ../login.php');
		return;
	}

	$stmt = $mysqli->prepare("INSERT INTO accounts (role, login, `password`, surname, name, secname, class) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("ssssssi", $role, $login, $pass, $surname, $name, $secname, $class);
	if (!$stmt->execute()) {
		$_SESSION['message-auth'] = "Ошибка регистрации. " . $mysqli->error;
		header('Location: ../login.php');
		return;
	}
	$_SESSION['message-auth'] = "Успешная регистрация. Ожидайте подтверждения аккаунта учителем." . $mysqli->error;
	header('Location: ../login.php');			
?>
