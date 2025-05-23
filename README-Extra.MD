## ⭐️ Inicio

![gifinicio](./Imagenes/inicio.gif)

### ✨️ Variables / Atributos

```
1
t = 0

2
indice_mensaje = 1

3
mensajes = {
"Alta Facha Games",
"Todos los derechos reservados 2025",
"by Pascua",
"Proyecto 2025"
}

-- Generar estrellas en posiciones aleatorias
4
estrellas = {}
for i = 1, 50 do
    table.insert(estrellas, 
{x = math.random(0, 239), 
y = math.random(0, 135)})
end
```

### 🎃 Funciones

#### 🔑-1  dibujar_texto_arcoiris( texto,x,y )

Función para dibujar texto con efecto arcoíris.

#### 🔑-2  dibujar_estrellas()

Función para dibujar estrellas con efecto arcoíris.

#### 🔑-3  TIC().

Bucle principal.

## ⭐️ Créditos

![gifcreditos](./Imagenes/creditos.gif)

### ✨️ Variables / Atributos

```
-- Variables
1
t = 0

2
y = 136  
-- Posición inicial de los créditos (fuera de la pantalla)

-- Texto de los créditos
3
creditos = {
			 "CREDITOS",
				"",
    "Director de Ética de IA: Pascua",
    "",
    "Generador de Contenido: ChatGPT",
    "",
    "Diseñador de Sprites: Pascua",
    "",
    "Director Ejecutivo de Código: ChatGPT",
    "",
    "Agradecimientos Especiales:",
    "",
    "- Chistes Random: Un tipo de internet",
}

-- Generar estrellas en posiciones aleatorias

4
estrellas = {}

5
for i = 1, 50 do
    table.insert
(estrellas, 
{x = math.random(0, 239), 
y = math.random(0, 135)})
end
```

### 🎃 Funciones

#### 🔑-1  dibujar_texto_arcoiris ( texto,x,y )

Función para dibujar texto con efecto arcoíris.

#### 🔑-2  dibujar_estrellas()

Función para dibujar estrellas con efecto arcoíris.

#### 🔑-3  TIC().

Bucle principal.

## ⭐️ Nafta

![gifnafta](./Imagenes/gifnafta.gif)

### ✨️ Variables / Atributos

```
1
local car_x = 120  
-- Posición inicial en X

2
local car_y = 68   
-- Posición inicial en Y

3
local fuel = 50    
-- Nafta inicial (cantidad total)

4
local max_fuel = 100 
-- Capacidad máxima del tanque

5
local fuel_consumption = max_fuel / 300 
-- Nafta consumida por frame

6
local speed = 1.5  
-- Velocidad del coche en píxeles por frame

7
local money = 200  
-- Dinero inicial en peluca$

8
local car_sprite = 0 
-- ID del sprite del coche

9
local running = true 
-- Indica si el coche está funcionando

-- Estación de servicio
10
local station_x = 50

11
local station_y = 50

12
local station_width = 30

13
local station_height = 30

14
local refill_cost = 100 
-- Costo de recargar el tanque
```

### 🎃 Funciones

#### 🔑-1 TIC().

Bucle principal.

## ⭐️ Moneda

![gifmoneda](./Imagenes/moneda.gif)

### ✨️ Variables / Atributos

```
1
t = 0

2
x_personaje = 64  
-- Posición inicial del personaje (horizontal)

3
y_personaje = 64  
-- Posición inicial del personaje (vertical)

4
balanza = nil  
-- La balanza estará inicialmente inactiva

5
velocidad = 1  
-- Velocidad del personaje

6
direccion_balanza = 0  
-- Dirección de la balanza 
(0 = no disparada, 
1 = disparada hacia la derecha, 
-1 = disparada hacia la izquierda)

7
pos_balanza_x = 0  
-- Posición X de la balanza

8
pos_balanza_y = 64  
-- Posición Y de la balanza

9
-- Contador de balas
numero_balas = 20  
-- Número inicial de balas

10
disparando = false  
-- Estado de disparo

11
tiempo_frase = 0  
-- Temporador para la frase

12
frase_actual = ""  
-- Frase que se mostrará

13
tiempo_frase_mostrar = 0  
-- Tiempo en que se mostró la última frase

-- Frases aleatorias
14
frases = 
{"yupi", 
"ya tengo crédito para la SUBA"}

-- Posición de los coches
15
coches = {
    {x = 120, y = 64, colisionado = false},  
-- Primer coche
    {x = 120, y = 40, colisionado = false},  
-- Coche arriba
    {x = 120, y = 88, colisionado = false},  
-- Coche abajo
}

16
coche_explosion = false  
-- Estado de la explosión

17
explosion_tiempo = 0  
-- Temporizador para la animación de explosión

18
explosion_puntos = {}  
-- Lista de puntos para la explosión

-- Variables para el poder del jugador

19
poder_jugador = 0  
-- Poder que se mostrará al colisionar

20
poder_tiempo = 0  
-- Tiempo en que se generó el poder

21
mostrar_poder = false  
-- Indica si el poder debe mostrarse

-- Nueva variable para contar monedas
22
monedas = 0  
-- Contador de monedas

-- Posición de las monedas normales
23
monedas_pos = {
    {x = 100, y = 50, recogida = false},
    {x = 150, y = 100, recogida = false},
    {x = 200, y = 120, recogida = false},
}

-- Posición de las monedas especiales
24
monedas_especiales_pos = {
    {x = 120, y = 80, recogida = false},
    {x = 180, y = 140, recogida = false},
    {x = 50, y = 40, recogida = false},
    {x = 220, y = 90, recogida = false},
    {x = 30, y = 130, recogida = false},
    {x = 170, y = 60, recogida = false},
}

-- Estado de compra
25
comprando_chori = false  
-- Si está en proceso de comprar un chori
```

### 🎃 Funciones

#### 🔑-1  dibujar_personaje()

Función para dibujar el personaje.

#### 🔑-2  dibujar_coches()

Función para dibujar los coches.

#### 🔑-3  dibujar_balanza()

Función para dibujar la balanza.

#### 🔑-4  dibujar_monedas()

Función para dibujar las monedas normales.

#### 🔑-5  dibujar_monedas_especiales()

Función para dibujar las monedas especiales.

#### 🔑-6  mover_personaje()

Función para mover el personaje.

#### 🔑-7  detectar_colision_monedas()

Función para detectar colisiones con las monedas normales.

#### 🔑-8  detectar_colision_monedas_especiales()

Función para detectar colisiones con las monedas especiales.

#### 🔑-9  mostrar_monedas()

Función para mostrar la cantidad de monedas.

#### 🔑-10  mostrar_frase()

Función para mostrar la frase en la pantalla.

#### 🔑-11  mostrar_opcion_comprar_chori()

Función para mostrar la opción de comprar un chori.

#### 🔑-12  comprar_chori()

Función para comprar un chori.

#### 🔑-13  mostrar_texto_abajo()

Función para mostrar el texto en la parte inferior.

#### 🔑-14 TIC().

Bucle principal.

## ⭐️ Parada

![gifsuba](./Imagenes/suba.gif)

### ✨️ Variables / Atributos

```
1
t = 0

2
x_personaje = 64  
-- Posición inicial del personaje (horizontal)

3
y_personaje = 64  
-- Posición inicial del personaje (vertical)

4
velocidad = 1  
-- Velocidad del personaje

-- Posición de la tarjeta SUBA
5
tarjeta_suba = {x = 100, y = 50, recogida = false}

-- Mensajes al recoger la tarjeta SUBA
6
mensaje_suba = ""

7
tiempo_mensaje = 0  
-- Temporizador para mostrar mensajes

-- Cantidad de Peluca$ que posee el jugador
8
peluca_saldo = 8000

-- Crédito inicial de la tarjeta SUBA
9
suba_credito = 0

-- Frases al cargar la SUBA
10
frases_carga = {
    "Ahora me puedo ir de joda",
    "Justo en la billetera",
    "Espero no llegar al saldo negativo",
    "Qué caro che"
}

11
frase_carga_actual = ""

12
tiempo_frase_carga = 0  
-- Temporizador para mostrar la frase de carga

-- Variables para el colectivo
13
colectivo = {
    x = 104,  
-- Posición inicial del colectivo (en el mapa)
    y = 32,   
-- Posición vertical
    moviendo = false  
-- Estado del colectivo (si está en movimiento)
}
```

### 🎃 Funciones

#### 🔑-1  dibujar_personaje()

Función para dibujar el personaje.

#### 🔑-2  dibujar_tarjeta_suba()

Función para dibujar la tarjeta SUBA.

#### 🔑-3  mover_personaje()

Función para mover el personaje.

#### 🔑-4  detectar_colision_tarjeta_suba()

Función para detectar colisión con la tarjeta SUBA.

#### 🔑-5  mostrar_mensaje_suba()

Función para mostrar los mensajes al recoger la tarjeta SUBA.

#### 🔑-6  cargar_suba()

Función para cargar Peluca$ a la tarjeta SUBA.

#### 🔑-7  mostrar_saldos()

Función para mostrar el saldo del jugador y la tarjeta SUBA.

#### 🔑-8  mostrar_frase_carga()

Función para mostrar la frase al cargar la SUBA.

#### 🔑-9  dibujar_parada()

Función para dibujar la parada.

#### 🔑-10  interactuar_con_parada()

Función para interactuar con la parada de colectivo.

#### 🔑-11  mover_colectivo()

Función para mover el colectivo.

#### 🔑-12  mostrar_texto_parada()

Función para mostrar el texto en la parada.

#### 🔑-13  mostrar_texto_colectivo()

Función para mostrar el texto del chofer del colectivo.

#### 🔑-14  TIC().

Bucle principal.

## ⭐️ Menú de Pausa

![gifpausa](./Imagenes/pausa.gif)

### ✨️ Variables / Atributos

```
1
t = 0

2
y = 136  
-- Posición inicial de los créditos

3
seleccion = 1  
-- Índice de la opción seleccionada

-- Opciones del menú
4
opciones_menu = {
    "Misiones",
    "Objetos",
    "Armas",
    "Vehiculos",
    "Estadísticas",
    "Enciclopedia",
    "DiosGPT"
}

-- Descripciones de cada opción
5
descripciones_menu = {
    "Explora diferentes misiones",
    "Accede a tus objetos",
    "Consulta tus armas disponibles",
    "Gestiona tus vehículos",
    "Revisa tus estadísticas",
    "Consulta la enciclopedia",
    "Accede a DiosGPT"
}

-- Generar estrellas en posiciones aleatorias

6
estrellas = {}

7
for i = 1, 50 do
    table.insert(estrellas, 
{x = math.random(0, 239), 
y = math.random(0, 135)})
end
```

### 🎃 Funciones

#### 🔑-1  dibujar_texto_arcoiris(texto,x,y,color_seleccionado)

Función para dibujar texto con efecto arcoíris.

#### 🔑-2  dibujar_estrellas()

Función para dibujar estrellas con efecto arcoíris.

#### 🔑-3  dibujar_minimapa()

Función para dibujar el minimapa simulado.

#### 🔑-4  dibujar_menu()

Función para dibujar el menú.

#### 🔑-5  TIC()

Bucle principal.

## ⭐️ Lector de Diarios

![gifdiario](./Imagenes/gifdiario.gif)

### ✨️ Variables / Atributos

```
1
scroll = 0

2
scroll_max = 480 
-- Máximo desplazamiento ajustado para el contenido visible
```

### 🎃 Funciones

#### 🔑-1  dividir_texto_por_palabras(texto,max_caracteres)

Función para dividir texto en líneas según palabras.

#### 🔑-2  dibujar_diario()

Función para dibujar el diario.

#### 🔑-3  actualizar_scroll()

Función para actualizar la posición del scroll.

#### 🔑-4  TIC()

Bucle principal.

## ⭐️ Skate

![gifskate](./Imagenes/skate.gif)

### ✨️ Variables / Atributos

```
-- Posición inicial del skate
1
local x, y = 120, 68

2
local mounted_right_to_left = false  
-- Estado para saber si el skate se está montando de derecha a izquierda

3
local mounted_left_to_right = false  
-- Estado para saber si el skate se está montando de izquierda a derecha

4
local sparks = {}  
-- Lista para almacenar las posiciones de las chispas
```

### 🎃 Funciones

#### 🔑-1 TIC()

Bucle principal.

### ⭐️ Jetpack

![gifjetpack](./Imagenes/gifjetpack.gif)

### ✨️ Variables / Atributos

```
1
p = {x=120, y=68, spd=2, sparks={}}
```

### 🎃 Funciones

#### 🔑-1  add_spark(x,y,dx,dy,col)

Crea las particulas del jetpack.

#### 🔑-2  update_sparks()

Actualiza las particulas.

#### 🔑-3  draw_sparks()

Dibuja las particulas del jetpack en pantalla.

#### 🔑-4  TIC()

Bucle principal.

## ⭐️ Telescopio

![giftelescopio](./Imagenes/telescopio.gif)

### ✨️ Variables / Atributos

```
Ninguna? ( en Init() )
```

### 🎃 Funciones

#### 🔑-1  init()

Inicializa valores ( estrellas,estrella fugaz y telescopio ).

#### 🔑-2  draw_star(x,y,color)

Dibuja un punto grande que parece estrella.

#### 🔑-3  draw_visible_stars()

Dibuja las estrellas solo si están dentro del círculo de la mira.

#### 🔑-4  draw_visible_shooting_star()

Dibuja la estrella fugaz solo si está dentro del círculo de la mira.

#### 🔑-5  update_shooting_star()

Actualiza la posicion actual de la estrella fugaz.

#### 🔑-6  update_telescope()

Controlar el movimiento de la mira con las teclas de dirección.

#### 🔑-7  draw_telescope()

Oscurece toda la pantalla y muestra el circulo de la mira.

#### 🔑-8  TIC()

Bucle principal.

## ⭐️ Mensajes Moviles

![gifsms](./Imagenes/gifsms.gif)

### ✨️ Variables / Atributos

```
1
t = 0

2
mostrar_mensaje = false

3
tiempo_mensaje = 0

-- Animación del ícono de WhatsApp

4
whatsapp_icons = {16, 32, 48}  
-- Ids de los íconos para la animación

5
icono_gato = 96                
-- Id del ícono del gato

6
frame_actual = 1               
-- Frame de animación actual

-- Datos del mensaje

7
remitente = "Gatito"

8
mensaje = "Miau miau miau ('Dame de comer, gil')"
```

### 🎃 Funciones

#### 🔑-1  dibujar_texto_con_contorno(texto, x, y, color_texto, color_contorno)

Función para mostrar texto con contorno.

#### 🔑-2  TIC()

Bucle principal.

## ⭐️ Teclado 1

![gifteclado](./Imagenes/teclado.gif)

### ✨️ Variables / Atributos

```
1
teclado = {
    {"Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"},
    {"A", "S", "D", "F", "G", "H", "J", "K", "L"},
    {"Z", "X", "C", "V", "B", "N", "M"},
    {"Enter", "Borrar"}
}

2
cursor_x = 1

3
cursor_y = 1

4
texto_escrito = ""

5
clave_correcta = "inglish"

6
pantalla_correcta = false

-- Tamaño de las teclas y posiciones iniciales

7
TECLA_ANCHO = 20

8
TECLA_ALTO = 10

9
ESPACIO_X = 5

10
ESPACIO_Y = 5

11
POS_X_INICIAL = 0

12
POS_Y_INICIAL = 40
```

### 🎃 Funciones

#### 🔑-1  dibujar_teclado()

Función para dibujar el teclado virtual.

#### 🔑-2  mover_cursor()

Función para manejar la entrada del usuario.

#### 🔑-3  selecionar_tecla()

Función para seleccionar una tecla.

#### 🔑-4  dibujar_texto()

Dibujar texto en la parte superior.

#### 🔑-5  dibujar_pantalla_correcta()

Pantalla de clave correcta.

#### 🔑-6  TIC()

Bucle principal.

## ⭐️ Teclado 2

![giftecladonum](./Imagenes/tecladonum.gif)

### ✨️ Variables / Atributos

```
1
local correct_password = "1234"  
-- La contraseña correcta

2
local input_password = ""        
-- La contraseña ingresada por el usuario

3
local message = ""               
-- Mensaje a mostrar

4
local selected_key = 1           
-- Tecla seleccionada (índice del teclado)

5
local keys = {
    "1", "2", "3",
    "4", "5", "6",
    "7", "8", "9",
    "0", "Borrar", "Enter"
}  
-- Teclas disponibles

-- Colores del arcoíris
6
local rainbow_colors = {8, 12, 11, 10, 9, 7, 6}

7
local color_offset = 0  
-- Offset para animar el arcoíris
```

### 🎃 Funciones

#### 🔑-1  draw_keyboard()

Función para mostrar el teclado numérico.

#### 🔑-2  handle_input()

Función para manejar la entrada del usuario.

#### 🔑-3  print_rainbow(text,x,y)

Función para mostrar texto con colores arcoíris animados.

#### 🔑-4  TIC()

Bucle principal.

## ⭐️ Terremoto

![gifterremoto](./Imagenes/terremoto.gif)

### ✨️ Variables / Atributos

```
1
t = 0

2
x = 5

3
y = 80  
-- Posición más cercana al límite inferior de la pantalla

-- Variables de desplazamiento

4
indice_frase = 1

5
temblor_intensidad = 5 
-- Aumenté la intensidad del temblor

6
temblor_duracion = 30 
-- Duración del temblor en cuadros

7
temblor_tiempo = 0 
-- Contador de tiempo para duración del temblor
```

### 🎃 Funciones


#### 🔑-1  aplicar_temblor()

Función para generar el temblor.

#### 🔑-2  TIC()

Bucle principal.
