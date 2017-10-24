<?php

class coreModel
{
    private static $_pdo;

    public function __construct()
    {
        try
        {
            self::$_pdo = new PDO(DSN, USER, PASS);
            self::$_pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }
        catch (exception $e)
        {
            die('Erreur' . $e->getMessage());
        }
    }


    protected function manageData($sql, $params = array(), $requestType = null, $fetchStyle = PDO::FETCH_ASSOC)
    {
        $request = false;

        if (count($params) == 0) $request = self::$_pdo->query($sql);

        else
        {
            $request = self::$_pdo->prepare($sql);

            foreach ($params as $placeholder => $value)
            {
                $request->bindValue($placeholder, $value);
            }
            $request->execute();
        }

        if (is_null($requestType))
        {
            $data = $request->fetchAll();
            $data = $data[0];
            return $data;
        }
        $request->closeCursor();

        return $request;
    }
}












