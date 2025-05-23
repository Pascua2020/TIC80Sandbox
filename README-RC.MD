# 🎭 RC ( Remote Control = Coches a Control Remoto )

![cartucho](./Imagenes/CartuchoRC.png)

![rc](./Imagenes/2.gif)

## 🎭 Elementos

#### 🎃 Editor de Pista

Se edita con el Mouse / Pantalla Tactil.Se pueden borrar los sprites dibujados de la pista.
Tiene sprites de Asfalto y Cesped.

#### 🎃 Coches a Control Remoto

Todos muestran sus coordenadas de X e Y en pantalla.

##### ✨️ Jugador 1

Se controla con los botones 0,1,2 y 3.

##### ✨️ Jugador 2

Se controla con los botones 4,5,6 y 7.

##### ✨️ IA

Tiene un patrón de movimiento automático.

#### 🎃 Modo Jugar

##### ✨️ Controles de movimiento para 2 Jugadores

## ✨️Variables / Atributos

```
1
selected_sprite = 2

2
map_width = 30

3
map_height = 17

4
edit_mode = true

5
car_x = 64

6
car_y = 64

7
car_speed = 2

-- Configuración del coche IA

8
ia_car_x = 120

9
ia_car_y = 120

10
ia_angle = 0

11
ia_radius = 20

12
ia_speed = 0.05

13
local intiax = 0

14
local intiay = 0

-- Variables para el modo de 2 jugadores

15
two_player_mode = false

16
car2_x = 100

17
car2_y = 50

-- Variable para ocultar los cuadros

18
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
