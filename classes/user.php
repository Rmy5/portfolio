<?php


class User
{
    private $_id;
    private $_login;
    private $_lastname;
    private $_firstname;
    private $_mail;
    private $_newsletter;
    private $_rank;



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

    public function getLogin(){return $this->_login;}
    public function setLogin($login){$this->_login = $login;}

    public function getLastname(){return $this->_lastname;}
    public function setLastname($lastname){$this->_lastname = $lastname;}

    public function getFirstname(){return $this->_firstname;}
    public function setFirstname($firstname){$this->_firstname = $firstname;}

    public function getMail(){return $this->_mail;}
    public function setMail($mail){$this->_mail = $mail;}

    public function getNewsletter(){return $this->_newsletter;}
    public function setNewsletter($newsletter){$this->_newsletter = $newsletter;}

    public function getRank(){return $this->_rank;}
    public function setRank($rank){$this->_rank = $rank;}


}






