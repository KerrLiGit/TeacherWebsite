<?php
	require "lib.php";

	$mysqli = get_sql_connection();
	$stmt = $mysqli->prepare("SELECT count(*) FROM links WHERE login = ? AND class = ? AND num = ? AND type = ?");
	$login = $_POST['login'];
	$class = $_POST['class'];
	$num = $_POST['num'];
	$type = $_POST['type'];
	$deadline = $_POST['deadline'];
	$stmt->bind_param("siis", $login, $class, $num, $type);
	if (!$stmt->execute()) {
		// ОШИБКА
		return;
	}
	if ($stmt->get_result()->fetch_row()[0] != 0) {
		$stmt = $mysqli->prepare("UPDATE links SET deadline = ? WHERE login = ? AND class = ? AND num = ? AND type = ?");
		$stmt->bind_param("ssiis", $deadline, $login, $class, $num, $type);
		if ($stmt->execute()) {
			header('Location: ..' . $_POST['url']);
		}
	}
	else {
		$stmt = $mysqli->prepare("INSERT INTO links (login, class, num, type, deadline) VALUES (?, ?, ?, ?, ?)");
		$stmt->bind_param("siiss", $login, $class, $num, $type, $deadline);
		if ($stmt->execute()) {
			header('Location: ..' . $_POST['url']);
		}
	}
?>