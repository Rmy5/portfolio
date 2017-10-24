<?php

class coreController
{

    private $_params = array();
    private $_data = array();
    private $_model;

    public function __construct()
    {
        $name = get_class($this);
        $name = substr($name,0,-10);
        $model = $name.'Model';
        $this->_model = new $model();
    }

    public function getModel()
    {
        return $this->_model;
    }

    public function getParams($key = null)
    {
        if (is_null($key)) return $this->_params;
        return $this->_params[$key];
    }


    public function setParams(array $params)
    {
        $this->_params = $params;
    }


    public function callAction($name)
    {
        $action = lcfirst(ucwords(strtolower($name))).'Action';

        if (method_exists($this, $action)) $this->$action();
    }

}