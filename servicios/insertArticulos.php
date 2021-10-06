<?php

$data = 'hello';
$output = shell_exec("py rc_soft.py " . $data);
echo $output;
die();

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "dbaki";
$tabla = "articulo";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$stm = '
244#Costura                                                                                             #ABRIGO ENTALLE COSTADOS                                     #25@								
245#Costura                                                                                             #ABRIGO SUBIR BASTA                                          #20@								
246#Costura                                                                                             #ABRIGO SUBIR PUÑOS                                          #15@								
415#Costura                                                                                             #ARREGLO APLICACION                                          #15@								
426#Costura                                                                                             #ARREGLO DE CORTINA                                          #15@								
249#Costura                                                                                             #ARREGLO GRANDE                                              #12@								
247#Costura                                                                                             #ARREGLO PEQUEÑO                                             #10@								
416#Costura                                                                                             #BASTA CON ELASTICO                                          #15@								
393#Costura                                                                                             #BERMUDA CERRAR COSTURA                                      #10@								
252#Costura                                                                                             #BLUSA BASTA SIMPLE                                          #12@								
251#Costura                                                                                             #BLUSA ENTALLE + BASTA                                       #20@								
417#Costura                                                                                             #BLUSA ENTALLE LADOS                                         #12@								
253#Costura                                                                                             #BLUSA SUBIR PUÑOS                                           #12@								
259#Costura                                                                                             #CAMISA ACORTAR MANGA                                        #10@								
260#Costura                                                                                             #CAMISA ARREGLO BOLSILLO                                     #12@								
255#Costura                                                                                             #CAMISA ARREGLO DE CUELLO                                    #15@								
256#Costura                                                                                             #CAMISA ENTALLE COSTADO                                      #18@								
257#Costura                                                                                             #CAMISA SUBIR BASTA                                          #15@								
422#Costura                                                                                             #CAMISA SUBIR PUÑO MAS YUGO                                  #20@								
258#Costura                                                                                             #CAMISA SUBIR PUÑOS                                          #16@								
254#Costura                                                                                             #CAMISA VOLTEAR CUELLO                                       #20@								
419#Costura                                                                                             #CASACA BOLSILLO DESCOSIDO                                   #10@								
421#Costura                                                                                             #CASACA CAMBIO CIERRE PLASTICO/METAL                         #20@								
418#Costura                                                                                             #CASACA DESCOSIDO                                            #12@								
420#Costura                                                                                             #CASACA FORRO DESCOSIDO                                      #15@								
423#Costura                                                                                             #CHAQUETA CAMBIO CIERRE                                      #15@								
425#Costura                                                                                             #CIERRE ARREGLO DE CARRITO                                   #8@								
424#Costura                                                                                             #CIERRE CAMBIO MANDIL                                        #15@								
400#Costura                                                                                             #CONFECCION BOLSA TELA 35X30                                 #5.9@								
261#Costura                                                                                             #CORBATA ARREGLO COSTURA 1                                   #10@								
394#Costura                                                                                             #CORBATA ARREGLO COSTURA 2                                   #15@								
467#Costura                                                                                             #COSTURA GRANDE                                              #15@								
464#Costura                                                                                             #COSTURA MEDIANO                                             #12@								
466#Costura                                                                                             #COSTURA PEQUEÑA                                             #10@								
427#Costura                                                                                             #CUBRECAMA DESCOSIDO                                         #12@								
428#Costura                                                                                             #CUBRECAMA PARCHE                                            #12@								
429#Costura                                                                                             #EDREDON DESCOSIDO                                           #15@								
430#Costura                                                                                             #EDREDON PARCHE                                              #12@								
431#Costura                                                                                             #MANTEL DESCOSIDO                                            #15@								
269#Costura                                                                                             #PANTALON BASTA CORTA                                        #15@								
267#Costura                                                                                             #PANTALON BASTA INGLESA                                      #18@								
266#Costura                                                                                             #PANTALON BASTA SIMPLE                                       #15@								
262#Costura                                                                                             #PANTALON CAMBIO CIERRE                                      #12@								
395#Costura                                                                                             #PANTALON CAMBIO CIERRE INVISIBLE                            #15@								
434#Costura                                                                                             #PANTALON CAMBIO ELASTICO                                    #15@								
268#Costura                                                                                             #PANTALON CERRAR COSTURA                                     #8@								
435#Costura                                                                                             #PANTALON ELASTICO NIÑO                                      #10@								
263#Costura                                                                                             #PANTALON ENTALLE CINTURA                                    #15@								
432#Costura                                                                                             #PANTALON ENTALLE CINTURA MAS TIRO                           #15@								
264#Costura                                                                                             #PANTALON ENTALLE COSTADO                                    #15@								
265#Costura                                                                                             #PANTALON ENTALLE COSTADO + BASTA                            #20@								
433#Costura                                                                                             #PANTALON JEAN BASTA CORTA CONVERTIR DE LARGO A CORTO        #15@								
270#Costura                                                                                             #PANTALON PARCHE                                             #12@								
469#Costura                                                                                             #PARCHE GRANDE                                               #20@								
465#Costura                                                                                             #PARCHE MEDIANO                                              #15@								
468#Costura                                                                                             #PARCHE PEQUEÑO                                              #10@								
436#Costura                                                                                             #PELUCHE ARREGLO                                             #12@								
272#Costura                                                                                             #POLO ARREGLO COSTURA                                        #12@								
273#Costura                                                                                             #POLO BASTA                                                  #10@								
271#Costura                                                                                             #POLO NIÑO ARREGLO COSTURA                                   #8@								
439#Costura                                                                                             #SABANA ARREGLO                                              #15@								
438#Costura                                                                                             #SACO COSTURA FORRO                                          #15@								
437#Costura                                                                                             #SACO SACONES ABRIGOS DESCOSIDO                              #15@								
274#Costura                                                                                             #SACO SUBIR PUÑOS                                            #15@								
396#Costura                                                                                             #SHORT BASTA SIMPLE                                          #10@								
276#Costura                                                                                             #VESTIDO BASTA (CON FORRO)                                   #18@								
275#Costura                                                                                             #VESTIDO BASTA (SIN FORRO)                                   #15@								
399#Costura                                                                                             #VESTIDO CAMBIO CIERRE INVISIBLE                             #18@								
440#Costura                                                                                             #VESTIDO DE NOCHE BASTA SIMPLE                               #18@								
397#Costura                                                                                             #VESTIDO ENTALLE LADOS                                       #15@								
277#Costura                                                                                             #VESTIDO ENTALLE LADOS + TIRAS                               #28@								
470#Costura                                                                                             #VESTIDO FIESTA BASTA                                        #18@								
392#Costura                                                                                             #VESTIDO FIESTA BASTA + VUELO                                #25@								
441#Costura                                                                                             #VESTIDO NIÑA ARREGLO                                        #12@								
398#Costura                                                                                             #VESTIDO SUBIR TIRAS                                         #10@								
442#Costura                                                                                             #ZURCIDO                                                     #50@								
';

$exparroba = explode("@", $stm);

if ($exparroba) {
    $sql = "";
    $okey = [];
    $error = [];
    for ($f = 0; $f < count($exparroba); $f++) {
        try {
            if (
                    @$sep[0] &&
                    @$sep[1] &&
                    @$sep[2] &&
                    @$sep[3]
            ) {
                $sep = array_map('trim', explode("#", $exparroba[$f]));
                $sql .= "INERT INTO articulo (id,nombre_articulo,codigo_articulo,precio_articulo,Id_Servicio) ";
                $sql .= "VALUES(" . trim($sep[0]) . " , '" . trim($sep[2]) . "' , '" . trim($sep[0]) . " ' , '" . trim($sep[3]) . "',(SELECT id FROM servicio WHERE Nombre_Servicio = '" . ucwords(strtolower(trim($sep[1]))) . "' LIMIT 1)) ";
                $sql .= "ON DUPLICATE KEY UPDATE id = " . trim($sep[0]) . ";";
                $okey[] = trim($sep[0]);
            }
        } catch (Throwable $t) {
            $error[] = $sep;
        }
    }
}

if ($conn->multi_query($sql) === TRUE) {
    echo "<pre>";
    print_r($okey);
    echo "</pre>";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>