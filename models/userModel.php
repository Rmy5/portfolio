<?php


class userModel extends coreModel
{

    public function getUser($id)
    {
        $sql = 'SELECT *, u_rank_fk u_rank FROM user WHERE u_id = :id';

        if ($data = $this->manageData($sql, array(':id' => $id)))
        {
            $user = new User($data);
            return $user;
        }
        return false;
    }
}



