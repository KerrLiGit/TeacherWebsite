<?php
	require "lib.php";

	$mysqli = get_sql_connection();
	$stmt = $mysqli->prepare('SELECT count(*) FROM topics WHERE class = ? AND num = ? AND type = ?');
	$class = $_POST['class'];
	$num = $_POST['num'];
	$type = $_POST['type'];
	$title = $_POST['title'];
	$subtitle = $_POST['subtitle'];
	$content = $_POST['content'];
	$hidden = $_POST['hidden'];
	$stmt->bind_param('iis', $class, $num, $type);
	if (!$stmt->execute()) {
		echo "0   " . $mysqli->error;
		return;
	}
	if ($stmt->get_result()->fetch_row()[0] == 0) {
		$stmt->prepare('INSERT INTO topics (class, num, type, title, subtitle, content, hidden) VALUES (?, ?, ?, ?, ?, ?, ?)');
		$stmt->bind_param('iisssss', $class, $num, $type, $title, $subtitle, $content, $hidden);
		if (!$stmt->execute()) {
			echo "1   " . $mysqli->error;
			return;
		}
	}
	else {
		$stmt->prepare('UPDATE topics SET title = ?, subtitle = ?, content = ?, hidden = ? WHERE class = ? AND num = ? AND type = ?');
		$stmt->bind_param('ssssiis', $title, $subtitle, $content, $hidden, $class, $num, $type);
		if (!$stmt->execute()) {
			echo $_POST['hidden'] . "++";
			echo "2   " . $mysqli->error;
			return;
		}
	}
	header('Location: ../office.php#create');
?>