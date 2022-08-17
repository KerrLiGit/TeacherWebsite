<?php
	require "lib.php";

	$mysqli = get_sql_connection();
	$stmtclass = $mysqli->prepare('SELECT a.login FROM accounts a 
		LEFT JOIN classes c ON a.class = c.id WHERE a.confirm = 1 and a.role = "student" AND a.class = ?');
	$classid = $_POST['classid'];
	$stmtclass->bind_param("i", $classid);
	if (!$stmtclass->execute()) {
		// ОШИБКА
		return;
	}
	$res = $stmtclass->get_result();
	$login = $res->fetch_row()[0];
	$class = $_POST['class'];
	$num = $_POST['num'];
	$type = $_POST['type'];
	$deadline = $_POST['deadline'];
	while ($login) {
		$stmt = $mysqli->prepare("SELECT deadline FROM links WHERE login = ? AND class = ? AND num = ? AND type = ?");
		$stmt->bind_param("siis", $login, $class, $num, $type);
		if (!$stmt->execute()) {
			// ОШИБКА
			return;
		}
		if ($stmt->get_result()->fetch_row()[0]) {
			$stmt = $mysqli->prepare("UPDATE links SET deadline = ? WHERE login = ? AND class = ? AND num = ? AND type = ?");
			$stmt->bind_param("ssiis", $deadline, $login, $class, $num, $type);
			if ($stmt->execute()) {
				//header('Location: ..' . $_POST['url']);
			}
		}
		else {
			$stmt = $mysqli->prepare("INSERT INTO links (login, class, num, type, deadline) VALUES (?, ?, ?, ?, ?)");
			$stmt->bind_param("siiss", $login, $class, $num, $type, $deadline);
			if ($stmt->execute()) {
				//header('Location: ..' . $_POST['url']);
			}
		}
		$login = $res->fetch_row()[0];
	}
	header('Location: ..' . $_POST['url']);
?>