<?php


class ContentModel extends coreModel
{
    public function getAllContent($type = null)
    {
        $sql = 'SELECT * FROM content WHERE c_type = ":type"';

        if ($data = $this->manageData($sql, array(':type' => $type)))
        {
            $contents = array();

            foreach ($data as $val)
            {
               $contents[] =  new Content($data);
            }
            return $contents;
        }
        return false;
    }
}

