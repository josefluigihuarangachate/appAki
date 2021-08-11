<?php

include './include/app.php';
include './include/session.php';

$html = '';
$key = input('key');
$idservicio = input('idservicio');

$data = $pdo->select(
        tabla('articulo'),
        [
            'id',
            'nombre_articulo',
            'precio_articulo',
        ],
        [
            'Nombre_Articulo[~]' => $key,
            'Id_Servicio' => $idservicio
        ],
        [
            // Multiple condition.
            "ORDER" => [
                "Nombre_Articulo" => "ASC"
            ]
        ]
);

if ($data) {
    for ($i = 0; $i < count($data); $i++) {
        $html .= '<div><a class="suggest-element" precio="' . $data[$i]['precio_articulo'] . '" flkpak="' . $data[$i]['flkpak_prenda'] . '" data="' . $data[$i]['Nombre_Articulo'] . '" id="' . $data[$i]['id'] . '">' . $data[$i]['Nombre_Articulo'] . '</a></div>';
    }
}
echo $html;
?>