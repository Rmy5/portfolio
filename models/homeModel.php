<?php


class homeModel extends coreModel
{

    public function getUser($id)
    {
        $uModel = new userModel();
        $user = $uModel->getUser($id);
        return $user;
    }

//    public function
}