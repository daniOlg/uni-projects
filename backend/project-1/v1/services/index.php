<?php
# NOTA: Algunas partes del codigo fueron extraidas del ejemplo de la clase
global $_params, $_version, $_endpoint, $_method, $_header, $_token_get;
include_once '../version1.php';

if ($_version == 'v1' && $_endpoint == 'services') {
    switch ($_method) {
        case 'GET':
            if ($_header == $_token_get) {
                include_once '../connection.php';
                include_once 'controller.php';
                $controller = new ServicesController();

                $result = [];
                $services = $controller->getAllServices();
                foreach ($services as $service) {
                    $s['id'] = intval($service['id']);
                    if ($service['title_esp']) $s['titulo']['esp'] = $service['title_esp'];
                    if ($service['title_eng']) $s['titulo']['eng'] = $service['title_eng'];
                    if ($service['text_esp']) $s['texto']['esp'] = $service['text_esp'];
                    if ($service['text_eng']) $s['texto']['eng'] = $service['text_eng'];
                    $s['activo'] = $service['activo'] ? true : false;
                    $result[] = $s;
                }

                http_response_code(200);
                echo json_encode(['data' => $result]);
            } else {
                http_response_code(401);
                echo json_encode(['error' => 'No tiene autorizacion']);
            }
            break;
        default:
            http_response_code(405);
            echo json_encode(['error' => 'Metodo no permitido']);
            break;
    }
}