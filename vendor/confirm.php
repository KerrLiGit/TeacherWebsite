<?php
	require "lib.php";

	$mysqli = get_sql_connection();
	$stmt = $mysqli->prepare('UPDATE accounts SET confirm = 1 WHERE id = ?');
	$id = $_GET['id'];
	$stmt->bind_param('i', $id);
	if (!$stmt->execute()) {
		//
	}
	else {
		header('Location: ../office.php#confirm');
	}
?>