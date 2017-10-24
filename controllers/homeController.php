<?php

class homeController extends coreController
{

    public function defaultAction()
    {
        $user = $this->getModel()->getUser(2);

        include 'views'.DIRECTORY_SEPARATOR.'home'.DIRECTORY_SEPARATOR.'default.php';
    }
}