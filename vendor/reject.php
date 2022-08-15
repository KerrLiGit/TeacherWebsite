<?php
	require "lib.php";

	$mysqli = get_sql_connection();
	$stmt = $mysqli->prepare('DELETE FROM accounts WHERE id = ?');
	$id = $_GET['id'];
	$stmt->bind_param('i', $id);
	if (!$stmt->execute()) {
		//
	}
	else {
		header('Location: ../office.php#confirm');
	}
?>