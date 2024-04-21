<?php
# NOTA: Algunas partes del codigo fueron extraidas del ejemplo de la clase

$_scheme = $_SERVER['REQUEST_SCHEME'];
$_location = $_SERVER['HTTP_HOST'];
$_method = $_SERVER['REQUEST_METHOD'];
$_path = $_SERVER['REQUEST_URI'];

$_parts = explode('/', $_path);
$_version = $_location == 'localhost' ? $_parts[1] : null;
$_endpoint = $_location == 'localhost' ? $_parts[2] : null;

header("Access-Control-Allow-Origin: *");
header("Access-Control-ALlow-Methods: GET, POST, PUT, PATH, DELETE");
header("Content-Type: application/json; charset=UTF-8");

//Authorization Bearer
$_header = isset(getallheaders()['Authorization']) ? getallheaders()['Authorization'] : null;

//Tokens
$_token_get = 'Bearer get';
$_token_post = 'Bearer post';
$_token_put = 'Bearer put';
$_token_patch = 'Bearer patch';
$_token_delete = 'Bearer delete';