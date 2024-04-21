<?php
# NOTA: Algunas partes del codigo fueron extraidas del ejemplo de la clase

global $_params, $_version, $_endpoint, $_method, $_header, $_token_get;
include_once '../version1.php';

if ($_version == 'v1' && $_endpoint == 'about-us') {
    switch ($_method) {
        case 'GET':
            if ($_header == $_token_get) {
                include_once '../connection.php';
                include_once 'controller.php';
                $controller = new AboutUsController();

                $abouts = $controller->getAllAbouts();
                foreach ($abouts as $about) {
                    $currName = $about['name'];
                    if ($about['title_esp']) $result[$currName]['titulo']['esp'] = $about['title_esp'];
                    if ($about['title_eng']) $result[$currName]['titulo']['eng'] = $about['title_eng'];
                    if ($about['content_esp']) $result[$currName]['contenido']['esp'] = $about['content_esp'];
                    if ($about['content_eng']) $result[$currName]['contenido']['eng'] = $about['content_eng'];
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