<?php

require 'config.php';

spl_autoload_register(function($class)
{
    $folder = 'classes';

    if (preg_match('#^[a-z]+model$#i', $class)) $folder = 'models';

    if (preg_match('#^[a-z]+controller$#i', $class)) $folder = 'controllers';

    $file = $folder.DIRECTORY_SEPARATOR.$class.'.php';

    if (file_exists($file)) require $file;
});

$params = array_merge(array('control' => 'home', 'action' => 'default'), $_GET);

$controlName = $params['control'].'Controller';

$control = new $controlName();

$control->setParams($_GET);

$control->callAction($params['action']);















