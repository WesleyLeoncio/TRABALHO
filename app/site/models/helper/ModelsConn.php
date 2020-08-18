<?php

namespace Site\models\helper;

use PDO;

if (!defined('URL')) {
    header("Location: /");
    exit();
}

class ModelsConn
{
    public static $host = HOST;
    public static $dbname = DBNAME;
    public static $user = USER;
    public static $pass = PASS;
    public static $conexao = null;

    private static function conectar()
    {
        try {
            if (self::$conexao == null) {
                //echo 'mysql:host=' . self::$host . ';dbname=' . self::$dbname .";charset=utf8" .self::$user ." " .self::$pass;
                self::$conexao = new PDO('mysql:host=' . self::$host . ';dbname=' . self::$dbname . ";charset=utf8", self::$user, self::$pass);
                self::$conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            }
        } catch (PDOException $e) {
            echo "ERROR: " . $e->getMessage();
            die;
        }
        return self::$conexao;
    }

    public function getConn()
    {
        return self::conectar();
    }
}
