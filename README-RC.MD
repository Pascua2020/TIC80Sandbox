# 🎭 RC ( Remote Control = Coches a Control Remoto )

![rc](./Imagenes/2.gif)

## 🎭 Elementos

#### 🎃-Editor de Pista

#### 🎃-Coches a Control Remoto

--Jugador 1

--Jugador 2

--IA

#### 🎃-Modo Jugar

--Controles de movimiento para 2 Jugadores

## ✨️Variables / Atributos

```
-- Configuración inicial

selected_sprite = 2

map_width = 30

map_height = 17

edit_mode = true

car_x = 64

car_y = 64

car_speed = 2

-- Configuración del coche IA

ia_car_x = 120

ia_car_y = 120

ia_angle = 0

ia_radius = 20

ia_speed = 0.05

local intiax = 0

local intiay = 0

-- Variables para el modo de 2 jugadores

two_player_mode = false

car2_x = 100

car2_y = 50

-- Variable para ocultar los cuadros

show_car_boxes = true
```

## 🎭 Funciones:

#### 🔑-1  print_with_border(text,x,y,text_color,border_color)

Dibuja texto con bordes.

#### 🔑-2  draw_sprite_selector()

Dibuja los sprites de selección.

#### 🔑-3  draw_car_boxes()

Dibuja cuadros para los coches.

#### 🔑-4  check_sprite_selector(mx,my)

Detecta clic en el selector.

#### 🔑-5  draw_erase_button()

Función de boton.

#### 🔑-6  draw_mode_button()

Función de boton.

#### 🔑-7  check_mode_button(mx,my)

Función de boton.

#### 🔑-8  draw_two_player_button()

Función de boton.

#### 🔑-9  check_two_player_button()

Función de boton.

#### 🔑-10  update_car()

Función de movimiento ( Jugador 1 ).

#### 🔑-11  update_car2()

Función de movimiento ( Jugador 2 ).

#### 🔑-12  update_ia_car()

Función de movimiento ( Coche controlado por IA ).

#### 🔑-13  draw_ia_car()

Dibuja coche de IA.

#### 🔑-14  draw_player_car()

Dibuja coche de Jugador 1.

#### 🔑-15  draw_player_car2()

Dibuja coche de Jugador 2.

#### 🔑-16  TIC()

Bucle principal.
