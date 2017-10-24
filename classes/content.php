<?php

class Content
{

    private $_id;
    private $_type;
    private $_title;
    private $_content;
    private $_link;
    private $_user;
    private $_images;

    public function __construct(array $data)
    {
       $this->hydrate($data);
    }

    public function hydrate(array $data)
    {
        foreach ($data as $key => $val)
        {
            $key = substr($key, 2);
            $method = 'set'.ucfirst($key);

            if (method_exists($this, $method)) $this->$method($val);
        }
    }

    public function getId(){return $this->_id;}
    public function setId($id){$this->_id = $id;}

    public function getType(){return $this->_type;}
    public function setType($type){$this->_type = $type;}

    public function getTitle(){return $this->_title;}
    public function setTitle($title){$this->_title = $title;}

    public function getContent(){return $this->_content;}
    public function setContent($content){$this->_content = $content;}

    public function getLink(){return $this->_link;}
    public function setLink($link){$this->_link = $link;}

    public function getUser(){return $this->_user;}
    public function setUser($user){$this->_user = $user;}

    public function getImages(){return $this->_images;}
    public function setImages($images){$this->_images = $images;}

}







