<?php

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
2#Agua                                                                                                #ABRIGO  NIÑO                                                #15@
3#Agua                                                                                                #ALMOHADA                                                    #10@
169#Agua                                                                                                #ALMOHADA  PLUMAS                                            #15@
4#Agua                                                                                                #ALMOHADA GRANDE                                             #15@
226#Agua                                                                                                #ALMOHADA GRANDE  PLUMAS                                     #20@
5#Agua                                                                                                #BABUCHAS                                                    #10@
6#Agua                                                                                                #BABUCHAS  NIÑO                                              #8@
294#Agua                                                                                                #BANDERA                                                     #12@
215#Agua                                                                                                #BATA  NIÑO                                                  #10@
443#Agua                                                                                                #BERMUDA NIÑO                                                #5@
9#Agua                                                                                                #BOLSA  DORMIR                                               #35@
15#Agua                                                                                                #BUZO  NIÑO (CASA-PANT)                                      #12@
14#Agua                                                                                                #BUZO (CASA-PANT)                                            #15@
346#Agua                                                                                                #CAMISA NIÑO                                                 #7@
176#Agua                                                                                                #CARTERA CUERO SINTETICO                                     #25@
25#Agua                                                                                                #CARTERA TEXTIL                                              #20@
19#Agua                                                                                                #CASACA                                                      #13@
20#Agua                                                                                                #CASACA  ACOLCHADA                                           #17@
21#Agua                                                                                                #CASACA  IMPERMEABLE                                         #25@
22#Agua                                                                                                #CASACA  PLUMAS                                              #25@
385#Agua                                                                                                #CASACA ACOLCHADA LARGA                                      #23@
375#Agua                                                                                                #CASACA CUERO SINTETICO                                      #35@
228#Agua                                                                                                #CASACA JEAN                                                 #13@
233#Agua                                                                                                #CASACA NIÑO                                                 #10@
237#Agua                                                                                                #CHOMPA NIÑO                                                 #8@
341#Agua                                                                                                #COBERTOR SILLA BEBE                                         #15@
27#Agua                                                                                                #COJIN  ANATÓMICO                                            #18@
26#Agua                                                                                                #COJIN CHICO                                                 #8@
411#Agua                                                                                                #COJIN CHICO FORRO                                           #8@
410#Agua                                                                                                #COJIN GRANDE                                                #16@
413#Agua                                                                                                #COJIN GRANDE FORRO                                          #12@
180#Agua                                                                                                #COJIN MEDIANO                                               #10@
412#Agua                                                                                                #COJIN MEDIANO FORRO                                         #10@
30#Agua                                                                                                #COLCHA  MEDINA                                              #17@
29#Agua                                                                                                #COLCHA GRANDE                                               #20@
28#Agua                                                                                                #COLCHA PEQUEÑA                                              #13@
285#Agua                                                                                                #CORSET                                                      #18@
33#Agua                                                                                                #CORTINA CENEFA (METRO)                                      #8@
182#Agua                                                                                                #CORTINA TAPASOL (METRO)                                     #10@
243#Agua                                                                                                #CORTINA TAPASOL DOBLE (METRO                                #15@
31#Agua                                                                                                #CORTINA TUL (METRO)                                         #8@
36#Agua                                                                                                #CUBRECAMA  1 1/2 PLAZA                                      #27@
37#Agua                                                                                                #CUBRECAMA  2 PLAZA                                          #30@
39#Agua                                                                                                #CUBRECAMA  KING                                             #50@
38#Agua                                                                                                #CUBRECAMA  QUEEN                                            #40@
47#Agua                                                                                                #EDREDON 1 1/2 PLAZA                                         #30@
48#Agua                                                                                                #EDREDON 2 PLAZA                                             #35@
312#Agua                                                                                                #EDREDON CUNA                                                #18@
50#Agua                                                                                                #EDREDON KING                                                #50@
51#Agua                                                                                                #EDREDON PLUMAS 1 1/2 PLAZA                                  #45@
52#Agua                                                                                                #EDREDON PLUMAS 2 PLAZA                                      #50@
54#Agua                                                                                                #EDREDON PLUMAS KING                                         #65@
53#Agua                                                                                                #EDREDON PLUMAS QUEEN                                        #55@
49#Agua                                                                                                #EDREDON QUEEN                                               #40@
281#Agua                                                                                                #ENTERIZO NIÑO                                               #15@
445#Agua                                                                                                #FALDA NIÑA                                                  #6@
65#Agua                                                                                                #FRAZADA 1 1/2 PLAZA                                         #18@
66#Agua                                                                                                #FRAZADA 2 PLAZA                                             #23@
68#Agua                                                                                                #FRAZADA KING                                                #55@
67#Agua                                                                                                #FRAZADA QUEEN                                               #45@
61#Agua                                                                                                #FUNDA ALMOHADA                                              #5@
186#Agua                                                                                                #FUNDA ALMOHADA GRANDE                                       #7@
334#Agua                                                                                                #FUNDA MUEBLE (1 CUERPO)                                     #20@
335#Agua                                                                                                #FUNDA MUEBLE (2 CUERPOS)                                    #30@
336#Agua                                                                                                #FUNDA MUEBLE (3 CUERPOS)                                    #40@
313#Agua                                                                                                #FUNDA PLUMON 1 1/2 PLZ.                                     #15@
62#Agua                                                                                                #FUNDA PLUMON 2 PLZ.                                         #18@
64#Agua                                                                                                #FUNDA PLUMON KING                                           #22@
63#Agua                                                                                                #FUNDA PLUMON QUEEN                                          #20@
345#Agua                                                                                                #GORRA NIÑO                                                  #7@
446#Agua                                                                                                #GUANTES NIÑO                                                #8@
461#Agua                                                                                                #INDIVIDUAL                                                  #4@
199#Agua                                                                                                #JGO. SABANAS 1 1/2 PLZ. + 1 FUNDA                           #16@
200#Agua                                                                                                #JGO. SABANAS 2 PLZ. + 2 FUNDAS                              #20@
202#Agua                                                                                                #JGO. SABANAS KING + 2 FUNDAS                                #26@
201#Agua                                                                                                #JGO. SABANAS QUEEN + 2 FUNDAS                               #24@
89#Agua                                                                                                #MALETIN                                                     #20@
447#Agua                                                                                                #MAMELUCO NIÑO                                               #6@
86#Agua                                                                                                #MANDIL NIÑO                                                 #6@
87#Agua                                                                                                #MANTA                                                       #15@
88#Agua                                                                                                #MANTA GRANDE                                                #20@
80#Agua                                                                                                #MANTEL BORDADO GRANDE                                       #25@
79#Agua                                                                                                #MANTEL BORDADO MEDIANO                                      #20@
290#Agua                                                                                                #MANTEL BORDADO PEQUEÑO                                      #15@
84#Agua                                                                                                #MANTEL C/ ALMIDÓN BORDADO GRANDE                            #30@
83#Agua                                                                                                #MANTEL C/ ALMIDÓN BORDADO MEDIANO                           #25@
82#Agua                                                                                                #MANTEL C/ ALMIDÓN LLANO GRANDE                              #20@
81#Agua                                                                                                #MANTEL C/ ALMIDÓN LLANO MEDIANO                             #17@
292#Agua                                                                                                #MANTEL C/ALMIDÓN BORDADO PEQUEÑO                            #20@
293#Agua                                                                                                #MANTEL C/ALMIDÓN LLANO PEQUEÑO                              #15@
78#Agua                                                                                                #MANTEL LLANO GRANDE                                         #15@
77#Agua                                                                                                #MANTEL LLANO MEDIANO                                        #12@
291#Agua                                                                                                #MANTEL LLANO PEQUEÑO                                        #10@
191#Agua                                                                                                #MOCHILA SINTETICA                                           #20@
90#Agua                                                                                                #MOCHILA TELA                                                #15@
92#Agua                                                                                                #OVEROL NIÑO                                                 #10@
448#Agua                                                                                                #PANTALON NIÑO                                               #8@
339#Agua                                                                                                #PELUCHE GRANDE                                              #60@
338#Agua                                                                                                #PELUCHE MEDIANO                                             #30@
337#Agua                                                                                                #PELUCHE PEQUEÑO                                             #15@
98#Agua                                                                                                #PIJAMA NIÑO (2 PZAS.)                                       #10@
288#Agua                                                                                                #PISO DE BAÑO                                                #12@
196#Agua                                                                                                #PISO MESA BORDADO GRANDE                                    #20@
195#Agua                                                                                                #PISO MESA BORDADO MEDIANO                                   #18@
194#Agua                                                                                                #PISO MESA GRANDE                                            #15@
193#Agua                                                                                                #PISO MESA MEDIANO                                           #10@
310#Agua                                                                                                #POLO NIÑO M/C                                               #5@
311#Agua                                                                                                #POLO NIÑO M/L                                               #5@
331#Agua                                                                                                #PONCHO NIÑO                                                 #10@
460#Agua                                                                                                #PROTECTOR COLCHON 1 1/2 PLZ                                 #15@
459#Agua                                                                                                #PROTECTOR COLCHON 1PLZ                                      #12@
409#Agua                                                                                                #PROTECTOR COLCHON 2 PLZ                                     #18@
457#Agua                                                                                                #PROTECTOR COLCHON KING                                      #25@
458#Agua                                                                                                #PROTECTOR COLCHON QUEEN                                     #22@
351#Agua                                                                                                #PROTECTOR CUNA                                              #15@
449#Agua                                                                                                #PULLOVER NIÑO                                               #4@
105#Agua                                                                                                #SABANA 1 1/2 PLAZA                                          #7@
106#Agua                                                                                                #SABANA 2 PLAZA                                              #7@
108#Agua                                                                                                #SABANA KING                                                 #10@
107#Agua                                                                                                #SABANA QUEEN                                                #8@
321#Agua                                                                                                #SACO NIÑO                                                   #10@
112#Agua                                                                                                #SACON NIÑO                                                  #12@
289#Agua                                                                                                #SECADOR                                                     #5@
115#Agua                                                                                                #SERVILLETA BORDADA                                          #6@
117#Agua                                                                                                #SERVILLETA C/ ALMIDÓN BORDADA                               #8@
116#Agua                                                                                                #SERVILLETA C/ ALMIDÓN LLANA                                 #7@
114#Agua                                                                                                #SERVILLETA LLANA                                            #5@
450#Agua                                                                                                #SHORT NIÑO                                                  #4@
332#Agua                                                                                                #TAPETE                                                      #8@
123#Agua                                                                                                #TOALLA GRANDE                                               #10@
122#Agua                                                                                                #TOALLA MEDIANA                                              #8@
121#Agua                                                                                                #TOALLA PEQUEÑA                                              #5@
324#Agua                                                                                                #TOALLA PLAYA                                                #15@
408#Agua                                                                                                #VARIOS                                                      #5@
325#Agua                                                                                                #VESTIDO NIÑA                                                #28@
210#Agua                                                                                                #ZAPATILLAS SINTETICAS                                       #25@
133#Agua                                                                                                #ZAPATILLAS TELA                                             #20@
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
139#Pieles                                                                                              #ABRIGO  CUERO                                               #80@
170#Pieles                                                                                              #ABRIGO  GAMUZA                                              #90@
171#Pieles                                                                                              #ABRIGO  GAMUZA ACOLCHADO                                    #100@
138#Pieles                                                                                              #ABRIGO CUERO ACOLCHADO                                      #90@
140#Pieles                                                                                              #BLUSA  CUERO                                                #30@
172#Pieles                                                                                              #BLUSA  GAMUZA                                               #30@
158#Pieles                                                                                              #BOTAS  CUERO  ALTAS                                         #35@
157#Pieles                                                                                              #BOTAS  CUERO BAJAS                                          #25@
173#Pieles                                                                                              #BOTAS  GAMUZA ALTAS                                         #35@
174#Pieles                                                                                              #BOTAS  GAMUZA BAJAS                                         #25@
212#Pieles                                                                                              #BOTINES  CUERO                                              #20@
213#Pieles                                                                                              #BOTINES  GAMUZA                                             #20@
141#Pieles                                                                                              #CAMISACO  CUERO                                             #50@
175#Pieles                                                                                              #CAMISACO  GAMUZA                                            #50@
159#Pieles                                                                                              #CARTERA  CUERO CHICA                                        #30@
161#Pieles                                                                                              #CARTERA  CUERO GRANDE                                       #40@
160#Pieles                                                                                              #CARTERA  CUERO MEDIANA                                      #35@
142#Pieles                                                                                              #CASACA CUERO                                                #50@
143#Pieles                                                                                              #CASACA CUERO ACOLCHADA                                      #70@
401#Pieles                                                                                              #CASACA CUERO SINTETICO                                      #35@
178#Pieles                                                                                              #CASACA GAMUZA                                               #50@
177#Pieles                                                                                              #CASACA GAMUZA ACOLCHADA                                     #70@
145#Pieles                                                                                              #CHALECO CUERO                                               #40@
179#Pieles                                                                                              #CHALECO GAMUZA                                              #40@
144#Pieles                                                                                              #CONJUNTO CUERO                                              #100@
181#Pieles                                                                                              #CONJUNTO GAMUZA                                             #110@
162#Pieles                                                                                              #CORREA DE CUERO                                             #15@
146#Pieles                                                                                              #FALDA CUERO CORTA                                           #35@
147#Pieles                                                                                              #FALDA CUERO LARGA                                           #50@
403#Pieles                                                                                              #FALDA CUERO SINTETICO                                       #30@
184#Pieles                                                                                              #FALDA GAMUZA CORTA                                          #35@
185#Pieles                                                                                              #FALDA GAMUZA LARGA                                          #50@
404#Pieles                                                                                              #GUANTES CUERO                                               #25@
405#Pieles                                                                                              #GUANTES GAMUZA                                              #25@
163#Pieles                                                                                              #MALETIN DE CUERO CHICO                                      #30@
164#Pieles                                                                                              #MALETIN DE CUERO GRANDE                                     #45@
188#Pieles                                                                                              #MALETIN DE GAMUZA CHICO                                     #30@
189#Pieles                                                                                              #MALETIN DE GAMUZA GRANDE                                    #45@
165#Pieles                                                                                              #MOCHILA DE CUERO CHICO                                      #30@
166#Pieles                                                                                              #MOCHILA DE CUERO GRANDE                                     #45@
190#Pieles                                                                                              #MOCHILA DE GAMUZA CHICO                                     #30@
192#Pieles                                                                                              #MOCHILA DE GAMUZA GRANDE                                    #45@
148#Pieles                                                                                              #PANTALON CUERO                                              #50@
197#Pieles                                                                                              #PANTALON GAMUZA                                             #50@
149#Pieles                                                                                              #SACO CUERO                                                  #50@
150#Pieles                                                                                              #SACO CUERO ACOLCHADO                                        #70@
204#Pieles                                                                                              #SACO GAMUZA                                                 #50@
203#Pieles                                                                                              #SACO GAMUZA ACOLCHADO                                       #70@
151#Pieles                                                                                              #SACON CUERO                                                 #70@
152#Pieles                                                                                              #SACON CUERO  ACOLCHADO                                      #90@
205#Pieles                                                                                              #SACON GAMUZA                                                #70@
206#Pieles                                                                                              #SACON GAMUZA ACOLCHADO                                      #90@
153#Pieles                                                                                              #SHORT CUERO                                                 #30@
207#Pieles                                                                                              #SHORT GAMUZA                                                #35@
155#Pieles                                                                                              #VESTIDO CUERO CORTO                                         #60@
156#Pieles                                                                                              #VESTIDO CUERO LARGO                                         #70@
208#Pieles                                                                                              #VESTIDO GAMUZA CORTO                                        #60@
209#Pieles                                                                                              #VESTIDO GAMUZA LARGO                                        #80@
278#Pieles                                                                                              #ZAPATILLAS CUERO                                            #30@
279#Pieles                                                                                              #ZAPATILLAS CUERO/GAMUZA                                     #30@
167#Pieles                                                                                              #ZAPATOS DE CUERO                                            #30@
211#Pieles                                                                                              #ZAPATOS DE GAMUZA                                           #35@
1#Planchado                                                                                           #ABRIGO                                                      #16.1@
359#Planchado                                                                                           #ABRIGO ALPACA                                               #23.1@
294#Planchado                                                                                           #BANDERA                                                     #8.4@
214#Planchado                                                                                           #BATA DELGADA                                                #10.5@
218#Planchado                                                                                           #BATA GRUESA                                                 #12.6@
7#Planchado                                                                                           #BERMUDA                                                     #4.9@
305#Planchado                                                                                           #BIVIRÍ                                                      #4.2@
12#Planchado                                                                                           #BLUSA  SEDA                                                 #7@
11#Planchado                                                                                           #BLUSA C/ APLICACIONES                                       #10.5@
10#Planchado                                                                                           #BLUSA LLANA                                                 #6.3@
222#Planchado                                                                                           #BLUSON                                                      #10.5@
8#Planchado                                                                                           #BODY                                                        #4.2@
223#Planchado                                                                                           #BOLERO                                                      #8.4@
13#Planchado                                                                                           #BUFANDA                                                     #4.2@
15#Planchado                                                                                           #BUZO  NIÑO (CASA-PANT)                                      #8.4@
14#Planchado                                                                                           #BUZO (CASA-PANT)                                            #10.5@
16#Planchado                                                                                           #CAMISA                                                      #7@
225#Planchado                                                                                           #CAMISA  CORDUROY                                            #8.4@
17#Planchado                                                                                           #CAMISA  SEDA                                                #8.4@
304#Planchado                                                                                           #CAMISON DORMIR                                              #5.6@
24#Planchado                                                                                           #CAPA  ALPACA                                                #17.5@
23#Planchado                                                                                           #CAPA DELGADA                                                #8.4@
238#Planchado                                                                                           #CAPA GRUESA                                                 #10.5@
216#Planchado                                                                                           #CAPRI                                                       #7@
19#Planchado                                                                                           #CASACA                                                      #9.1@
20#Planchado                                                                                           #CASACA  ACOLCHADA                                           #11.9@
21#Planchado                                                                                           #CASACA  IMPERMEABLE                                         #17.5@
22#Planchado                                                                                           #CASACA  PLUMAS                                              #17.5@
228#Planchado                                                                                           #CASACA JEAN                                                 #9.1@
227#Planchado                                                                                           #CASACA PLUMAS LARGA                                         #21@
347#Planchado                                                                                           #CASACA SEMIACOLCHADA                                        #11.2@
343#Planchado                                                                                           #CASULLA                                                     #21@
390#Planchado                                                                                           #CHAL - PASHMINA (ALPACA, LANA)                              #10.5@
239#Planchado                                                                                           #CHAL - PASHMINA CHICO                                       #5.6@
350#Planchado                                                                                           #CHALECO                                                     #8.4@
234#Planchado                                                                                           #CHALECO PLUMAS                                              #14@
40#Planchado                                                                                           #CHALECO VESTIR                                              #5.6@
240#Planchado                                                                                           #CHALINA                                                     #5.6@
45#Planchado                                                                                           #CHOMPA ALPACA                                               #10.5@
44#Planchado                                                                                           #CHOMPA C/ APLICACIONES                                      #10.5@
42#Planchado                                                                                           #CHOMPA DELGADA                                              #7@
43#Planchado                                                                                           #CHOMPA GRUESA                                               #8.4@
187#Planchado                                                                                           #CHULLO                                                      #3.5@
46#Planchado                                                                                           #CONJUNTO (2 PZA.)                                           #14@
34#Planchado                                                                                           #CORBATA                                                     #5.6@
35#Planchado                                                                                           #CORBATA SEDA                                                #7@
285#Planchado                                                                                           #CORSET                                                      #12.6@
33#Planchado                                                                                           #CORTINA CENEFA (METRO)                                      #5.6@
182#Planchado                                                                                           #CORTINA TAPASOL (METRO)                                     #7@
243#Planchado                                                                                           #CORTINA TAPASOL DOBLE (METRO                                #10.5@
31#Planchado                                                                                           #CORTINA TUL (METRO)                                         #5.6@
55#Planchado                                                                                           #ENTERIZO CORTO                                              #17.5@
56#Planchado                                                                                           #ENTERIZO LARGO                                              #24.5@
57#Planchado                                                                                           #FALDA  CORTA                                                #5.6@
60#Planchado                                                                                           #FALDA  MARINERA                                             #49@
58#Planchado                                                                                           #FALDA  PLIZADA LARGA                                        #28@
59#Planchado                                                                                           #FALDA  PLIZADA LARGA SEDA                                   #35@
283#Planchado                                                                                           #FALDA ACAMPANADA CORTA                                      #7@
284#Planchado                                                                                           #FALDA ACAMPANADA LARGA                                      #10.5@
217#Planchado                                                                                           #FALDA ALPACA                                                #24.5@
183#Planchado                                                                                           #FALDA LARGA                                                 #7@
282#Planchado                                                                                           #FALDA SEDA                                                  #14@
342#Planchado                                                                                           #KIMONO                                                      #17.5@
76#Planchado                                                                                           #LEGGINS                                                     #6.3@
85#Planchado                                                                                           #MANDIL                                                      #8.4@
91#Planchado                                                                                           #OVEROL                                                      #10.5@
363#Planchado                                                                                           #PANTALON                                                    #8.4@
298#Planchado                                                                                           #PANTALÓN JEAN                                               #8.4@
93#Planchado                                                                                           #PANTALÓN VESTIR                                             #8.4@
94#Planchado                                                                                           #PAÑUELO                                                     #2.1@
95#Planchado                                                                                           #PAÑUELO  SEDA                                               #5.6@
340#Planchado                                                                                           #PAÑUELO GRANDE                                              #5.6@
96#Planchado                                                                                           #PAREO                                                       #5.6@
97#Planchado                                                                                           #PIJAMA (2 PZAS.)                                            #9.8@
101#Planchado                                                                                           #POLERA                                                      #7@
308#Planchado                                                                                           #POLO CUELLO                                                 #6.3@
306#Planchado                                                                                           #POLO ESTAMPADO M/C                                          #6.3@
99#Planchado                                                                                           #POLO M/C                                                    #5.6@
102#Planchado                                                                                           #PONCHO                                                      #10.5@
198#Planchado                                                                                           #PONCHO ALPACA                                               #17.5@
327#Planchado                                                                                           #PONCHO IMPERMEABLE                                          #14@
104#Planchado                                                                                           #PULLOVER                                                    #5.6@
109#Planchado                                                                                           #SACO                                                        #9.8@
317#Planchado                                                                                           #SACO CORDUROY                                               #9.8@
319#Planchado                                                                                           #SACO UNIFORME                                               #9.8@
111#Planchado                                                                                           #SACON                                                       #12.6@
113#Planchado                                                                                           #SHORT                                                       #4.2@
120#Planchado                                                                                           #TOP                                                         #4.9@
344#Planchado                                                                                           #TUNICA                                                      #10.5@
130#Planchado                                                                                           #VESTIDO C/APLICACIONES FIESTA CORTO                         #42@
131#Planchado                                                                                           #VESTIDO C/APLICACIONES FIESTA LARGO                         #56@
129#Planchado                                                                                           #VESTIDO C/APLICACIONES LARGO                                #38.5@
126#Planchado                                                                                           #VESTIDO FIESTA CORTO                                        #28@
127#Planchado                                                                                           #VESTIDO FIESTA LARGO                                        #42@
326#Planchado                                                                                           #VESTIDO PLIZADO                                             #49@
124#Planchado                                                                                           #VESTIDO SIMPLE CORTO                                        #14@
125#Planchado                                                                                           #VESTIDO SIMPLE LARGO                                        #17.5@
1#Seco                                                                                                #ABRIGO                                                      #23@
2#Seco                                                                                                #ABRIGO  NIÑO                                                #15@
359#Seco                                                                                                #ABRIGO ALPACA                                               #33@
6#Seco                                                                                                #BABUCHAS  NIÑO                                              #8@
215#Seco                                                                                                #BATA  NIÑO                                                  #10@
214#Seco                                                                                                #BATA DELGADA                                                #15@
218#Seco                                                                                                #BATA GRUESA                                                 #18@
7#Seco                                                                                                #BERMUDA                                                     #7@
443#Seco                                                                                                #BERMUDA NIÑO                                                #5@
305#Seco                                                                                                #BIVIRÍ                                                      #6@
12#Seco                                                                                                #BLUSA  SEDA                                                 #10@
11#Seco                                                                                                #BLUSA C/ APLICACIONES                                       #15@
10#Seco                                                                                                #BLUSA LLANA                                                 #9@
414#Seco                                                                                                #BLUSA MARINERA                                              #40@
222#Seco                                                                                                #BLUSON                                                      #15@
8#Seco                                                                                                #BODY                                                        #8@
223#Seco                                                                                                #BOLERO                                                      #12@
13#Seco                                                                                                #BUFANDA                                                     #6@
15#Seco                                                                                                #BUZO  NIÑO (CASA-PANT)                                      #12@
14#Seco                                                                                                #BUZO (CASA-PANT)                                            #15@
16#Seco                                                                                                #CAMISA                                                      #10@
18#Seco                                                                                                #CAMISA  C/ ALMIDÓN                                          #12@
225#Seco                                                                                                #CAMISA  CORDUROY                                            #12@
17#Seco                                                                                                #CAMISA  SEDA                                                #12@
346#Seco                                                                                                #CAMISA NIÑO                                                 #7@
304#Seco                                                                                                #CAMISON DORMIR                                              #8@
24#Seco                                                                                                #CAPA  ALPACA                                                #25@
23#Seco                                                                                                #CAPA DELGADA                                                #12@
238#Seco                                                                                                #CAPA GRUESA                                                 #15@
216#Seco                                                                                                #CAPRI                                                       #10@
19#Seco                                                                                                #CASACA                                                      #13@
20#Seco                                                                                                #CASACA  ACOLCHADA                                           #17@
21#Seco                                                                                                #CASACA  IMPERMEABLE                                         #25@
22#Seco                                                                                                #CASACA  PLUMAS                                              #25@
385#Seco                                                                                                #CASACA ACOLCHADA LARGA                                      #23@
472#Seco                                                                                                #CASACA ALPACA                                               #25@
228#Seco                                                                                                #CASACA JEAN                                                 #13@
233#Seco                                                                                                #CASACA NIÑO                                                 #10@
227#Seco                                                                                                #CASACA PLUMAS LARGA                                         #30@
347#Seco                                                                                                #CASACA SEMIACOLCHADA                                        #16@
343#Seco                                                                                                #CASULLA                                                     #30@
390#Seco                                                                                                #CHAL - PASHMINA (ALPACA, LANA)                              #15@
239#Seco                                                                                                #CHAL - PASHMINA CHICO                                       #8@
41#Seco                                                                                                #CHAL - PASHMINA GRANDE                                      #12@
350#Seco                                                                                                #CHALECO                                                     #12@
386#Seco                                                                                                #CHALECO ACOLCHADO                                           #16@
234#Seco                                                                                                #CHALECO PLUMAS                                              #20@
40#Seco                                                                                                #CHALECO VESTIR                                              #10@
240#Seco                                                                                                #CHALINA                                                     #10@
387#Seco                                                                                                #CHAQUETA                                                    #10@
45#Seco                                                                                                #CHOMPA ALPACA                                               #15@
44#Seco                                                                                                #CHOMPA C/ APLICACIONES                                      #15@
42#Seco                                                                                                #CHOMPA DELGADA                                              #10@
43#Seco                                                                                                #CHOMPA GRUESA                                               #12@
237#Seco                                                                                                #CHOMPA NIÑO                                                 #8@
187#Seco                                                                                                #CHULLO                                                      #5@
411#Seco                                                                                                #COJIN CHICO FORRO                                           #8@
413#Seco                                                                                                #COJIN GRANDE FORRO                                          #12@
412#Seco                                                                                                #COJIN MEDIANO FORRO                                         #10@
242#Seco                                                                                                #COJIN PLUMAS                                                #15@
46#Seco                                                                                                #CONJUNTO (2 PZA.)                                           #20@
34#Seco                                                                                                #CORBATA                                                     #8@
35#Seco                                                                                                #CORBATA SEDA                                                #10@
55#Seco                                                                                                #ENTERIZO CORTO                                              #25@
56#Seco                                                                                                #ENTERIZO LARGO                                              #35@
281#Seco                                                                                                #ENTERIZO NIÑO                                               #15@
463#Seco                                                                                                #ESTOLA SACERDOTE                                            #18@
57#Seco                                                                                                #FALDA  CORTA                                                #8@
60#Seco                                                                                                #FALDA  MARINERA                                             #70@
58#Seco                                                                                                #FALDA  PLIZADA LARGA                                        #40@
59#Seco                                                                                                #FALDA  PLIZADA LARGA SEDA                                   #50@
283#Seco                                                                                                #FALDA ACAMPANADA CORTA                                      #10@
284#Seco                                                                                                #FALDA ACAMPANADA LARGA                                      #15@
217#Seco                                                                                                #FALDA ALPACA                                                #35@
183#Seco                                                                                                #FALDA LARGA                                                 #10@
445#Seco                                                                                                #FALDA NIÑA                                                  #6@
282#Seco                                                                                                #FALDA SEDA                                                  #15@
69#Seco                                                                                                #FRAZADA ALPACA 1 1/2 PLAZA                                  #35@
70#Seco                                                                                                #FRAZADA ALPACA 2 PLAZA                                      #50@
72#Seco                                                                                                #FRAZADA ALPACA KING                                         #80@
71#Seco                                                                                                #FRAZADA ALPACA QUEEN                                        #60@
73#Seco                                                                                                #GORRA                                                       #10@
345#Seco                                                                                                #GORRA NIÑO                                                  #7@
75#Seco                                                                                                #GUANTES                                                     #10@
446#Seco                                                                                                #GUANTES NIÑO                                                #8@
328#Seco                                                                                                #IMPERMEABLE (2 PZAS.)                                       #30@
342#Seco                                                                                                #KIMONO                                                      #25@
76#Seco                                                                                                #LEGGINS                                                     #9@
451#Seco                                                                                                #MAMELUCO ADULTO                                             #12@
447#Seco                                                                                                #MAMELUCO NIÑO                                               #6@
85#Seco                                                                                                #MANDIL                                                      #12@
86#Seco                                                                                                #MANDIL NIÑO                                                 #6@
314#Seco                                                                                                #MANTA ALPACA                                                #25@
91#Seco                                                                                                #OVEROL                                                      #15@
92#Seco                                                                                                #OVEROL NIÑO                                                 #10@
363#Seco                                                                                                #PANTALON                                                    #12@
297#Seco                                                                                                #PANTALÓN CORDUROY                                           #12@
296#Seco                                                                                                #PANTALON DRILL                                              #12@
298#Seco                                                                                                #PANTALÓN JEAN                                               #12@
448#Seco                                                                                                #PANTALON NIÑO                                               #8@
299#Seco                                                                                                #PANTALÓN UNIFORME                                           #12@
93#Seco                                                                                                #PANTALÓN VESTIR                                             #12@
94#Seco                                                                                                #PAÑUELO                                                     #5@
95#Seco                                                                                                #PAÑUELO  SEDA                                               #8@
340#Seco                                                                                                #PAÑUELO GRANDE                                              #8@
96#Seco                                                                                                #PAREO                                                       #8@
97#Seco                                                                                                #PIJAMA (2 PZAS.)                                            #14@
98#Seco                                                                                                #PIJAMA NIÑO (2 PZAS.)                                       #10@
101#Seco                                                                                                #POLERA                                                      #10@
309#Seco                                                                                                #POLERA ESTAMPADA                                            #12@
308#Seco                                                                                                #POLO CUELLO                                                 #9@
306#Seco                                                                                                #POLO ESTAMPADO M/C                                          #9@
307#Seco                                                                                                #POLO ESTAMPADO M/L                                          #9@
99#Seco                                                                                                #POLO M/C                                                    #8@
100#Seco                                                                                                #POLO M/L                                                    #9@
310#Seco                                                                                                #POLO NIÑO M/C                                               #5@
311#Seco                                                                                                #POLO NIÑO M/L                                               #5@
102#Seco                                                                                                #PONCHO                                                      #15@
198#Seco                                                                                                #PONCHO ALPACA                                               #25@
327#Seco                                                                                                #PONCHO IMPERMEABLE                                          #20@
331#Seco                                                                                                #PONCHO NIÑO                                                 #10@
351#Seco                                                                                                #PROTECTOR CUNA                                              #15@
104#Seco                                                                                                #PULLOVER                                                    #8@
449#Seco                                                                                                #PULLOVER NIÑO                                               #4@
109#Seco                                                                                                #SACO                                                        #14@
471#Seco                                                                                                #SACO ALPACA                                                 #25@
317#Seco                                                                                                #SACO CORDUROY                                               #14@
321#Seco                                                                                                #SACO NIÑO                                                   #10@
110#Seco                                                                                                #SACO PANA /SEDA                                             #14@
319#Seco                                                                                                #SACO UNIFORME                                               #14@
111#Seco                                                                                                #SACON                                                       #18@
376#Seco                                                                                                #SACON ALPACA                                                #30@
112#Seco                                                                                                #SACON NIÑO                                                  #12@
113#Seco                                                                                                #SHORT                                                       #6@
450#Seco                                                                                                #SHORT NIÑO                                                  #4@
120#Seco                                                                                                #TOP                                                         #7@
344#Seco                                                                                                #TUNICA                                                      #15@
408#Seco                                                                                                #VARIOS                                                      #5@
128#Seco                                                                                                #VESTIDO C/APLICACIONES CORTO                                #45@
130#Seco                                                                                                #VESTIDO C/APLICACIONES FIESTA CORTO                         #60@
131#Seco                                                                                                #VESTIDO C/APLICACIONES FIESTA LARGO                         #80@
129#Seco                                                                                                #VESTIDO C/APLICACIONES LARGO                                #55@
126#Seco                                                                                                #VESTIDO FIESTA CORTO                                        #40@
462#Seco                                                                                                #VESTIDO FIESTA ESPECIAL                                     #180@
127#Seco                                                                                                #VESTIDO FIESTA LARGO                                        #60@
325#Seco                                                                                                #VESTIDO NIÑA                                                #28@
132#Seco                                                                                                #VESTIDO NOVIA 1                                             #400@
286#Seco                                                                                                #VESTIDO NOVIA 2                                             #500@
287#Seco                                                                                                #VESTIDO NOVIA 3                                             #750@
326#Seco                                                                                                #VESTIDO PLIZADO                                             #70@
124#Seco                                                                                                #VESTIDO SIMPLE CORTO                                        #20@
125#Seco                                                                                                #VESTIDO SIMPLE LARGO                                        #25@
';

$exparroba = explode("@", trim($stm));
if ($exparroba) {
    $sql = "";
    $okey = [];
    $error = [];
    for ($f = 0; $f < count($exparroba); $f++) {
        try {
            $sep = array_map('trim', explode("#", $exparroba[$f]));
            if (
                    @$sep[0] &&
                    @$sep[1] &&
                    @$sep[2] &&
                    @$sep[3]
            ) {
                $sql .= "INSERT INTO articulo (nombre_articulo,codigo_articulo,precio_articulo,Id_Servicio) ";
                $sql .= "VALUES('" . trim($sep[2]) . "' , '" . trim($sep[0]) . " ' , '" . trim($sep[3]) . "',(SELECT id FROM servicio WHERE Nombre_Servicio = '" . ucwords(strtolower(trim($sep[1]))) . "' LIMIT 1));";
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