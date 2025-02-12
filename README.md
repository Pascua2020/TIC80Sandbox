##### Hashtags #️⃣ : #gamedev #TIC80 #lua #sandbox #2D #Retro #Argentina #####

##### README en Español.To read the English versión,go to README-English.md

![TIC-80](https://img.shields.io/badge/TIC--80-2D%20Game%20Development-blue)

![Version](https://img.shields.io/badge/version-1.0.0-blue)

[![GitHub license](https://img.shields.io/github/license/Naereen/StrapDown.js.svg)](https://github.com/Naereen/StrapDown.js/blob/master/LICENSE)

[![Itch.io downloads](https://img.shields.io/badge/Downloads-0-brightgreen)](https://your-game.itch.io)

![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)

## 🎮 TIC80Sandbox
2D sandbox style videogame in fantasy console TIC80.

![TIC80 Logo](https://img.itch.zone/aW1nLzQyOTUwMTYucG5n/original/zzHnBx.png)

🎲 ***Nombre del juego :*** 

![gifinicio](./Imagenes/inicio.gif)

*Crimen y Chori*

![cartucho](./Imagenes/Cartucho.png)

🎲 ***Año :*** 

*2025?*

🎲 ***Desarrollador :***

*AltaVista Games*

( Pascua2020 y ChatGPT/DeepSeek )

🎲 ***Género :*** 

```
-Sandbox 2D
-Minijuegos
-Conducción / Carreras
-Combate Vehicular
-Acción / Aventura
-Pinball
-Creación ( Solo para Editar Mapas en Modo RC ).
```

🎲 ***Plataforma :*** 

*TIC-80*

( Consola de Fantasía Open Source :
Funciona en PC,Raspberry Pi y Smartphones. )

Especificaciones ( de TIC-80 ):
```
-Resolución: 
240x136 Pixeles , 16 Colores.

-Mapa : 
1920 x 1088 Pixeles ( Dividido en Bloques de 8 x 8 - 64 Bloques en Total ).

-Graficos : 
256 Tiles y 256 Sprites.

-Memoria : 
272 KB de RAM ( 32 KB de VRAM ).
```

🎲 ***Lenguaje de Programación :*** 

*Lua*

Juego hecho en su mayoria desde el Celular,SIN PC 
( eso si,con ayuda de ChatGPT / DeepSeek ).

Archivos .gif hechos con la herramienta integrada en TIC-80.

![gifarmasvarias](./Imagenes/armasvarias.gif)

Eso incluye dibujar los Gráficos con el dedo táctil y tocar el Código desde el editor,ambos de TIC80.

![gif1](./Imagenes/1.gif)

## 🎮 Sinopsis : 

Crimen y Chori es un Videojuego Sandbox 2D ambientado en una ciudad de Argentina Pseudo-ficticia llamada Ciudad Rapera de Buenos Aires.

En esta Ciudad hay una fuerte presencia de las Emisoras de Radio y la Cultura Underground.Ademas ocurren todo tipo de cosas bizarras y en el medio hay un cambio de Gobierno.

El famoso actor Silvestre Stacchotta viene de Los Guapos County de Los Angeles a filmar escenas de Stuntman en Buenos Aires,en un clima de impresionante humedad y bardo nacional e internacional.

Y hay una fuerte hiperinflacion económica : El importantisimo empresario Japones-Argentino Juan Garcamaru enfrenta serias dificultades económicas con sus historicas Galletitas Marca CULO.

Esto y mucho más en...Crimen y Chori!

![todomapa](./Imagenes/MapaEntero.jpg)

Aunque también tiene pequeñas ambientaciones en:

🍪 ***La VirgoCueva en Argentina*** 

( Pantalla de Inicio,Hub de Niveles. )

![virgocueva](./Imagenes/Virgocueva(Hub).jpg)

🍪 ***Pista de Carreras en Berna , Suiza***

( Minijuego de Carreras. )

![suiza](./Imagenes/PistaSuiza.jpg)

🍪 ***La Pistita en Pais Vasco , España***

( Minijuego de Carreras RC - a Control Remoto -. )

![rc](./Imagenes/PistitaRC.jpg)

🍪 ***Flippersburgo en Alemania***

( Minijuego de Pinball. )

![pinball](./Imagenes/MinijuegodePinball.jpg)

🍪 ***Satélite Tokyo en el Espacio Exterior*** 

( Minijuego de Baile. )

![baile](./Imagenes/MinijuegodeBaile.jpg)

🍪 ***Trompolandia en Estonia***

( Minijuego de Trompos. )

![trompo](./Imagenes/MinijuegodeTrompos.jpg)

## 🎮 Requisitos e Instalación :

Al ser un Juego de TIC-80,corre en:
```
-PC ( Windows,Linux,Mac OS )
-Android
-Raspberry Pi
-Nintendo 3DS
-Retroarch
-HTML5 ( con WebAssembly )
```

![gif2](./Imagenes/2.gif)

Como Jugar :

```
1-Descarga el archivo .TIC .
2-Abre TIC-80 y carga el cartucho en la terminal de consola ( load juego.tic ).
3-corre el juego ( run juego.tic ).
```

## 🎮 Controles:

![gifpausa](./Imagenes/pausa.gif)

General
```
0-Flecha Arriba
1-Flecha Abajo
2-Flecha Izquierda
3-Flecha Derecha

4-A
5-B
6-X
7-Y
```

### Modo 1 Jugador ( Todo el Juego excepto RC y Trompos ):

```
* Botones 0,1,2,3 : Mover Jugador/vehículo.

*Boton 4 / A : Elegir Opcion / Interactuar.
*Boton 5 / B : Modo Táctico / Pausa.
*Boton 6 / X : Golpear / Disparar.
*Boton 7 / Y : Subir a Vehículo.
```
### Modo 2 Jugadores ( RC y Trompos ) :

```
* Botones 0,1,2,3 : Mover RC / Trompo jugador 1.

* Botones 4,5,6,7 : Mover RC / Trompo jugador 2.

( Solo RC : * Mouse/Pantalla Tactil : Editar Mapa )
```

## 🎮 Características del Juego:

![gif3](./Imagenes/3.gif)

✅️ 01

22 "Radios" en Texto.

![gifradio](./Imagenes/gifradio.gif)
```
"01 Radio Todo Vardo" : Noticias Locales
"02 Radio Bajones" : Tango
"03 Radio Poesía de la Calle" : Trap
"04 Gobierno de Argentina" : Cadena Nacional
"05 Solos y Solas" : Relaciones Amorosas

"06 Desgracias Economicas" : Economia
"07 Joyas de la Historia" : Historia
"08 No me Importa" : Internacional
"09 Radio Antimainstream" : Historias Unicas
"10 Cine Ultra 8K" : Cine
```
![gifradioterror](./Imagenes/radioterror.gif)
```
"11 Destapando Curros" : Investigaciones
"12 Radio Grieta" : Polarización
"13 Radio Cuarta Pared" : Vida Real
"14 La IA Avanza" : No Humanos
"15 Jesus te Ama" : Religion

"16 Sonidos Animalunos" : Lofi
"17 Naturaleza Insolita" : Naturaleza
"18 Radio Pesimista" : Noticias Tristes
"19 Poesia Pixelar" : Poesia Gamer
"20 Radio Terror" : Terror Bizarro

"21 Radio Lenguaje de la vida" : Idiomas
"22 Comerciales Gamers" : Propaganda
```
![radio](./Imagenes/Radio.jpg)

✅️ 02

512 Gráficos como máximo en formato 8x8 Pixeles.

![graficos1](./Imagenes/Graficos1.jpg)

![graficos2](./Imagenes/Graficos2.jpg)

Con Elementos divididos en secciones como:
```
-Asfalto
-Cesped
-Agua
-Pisos
-Carteles
-Personajes
-Armas
-Vehiculos
-Piedras
-Bicisendas
-Objetos
-Interfaz
ETC.
```

✅️ 03

16 Barrios en Buenos Aires.

Cada barrio tiene su propio estilo,con sus calles ( aunque hay barrios que comparten calles ) .

Y los Barrios poseen una Historia resumida la cual se puede leer.

![barrioobelisco](./Imagenes/barrioObelisco.jpg)

✅️ 04

![gifcoche](./Imagenes/subircoche.gif)

15 Vehículos 
( la mayoría con 4 Colores -Rojo,Azul,Verde y Amarillo-).

Hay 2 marcas :

-Tochota ( de Japón )

-Zho Zho ( de China )

![vehiculosc](./Imagenes/VehiculosC.png)
```
01-Tochota - Fulero ( Coche )
02-Tochota - Strella ( Coche )
03-Tochota - Random ( Moto )
04-Tochota - Airlines ( Avión )
05-Tochota - Bondi ( Colectivo )
06-Tochota - Salud ( Ambulancia )
07-Tochota - Raíles ( Tren )
08-Tochota - Yip ( Camioneta )

09-Zho Zho - Ego Ego ( Coche )
10-Zho Zho - Jinping ( Coche )
11-Zho Zho - Xi ( Coche )
12-Zho Zho - RC
13-Zho Zho - Skate
14-Zho Zho - Woter ( Bomberos )
15-Zho Zho - Armageddon ( Policía )

```

✅️ 05

11 Armas.

-Algunas son de corto alcance / sin disparos ( Puño o Katana ).

-Otras tiran varios tiros de diferente manera.

-Otras no tiran tiros sino ráfagas ( fuego o electricidad ).

![armasc](./Imagenes/ArmasC.png)

![gifarma](./Imagenes/gifarma.gif)
```
01-Puño
02-Pistola
03-Escopeta
04-Katana
05-Bazooka
06-Rayo láser
07-Rifle electrico
08-Granada
09-Lanzallamas
10-AK47
11-Minigun
```

![armas](./Imagenes/Armas.jpg)

✅️ 06

Trama Bizarra,con mezcla de Datos ficticios ( EJ : Presidente Hamburguesa en Uruguay ) y reales ( EJ : el Idioma Tenis ).

![trama](./Imagenes/trama.jpg)

✅️ 07

Easter Eggs / Curiosidades

( Ej : Dibujos misteriosos en el agua. )

![easter](./Imagenes/EasterEggMar.jpg)

✅️ 08

19 Personajes de la Trama + 9 NPCs.

![personajesc](./Imagenes/PersonajesC.png)
```
Trama
01-Jugador ( Wikiman )
02-Gatito ( Mascota )
03-Silvestre Stacchotta ( actor de EEUU )
04-Jorge Lanota ( Periodista )
05-Juan Garcamaru ( Empresario )

06-Profesor Levantini ( Influencer )
07-Profesora Dopamina ( Doctora )
08-Barcelo Monelli ( Periodista )
09-Elon Mots ( Magnate Africano )
10-Big Faso ( Duo Ruso Senegales )

11-Señor Amarguino ( Locutor )
12-Adrian DelaTrampa ( Crítico de cine )
13-I y A ( Inteligencias Artificiales malvadas ) 
14-Damian Blabla ( Historiador )
15-IA de Brian Turreti ( Figura Historica Turra en China)

16-DiosGPT ( IA del Jugador )
17-Locutor de Terror Gallego / Manolo Joseche
18-Guillermo Bajolini ( Cantante de Tango )
19-ARmando GENe TINOman ( Presidente Saliente)
```

```
Peatones / NPCs
1-Suizo Romanche
2-Rapi el Rapero
3-Timmy Trabalenguas

4-"Capitán Inflacion"
5-Obsesivo y Compulsivo
6-El Profeta

7-Cerebrito y Wachin
8-"El Payaso Curro Curro"
9-Mamá y Niño Diabolico

```

✅️ 09

Misión de Stuntman 

( Piruetas en vehículo de doble de cine.

Con 10 Mecánicas distintas. )

( Inspirado en el Videojuego de 2002 - Stuntman - de Reflections Interactive ).

![gifaro](./Imagenes/gifaro.gif)

```
01-Subir a Coche y conducirlo
02-Destruir Cajas
03-Usar Nitro
04-Disparar desde vehiculo
05-Esquivar enemigos
06-Saltar rampa
07-Perseguir coche
08-Saltar aro de fuego
09-Esquivar tren
10-Explotar coche
```

![mision](./Imagenes/mision.jpg)

✅️ 10

![gifgpt](./Imagenes/diosgpt.gif)

Simulador ( muy simple ) de App estilo 
ChatGPT ( llamada DiosGPT ) : 

Sirve como tutorial.

![gpt](./Imagenes/DiosGPT.jpg)

✅️ 11

![gifdiario](./Imagenes/gifdiario.gif)

Lector de Diarios 
( Noticias de varias Temáticas ).

![diario](./Imagenes/LectordeDiarios.jpg)

✅️ 12

Simulador estilo Wiki ( llamado Nerdpedia ) , con Interfaz simplificada y datos bizarros.

![gifwiki](./Imagenes/gifwiki.gif)

![wiki](./Imagenes/nerdpedia.jpg)

✅️ 13

![gifskate](./Imagenes/skate.gif)

El Skate se puede montar en Caños.

![skate](./Imagenes/PistadeSkate.jpg)

✅️ 14

![gifsuba](./Imagenes/suba.gif)

El Jugador puede tomarse Colectivos en Paradas,con la Tarjeta SUBA.

![parada](./Imagenes/Parada.jpg)

✅️ 15

![gifmoneda](./Imagenes/moneda.gif)

Sistema de Dinero ( llamado Peluca$ ).

Se pueden comprar Choris , recargar Nafta o viajar en Colectivo.

![monedas](./Imagenes/monedas.jpg)

✅️ 16

Sistema de Climatologia

![gifclima](./Imagenes/climatologia.gif)

( Pueden activarse varios efectos simultáneamente ).

```
-Lluvia
-Nieve
-Hojas
-Viento
-Relámpagos
```

![clima](./Imagenes/Climatologia.jpg)

✅️ 17

![gifminimapa](./Imagenes/minimapa.gif)

Cámara que sigue al Jugador y Minimapa.

![minimapa](./Imagenes/minimapa.jpg)

✅️ 18

Jetpack 
( Para poder volar sobre el agua ).

![gifjetpack](./Imagenes/gifjetpack.gif)

![jetpack](./Imagenes/Jetpack.jpg)

✅️ 19

![gifnafta](./Imagenes/gifnafta.gif)

Los vehículos tienen Nafta,o se recarga o se acaba y no pueden moverse más.

![nafta](./Imagenes/nafta.jpg)

✅️ 20

Hay una Pista a Control Remoto cuyos gráficos se pueden editar con la pantalla táctil,"pegando" los gráficos desde un editor.

![rcuno](./Imagenes/EditorRC1.jpg)
![rcdos](./Imagenes/EditorRC2.jpg)

✅️ 21

Minijuego de Trompos 

( con Modo 2 Jugadores ).

![giftrompo](./Imagenes/giftrompo.gif)

✅️ 22

Visor de Telescopio 

![giftelescopio](./Imagenes/telescopio.gif)

( Para ver Estrellas Normales y Fugaces ).

![telescopio](./Imagenes/Telescopio.jpg)

✅️ 23

Sistema de Mensajes Móviles.

![gifsms](./Imagenes/gifsms.gif)

![sms](./Imagenes/MensajesMoviles.jpg)

✅️ 24

20 Coleccionables en el Mapa : 

-16 "Condones" en la Ciudad.

-4 "Diamantes" en el Mar.

![coleccionablesc](./Imagenes/ColeccionablesC.png)

✅️ 25

Modo Debug / Depuración 

( Para ver mejor Variables en Pantalla , lo cual ayuda al Testeo ).

![gifdebug](./Imagenes/debug.gif)

✅️ 26

![gifinterfaz](./Imagenes/interfaz.gif)

Interfaz Minimalista ( Estilo Cartas ) ,con Modo Táctico.

![interfaz](./Imagenes/Interfaz(ModoTactica).jpg)

✅️ 27

Trucos ( al conseguir 100% ).

![gifteclado](./Imagenes/teclado.gif)

![giftecladonum](./Imagenes/tecladonum.gif)

✅️ 28

![gifkatana](./Imagenes/katana.gif)

Objetos / Enemigos Destructibles,Sistema de Partículas sangriento.

![sangre](./Imagenes/sangre.jpg)

✅️ 29

Sistema de Votación Electoral
( Opcion A o B ).

Con Personajes de la Trama.

✅️ 30

Diálogos Automáticos ( ya sea con Personajes o Radio ).

![dialogoa](./Imagenes/dialogoa.jpg)

✅️ 31

60 Frames por Segundo.

![pinball](./Imagenes/pinball.gif)

( TIC-80 esta bloqueado a esos FPS ).

✅️ 32

Distintos Tipos ( para la Ciudad ) de :
```
*Aceras
*Carteles de Trafico
tráfico
*Cesped
*Oceanos
*Edificios
*Baldosas
*Faroles
*Muros
```
![calles](./Imagenes/calles.jpg)

✅️ 33

Parques,Playa y Aeropuerto 
( en la Ciudad ).

![aeropuerto](./Imagenes/aeropuerto.jpg)

✅️ 34

Cada Barrio tiene su Nombre y este se muestra en pantalla al estar en el.
Lo mismo las Calles.

✅️ 35

Modo Carrera Arcade.

![modocarrera](./Imagenes/modocarrera.gif)


![carrera](./Imagenes/ModoCarrera.jpg)

✅️ 36

Modo Combate Vehícular.

✅️ 37

Rampas y Aros de Fuego ( Este ultimo se prende y apaga ).

![aro](./Imagenes/aro.jpg)

✅️ 38

Minijuego de Baile

Con sus propias Letras de Canciones y Sistema de Combos.

![gifbaile](./Imagenes/gifbaile.gif)

✅️ 39

Terremoto

![gifterremoto](./Imagenes/terremoto.gif)

## 🎮 Mapa

![ciudad](./Imagenes/Mapa(SoloCiudad).jpg)

##### 🌇 -Ciudad Rapera de Buenos Aires 

( Incluye 16 Barrios )

![barrios](./Imagenes/Barrios.jpg.png)

Nombres de los Barrios:

```
1-Nueva Pyongyang
2-Obelisco
3-Internets
4-No no no no

5-Vivan los osos
6-Tigerlandia
7-Nueva Madrid
8-Villa Castores

9-Currolandia
10-Villa Pinball
11-No se queje
12-Villa Casta

13-Barrio Turrisimo
14-Barrio Chetisimo
15-Casi casi
16-El Wiki Barrio
```

Nombres de las Calles:

```

1 Lalala
2 Lucifer
3 Proceda
4 Inflacion
5 Satanas
6 Conspiración
7 Turbina
8 Diamante
9 Chechona
10 Informeishon

11 Poker
12 No jodas
13 Cállate
14 Gilipollas
15 Anaconda
16 Siga Siga
17 Eureka
18 Laberinto
19 Meteorito
20 Miau

21 Yupi
22 Caos
23 Pixeles
24 Wauf
25 Seineldin
26 Pio pío
27 Jarbard
28 Ameo
29 Tuti fruti
30 Libre

31 Khe
32 Zig Zag
33 Tuki Tuki
34 Ouch
35 Chad
36 Pff
37 Chocolate
```

##### 🌅 -Mar Ram

( Rodea a la Ciudad. )

![marpinball](./Imagenes/marpinball.jpg)

## 🎮 Jugabilidad

Es un videojuego Sandbox ( estilo GTA ) pero en 2D,y tiene varios minijuegos que le aportan un toque bastante diferenciador.

Debido a los pocos controles que hay el juego cuenta con un modo táctico,de forma que se puede  elegir múltiples opciones de forma pausada y retomar la acción una vez que el jugador define que hacer.

El jugador puede ir a pie o usar múltiples vehículos y también múltiples armas.

Si bien esta ambientado en una Ciudad,el Mapa es Pequeño pero sobrecargado de detalles y la Ciudad está rodeada por un mar : Aunque hay algunas zonas más que se pueden acceder fuera de este lugar.

También hay un enfoque importante en la Interactividad ( ej la lectura de la Wiki o el Diario ) en un mundo con todos los elementos interconectados.

## 🎮 Estado

En Desarrollo ( desde 30/12/2024 ).

Enero 2025 :
```
-Primeros Prototipos
-Primeros Backups
-Primeras Screenshots/Videos
-Creación de Gráficos
-Creación de Mapa
-Creación de Personajes
-Creación de Programación 
/ Mecánicas de todo tipo 
( incluido el Pinball )
```
Febrero 2025:
```
-Búsqueda de Feedback
-Creación de Repositorio de GitHub
-Búsqueda de Música Open Source
```

De momento sin Sonido.

## 🎮 Licencia

Open Source?

## 🎮 Creditos

![gifcreditos](./Imagenes/creditos.gif)

Desarrollador : Pascua2020
```
-Diseño de Sprites
-Diseño de Mapa
-Ideas de Trama y Personajes
-Programación
-Backups en la Nube
-Mecánicas Jugables
-Testing/Debug
```

Asistentes de IA : ChatGPT , DeepSeek :
Me ayudaron a profundizar elementos de programación y de la trama 
( EJ : los diálogos de las Radios. )

Detalles del juego agregados : 
```
-Gente Conocida.
-Chistes leídos en Internet.
```

Inspiraciones : 
```
-Saga GTA
-Stuntman ( 2002 )
-Dance Dance Revolution
-Beyblade
-Wikipedia
-Gran Turismo
-Pinballs en general
```

Agradecimientos Especiales al Creador de TIC-80 y a Sam Altman por crear ChatGPT.

Toda la música del juego es Open Source,acá están los nombres de los temas y el artista 
( Todos de la web OpenGameArt.org ) :

```
01-Magic_Cristal.wav - https://opengameart.org/content/magic-crystal
02-Happy8Bit.wav - https://opengameart.org/content/happy-8-bit
03-dog_in_car.wav - https://opengameart.org/content/dog-in-car-seamless-loop
04-airtheme.wav - https://opengameart.org/content/air-theme
05-

06-
07-
08-
09-
10-

11-
12-
13-
14-
15-
```

## 🎮 Notas
```
*Versión 1.0
*Ideas Descartadas : Ciclo Día / Noche
```

## 🎮 Links Utiles

-Itch.io ( Descarga del Juego )

-HTML5 ( Jugar juego en el Navegador )

-Contacto ( Pascua )

-Web del Creador de TIC-80

https://tic80.com/

-Donaciones

-Canal de YouTube del Juego

-ADVA ( Asociación de Desarrolladores de Videojuegos de Argentina )

-Twitter de AltaVista Games
