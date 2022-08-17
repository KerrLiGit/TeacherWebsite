<?php
	function safe_session_start() {
		if(!isset($_SESSION))
			session_start(); 
	}

	function get_sql_connection() {
		$mysqli = new mysqli("localhost", "root", "", "teacherbase"); // ���. ���������� ����������
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
		if (!$_SESSION['user'])
			return false;          
		if ($_SESSION['user']['role'] == 'admin' || $_SESSION['user']['role'] == 'teacher') 
			return true;
		return false;
	}

	function student_access($num) {
		if (!$_SESSION['user'])
			return false;                    
		if ($_SESSION['user']['role'] == 'admin' || $_SESSION['user']['role'] == 'teacher') 
			return true;
		/*if ($_SESSION['user']['role'] == 'student' && $num == 0)
			return true;*/
		if ($_SESSION['user']['role'] == 'student' && $_SESSION['user']['num'] == $num)
			return true;
		return false;
	}
?>