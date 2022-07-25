<?php

    session_start();
	session_unset();
	header('Location: login-form.php');
	exit();
?>