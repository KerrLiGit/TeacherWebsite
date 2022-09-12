<?php
	function safe_session_start() {
		if(!isset($_SESSION))
			session_start(); 
	}

	function get_sql_connection() {
		//$mysqli = new mysqli("localhost", "u133692_root", "root", "u133692_teacherbase"); // исп. постоянные соединения
		$mysqli = new mysqli("localhost", "root", "", "teacherbase");
		//mysqli_report(MYSQLI_REPORT_ALL); 
		$mysqli->query("SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));");
		return $mysqli;
	}

        function session_message($key) {
		safe_session_start();
		$str = "";
		if (array_key_exists($key, $_SESSION)) {
	        	$str = $_SESSION[$key];
		        unset($_SESSION[$key]);
		}
		return $str;
	}

	function teacher_access() {
		if (!array_key_exists('user', $_SESSION))
			return false;          
		if ($_SESSION['user']['role'] == 'admin' || $_SESSION['user']['role'] == 'teacher') 
			return true;
		return false;
	}

	function student_access($num) {
		if (!array_key_exists('user', $_SESSION))
			return false;                    
		if ($_SESSION['user']['role'] == 'admin' || $_SESSION['user']['role'] == 'teacher') 
			return true;
		/*if ($_SESSION['user']['role'] == 'student' && $num == 0)
			return true;*/
		if ($_SESSION['user']['role'] == 'student' && $_SESSION['user']['classnum'] == $num)
			return true;
		return false;
	}
?>