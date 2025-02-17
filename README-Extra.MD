## ⭐️ Inicio

### ✨️ Variables / Atributos

```
-- Variables
t = 0
indice_mensaje = 1
mensajes = {
"Alta Facha Games",
"Todos los derechos reservados 2025",
"by Pascua",
"Proyecto 2025"
}

-- Generar estrellas en posiciones aleatorias
estrellas = {}
for i = 1, 50 do
    table.insert(estrellas, {x = math.random(0, 239), y = math.random(0, 135)})
end
```

### 🎃 Funciones

#### 🔑-1  dibujar_texto_arcoiris( texto,x,y )

.

#### 🔑-2  dibujar_estrellas()

.

#### 🔑-3  TIC().

Bucle principal.

## ⭐️ Créditos

### ✨️ Variables / Atributos

```
-- Variables
t = 0
y = 136  -- Posición inicial de los créditos (fuera de la pantalla)

-- Texto de los créditos
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
estrellas = {}
for i = 1, 50 do
    table.insert(estrellas, {x = math.random(0, 239), y = math.random(0, 135)})
end
```

### 🎃 Funciones

#### 🔑-1  dibujar_texto_arcoiris ( texto,x,y )

.

#### 🔑-2  dibujar_estrellas()

.

#### 🔑-3  TIC().

Bucle principal.


## ⭐️ Nafta

### ✨️ Variables / Atributos

```
-- Configuración inicial
local car_x = 120  -- Posición inicial en X
local car_y = 68   -- Posición inicial en Y
local fuel = 50    -- Nafta inicial (cantidad total)
local max_fuel = 100 -- Capacidad máxima del tanque
local fuel_consumption = max_fuel / 300 -- Nafta consumida por frame
local speed = 1.5  -- Velocidad del coche en píxeles por frame
local money = 200  -- Dinero inicial en peluca$
local car_sprite = 0 -- ID del sprite del coche
local running = true -- Indica si el coche está funcionando

-- Estación de servicio
local station_x = 50
local station_y = 50
local station_width = 30
local station_height = 30
local refill_cost = 100 -- Costo de recargar el tanque
```

### 🎃 Funciones

#### 🔑-1 TIC().

Bucle principal.


## ⭐️ Moneda

### ✨️ Variables / Atributos

```
-- Variables
t = 0
x_personaje = 64  -- Posición inicial del personaje (horizontal)
y_personaje = 64  -- Posición inicial del personaje (vertical)
balanza = nil  -- La balanza estará inicialmente inactiva
velocidad = 1  -- Velocidad del personaje
direccion_balanza = 0  -- Dirección de la balanza (0 = no disparada, 1 = disparada hacia la derecha, -1 = disparada hacia la izquierda)
pos_balanza_x = 0  -- Posición X de la balanza
pos_balanza_y = 64  -- Posición Y de la balanza

-- Contador de balas
numero_balas = 20  -- Número inicial de balas
disparando = false  -- Estado de disparo
tiempo_frase = 0  -- Temporador para la frase
frase_actual = ""  -- Frase que se mostrará
tiempo_frase_mostrar = 0  -- Tiempo en que se mostró la última frase

-- Frases aleatorias
frases = {"yupi", "ya tengo crédito para la SUBA"}

-- Posición de los coches
coches = {
    {x = 120, y = 64, colisionado = false},  -- Primer coche
    {x = 120, y = 40, colisionado = false},  -- Coche arriba
    {x = 120, y = 88, colisionado = false},  -- Coche abajo
}

coche_explosion = false  -- Estado de la explosión
explosion_tiempo = 0  -- Temporizador para la animación de explosión
explosion_puntos = {}  -- Lista de puntos para la explosión

-- Variables para el poder del jugador
poder_jugador = 0  -- Poder que se mostrará al colisionar
poder_tiempo = 0  -- Tiempo en que se generó el poder
mostrar_poder = false  -- Indica si el poder debe mostrarse

-- Nueva variable para contar monedas
monedas = 0  -- Contador de monedas

-- Posición de las monedas normales
monedas_pos = {
    {x = 100, y = 50, recogida = false},
    {x = 150, y = 100, recogida = false},
    {x = 200, y = 120, recogida = false},
}

-- Posición de las monedas especiales
monedas_especiales_pos = {
    {x = 120, y = 80, recogida = false},
    {x = 180, y = 140, recogida = false},
    {x = 50, y = 40, recogida = false},
    {x = 220, y = 90, recogida = false},
    {x = 30, y = 130, recogida = false},
    {x = 170, y = 60, recogida = false},
}

-- Estado de compra
comprando_chori = false  -- Si está en proceso de comprar un chori
```

### 🎃 Funciones

#### 🔑-1  dibujar_personaje()

.

#### 🔑-2  dibujar_coches()

.

#### 🔑-3  dibujar_balanza()

.

#### 🔑-4  dibujar_monedas()

.

#### 🔑-5  dibujar_monedas_especiales()

.

#### 🔑-6  mover_personaje()

.

#### 🔑-7  detectar_colision_monedas()

.

#### 🔑-8  detectar_colision_monedas_especiales()

.

#### 🔑-9  mostrar_monedas()

.

#### 🔑-10  mostrar_frase()

.

#### 🔑-11  mostrar_opcion_comprar_chori()

.

#### 🔑-12  comprar_chori()

.

#### 🔑-13  mostrar_texto_abajo()

.

#### 🔑-14 TIC().

Bucle principal.


## ⭐️ Parada

### ✨️ Variables / Atributos

```

```

### 🎃 Funciones

#### 🔑-1  dibujar_personaje()

.

#### 🔑-2  dibujar_tarjeta_suba()

.

#### 🔑-3  mover_personaje()

.

#### 🔑-4  detectar_colision_tarjeta_suba()

.

#### 🔑-5  mostrar_mensaje_suba()

.

#### 🔑-6  cargar_suba()

.

#### 🔑-7  mostrar_saldos()

.

#### 🔑-8  mostrar_frase_carga()

.

#### 🔑-9  dibujar_parada()

.

#### 🔑-10  interactuar_con_parada()

.

#### 🔑-11  mover_colectivo()

.

#### 🔑-12  mostrar_texto_parada()

.

#### 🔑-13  mostrar_texto_colectivo()

.

#### 🔑-14  TIC().

Bucle principal.

## ⭐️ Menú de Pausa

### ✨️ Variables / Atributos

```

```

### 🎃 Funciones

#### 🔑-1  dibujar_texto_arcoiris(texto,x,y,color_seleccionado)

.

#### 🔑-2  dibujar_estrellas()

.

#### 🔑-3  dibujar_minimapa()

.

#### 🔑-4  dibujar_menu()

.

#### 🔑-5  TIC()

Bucle principal.


## ⭐️ Lector de Diarios

### ✨️ Variables / Atributos

```

```

### 🎃 Funciones

#### 🔑-1  dividir_texto_por_palabras(texto,max_caracteres)

.

#### 🔑-2  dibujar_diario()

.

#### 🔑-3  actualizar_scroll()

.

#### 🔑-4  TIC()

Bucle principal.


## ⭐️ Skate

### ✨️ Variables / Atributos

```

```

### 🎃 Funciones

#### 🔑-1 TIC()

Bucle principal.

### ⭐️ Jetpack

### ✨️ Variables / Atributos

```

```

### 🎃 Funciones

#### 🔑-1  add_spark(x,y,dx,dy,col)

.

#### 🔑-2  update_sparks()

.

#### 🔑-3  draw_sparks()

.

#### 🔑-4  TIC()

Bucle principal.


## ⭐️ Telescopio

### ✨️ Variables / Atributos

```

```

### 🎃 Funciones

#### 🔑-1  init()

.

#### 🔑-2  draw_star(x,y,color)

.

#### 🔑-3  draw_visible_stars()

.

#### 🔑-4  draw_visible_shooting_star()

.

#### 🔑-5  update_shooting_star()

.

#### 🔑-6  update_telescope()

.

#### 🔑-7  draw_telescope()

.

#### 🔑-8  TIC()

Bucle principal.


## ⭐️ Mensajes Moviles

### ✨️ Variables / Atributos

```

```

### 🎃 Funciones

#### 🔑-1  split_lines(text,max_width)

.

#### 🔑-2  print_rainbow(text,x,y)

.

#### 🔑-3  TIC()

Bucle principal.

## ⭐️ Teclado 1

### ✨️ Variables / Atributos

```

```

### 🎃 Funciones

#### 🔑-1  dibujar_teclado()

.

#### 🔑-2  mover_cursor()

.

#### 🔑-3  selecionar_tecla()

.

#### 🔑-4  dibujar_texto()

.

#### 🔑-5  dibujar_pantalla_correcta()

.

#### 🔑-6  TIC()

Bucle principal.


## ⭐️ Teclado 2

### ✨️ Variables / Atributos

```

```

### 🎃 Funciones

#### 🔑-1  draw_keyboard()

.

#### 🔑-2  handle_input()

.

#### 🔑-3  print_rainbow(text,x,y)

.

#### 🔑-4  TIC()

Bucle principal.


## ⭐️ Terremoto

### ✨️ Variables / Atributos

```

```

### 🎃 Funciones


#### 🔑-1  aplicar_temblor()

.

#### 🔑-2  TIC()

Bucle principal.
