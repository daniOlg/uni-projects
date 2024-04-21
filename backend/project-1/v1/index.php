<?php
# NOTA: Algunas partes del codigo fueron extraidas del ejemplo de la clase
header("Content-Type: application/json; charset=UTF-8");

$host = $_SERVER['HTTP_HOST'];
$version = 'v1';
$endpoints = array(
    'http://'.$host.'/'.$version.'/services',
    'http://'.$host.'/'.$version.'/about-us',
);
$response['endpoints'] = $endpoints;
echo json_encode($response);