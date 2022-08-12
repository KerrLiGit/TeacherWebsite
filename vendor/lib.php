<?php
	function safe_session_start() {
		if(!isset($_SESSION))
			session_start(); 
	}

	function get_sql_connection() {
		$mysqli = new mysqli("localhost", "root", "", "teacherbase"); // исп. постоянные соединения
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

	function admin_access() {
		safe_session_start();
		if (!$_SESSION['user'])
			return false;          
		if ($_SESSION['user']['role'] == 'admin' || $_SESSION['user']['role'] == 'teacher') 
			return true;
		return false;
	}

	function student_access($class) {
		safe_session_start();
		if (!$_SESSION['user'])
			return false;                    
		if ($_SESSION['user']['role'] == 'admin' || $_SESSION['user']['role'] == 'teacher') 
			return true;
		if ($_SESSION['user']['role'] == 'student' && $_SESSION['user']['class'] == $class)
			return true;
		return false;
	}
?>