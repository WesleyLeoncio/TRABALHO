<?php
session_start(); // inicializando a sessão
ob_start(); // limpa o buffer de redirecionamento

// url padrao do site
define('URL', 'http://127.0.0.1/projetobase/');
define('URLADM', 'http://127.0.0.1/projetobase/adm/');

//127.0.0.1/projetobase/AdmAuth/auth


// controller e métodos padrão
define('CONTROLLER', 'Home');
define('METHOD', 'index');
define('ERROR404', 'Error404');

//Dados de acesso ao BD
define('HOST', 'localhost:3306');
define('USER', 'root');
define('PASS', '');
define('DBNAME', 'bd');




/*
// função para importar automaticamente as classes
//function __autoload($Class) {
    spl_autoload_register(function($Class) {
    $dirName = array(
        'Config',
        'Controllers',
        'Models',
        'Models/helper',
        'Views'
    );
    foreach ($dirName as $diretorios) {
        if (file_exists("{$diretorios}/{$Class}.php")) {
            require("{$diretorios}/{$Class}.php");
        }
    }
});
*/