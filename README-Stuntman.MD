# 🎭 Stuntman

![gifcoche](./Imagenes/subircoche.gif)

### 🎭 Ambientación

Estudios de Cine "Choriwood",Argentina

### 🎭 Descripción de la Mision

Misión: El Kamikaze del Cine

Jefe: Silvestre Stacchotta

Objetivo: Rodar exitosamente una escena de doble de películas con el coche.

### 🌇Mecanica 1

![st1](./Imagenes/st1.jpg)

Subir a coche.

![stu1](./Imagenes/stu1.gif)

### 🎆Dialogo 1
```
"Silvestre Stacchotta: Good day wacho, altas llantas.",
"Silvestre Stacchotta: Perdón, estoy un poco enturrecido desde que estoy en Buenos Aires.",
"Silvestre Stacchotta: A diferencia de mi hogar en Los Guapos Country de Los Angeles,",
"Silvestre Stacchotta: la Fucking humedad de Buenos Aires está más fuerte que rusas en bikini.",
"Silvestre Stacchotta: En fin wacho, súbete al coche. Solo tienes 5 segundos.",
"Pulsa B para subir al coche."
```
### 🌇Mecanica 2

![st2](./Imagenes/st2.jpg)

Arrollar cajas con el coche.

![stu2](./Imagenes/stu2.gif)

### 🎆Dialogo 2
```
"Silvestre Stacchotta: Ahora arrolla esas malditas cajas."
```
### 🌇Mecanica 3

![st3](./Imagenes/st3.jpg)

Activar nitro para llegar a checkpoint.

![stu3](./Imagenes/stu3.gif)

### 🎆Dialogo 3
```
"Silvestre Stacchotta: Ahora eres un fucking meteorito,activa el nitro tardigrado de bosnia."
```

### 🌇Mecanica 4

![st4](./Imagenes/st4.jpg)

Disparar desde el coche para destruir a la caja plateada ( no se puede destruir pisandola ).

![stu4](./Imagenes/stu4.gif)

### 🎆Dialogo 4
```
"Silvestre Stacchotta: Ahora tenes que dispararle desde el coche a esa caja malvada,solo puedes destruirla asi,lince del oblast de kursk."
```
### 🌇Mecanica 5

![st5](./Imagenes/st5.jpg)

Usar rampa para saltar.

![stu5](./Imagenes/stu5.gif)

### 🎆Dialogo 5
```
"Silvestre Stacchotta: Lince, tenés que usar esa rampa para volar como los dioses del asfalto."
```
### 🌇Mecanica 6

![st6](./Imagenes/st6.jpg)

Esquivar coches.

![stu6](./Imagenes/stu6.gif)

### 🎆Dialogo 6
```
"Silvestre Stacchotta: Mas vale que esquives esos coches porque me estoy enturreciendo mal ."
```
### 🌇Mecanica 7

![st7](./Imagenes/st7.jpg)

Perseguir coche.

![stu7](./Imagenes/stu7.gif)

### 🎆Dialogo 7
```
"Silvestre Stacchotta: Ahí va el infeliz que me robó mi chorinesa (choripán con milanesa), ¡a por el wacho de Nunavut!"
```
### 🌇Mecanica 8

![st8](./Imagenes/st8.jpg)

Saltar por el aro pero solo cuando no este en llamas.

![gifaro](./Imagenes/gifaro.gif)

### 🎆Dialogo 8
```
"Silvestre Stacchotta: Do you have enough chechona?",
"Salta por el aro, pero no te quemes."
```
### 🌇Mecanica 9

![st9](./Imagenes/st9.jpg)

Esquivar tren.

![stu9](./Imagenes/stu9.gif)

### 🎆Dialogo 9
```
"Silvestre Stacchotta: Esquiva el maldito tren así llegas al final y posteamos algo en Egogram."
```
### 🌇Mecanica 10

![st10](./Imagenes/st10.jpg)

Salir del coche para hacerlo detonar,pero a distancia.

![stu10](./Imagenes/stu10.gif)

### 🎆Dialogo 10
```
"Silvestre Stacchotta: Prepárate, conduce hacia el círculo violeta.",
"Silvestre Stacchotta: Una vez allí, presiona el botón para detonar la bomba."
```

## ✨️Variables / Atributos

1
```
-- Configuración inicial
player_x, player_y = 30, 50

stacchotta_x, stacchotta_y = 80, 50

car_x, car_y = 120, 50

player_in_car = false

camera_x, camera_y = 0, 0 
-- Coordenadas iniciales de la cámara

player_speed = 1

car_speed = 3 
-- Velocidad aumentada para el coche

debug=0

-- Diálogo inicial
mission_description =
{ "Mision: El Kamikaze del Cine" ,
                      "Jefe: Silvestre Stacchotta" ,
                      "Objetivo: Rodar exitosamente una escena de doble de peliculas con el coche."}

dialogue = {
    "Silvestre Stacchotta: Good day wacho, altas llantas.",
    "Silvestre Stacchotta: Perdon, estoy un poco enturrecido desde que estoy en Buenos Aires.",
    "Silvestre Stacchotta: A diferencia de mi hogar en Los Guapos Country de Los Angeles,",
    "Silvestre Stacchotta: la Fucking humedad de Buenos Aires está más fuerte que rusas en bikini.",
    "Silvestre Stacchotta: En fin wacho, súbete al coche. Solo tienes 5 segundos.",
    "Pulsa B para subir al coche."
}

dialogue_index = 1

introindex=1

countdown = 5

game_state = "mission_intro" 
-- Estados: mission_intro, dialogue, countdown, in_car, finished

-- Objetivo 1-1
objective_status = "incomplete"
```

2
```
-- Configuración inicial
car_x, car_y = 30, 50

camera_x, camera_y = 0, 0 
-- Coordenadas iniciales de la cámara

car_speed = 3 
-- Velocidad del coche

-- Diálogo inicial
mission_description = "Misión: El Kamikaze del Cine\n" ..
                      "Jefe: Silvestre Stacchotta\n" ..
                      "Objetivo: Rodar exitosamente una escena de doble de películas chocando cajas."

dialogue = {
    "Silvestre Stacchotta: Ahora arrolla esas malditas cajas.",
}

dialogue_index = 1

countdown = 10

game_state = "mission_intro" 
-- Estados: mission_intro, dialogue, countdown, finished

-- Configuración de cajas
boxes = {}

for i = 1, 10 do
    table.insert(boxes, {x = math.random(50, 300), y = math.random(50, 200), active = true})
end

particles = {} 
-- Lista para partículas de explosión

-- Objetivo 1-2
objective_status = "incomplete"
```

3
```
car_x, car_y = 30, 50

camera_x, camera_y = 0, 0 
-- Coordenadas iniciales de la cámara

car_speed = 3 
-- Velocidad del coche

nitro_active = false 
-- Si el nitro está activado

-- Diálogo inicial

mission_description = "Misión: El Kamikaze del Cine\n" ..
                      "Jefe: Silvestre Stacchotta\n" ..
                      "Objetivo: Rodar exitosamente una escena de doble de películas chocando cajas."

dialogue = {
    "Silvestre Stacchotta: Ahora eres un fucking meteorito,activa el nitro tardigrado de bosnia.",
}

dialogue_index = 1

countdown = 10

game_state = "mission_intro" 
-- Estados: mission_intro, dialogue, countdown, finished

-- Configuración de cajas

boxes = {}

for i = 1, 10 do
    table.insert(boxes, {x = math.random(50, 300), y = math.random(50, 200), active = true})
end

particles = {} 
-- Lista para partículas de explosión

-- Objetivo 1-3
objective_status = "incomplete"

```

4
```
-- Configuración inicial
car_x, car_y = 30, 50

camera_x, camera_y = 0, 0 
-- Coordenadas iniciales de la cámara

car_speed = 3 
-- Velocidad del coche

nitro_active = false 
-- Si el nitro está activado

bullet_speed = 5 
-- Velocidad de las balas

bullet_size = 4 
-- Tamaño de las balas

bullets = {} 
-- Lista de balas

bullet_timer = 0 
-- Temporizador para evitar disparos rápidos

-- Diálogo inicial

mission_description = "Misión: El Kamikaze del Cine\n" ..
                      "Jefe: Silvestre Stacchotta\n" ..
                      "Objetivo: Destruir una caja disparando balas."

dialogue = {
    "Silvestre Stacchotta: Ahora tenes que dispararle desde el coche a esa caja malvada,solo puedes destruirla asi,lince del oblast de kursk.",
}

dialogue_index = 1

countdown = 10

game_state = "mission_intro" 
-- Estados: mission_intro, dialogue, countdown, finished

-- Configuración de la caja

box = {x = 200, y = 100, active = true, health = 3} -- Caja con 3 de vida

particles = {} 
-- Lista para partículas de explosión

-- Objetivo 1-4
objective_status = "incomplete"

```

5
```
-- Configuración inicial

car_x, car_y = 30, 50

camera_x, camera_y = 0, 0 
-- Coordenadas iniciales de la cámara

car_speed = 3 
-- Velocidad del coche

nitro_active = false 
-- Si el nitro está activado

jumping = false 
-- Si el coche está saltando

jump_height = 0 
-- Altura del salto

jump_speed = 2 
-- Velocidad del salto (aumentado)

jump_distance = 50 
-- Distancia del salto (aumentado)

jumping_timer = 0 
-- Temporizador del salto

-- Diálogo inicial
mission_description = "Misión: El Salto de la Rampa\n" ..
                      "Jefe: Silvestre Stacchotta\n" ..
                      "Objetivo: Saltar sobre una rampa para ganar distancia."

dialogue = {
    "Silvestre Stacchotta: Lince, tenés que usar esa rampa para volar como los dioses del asfalto.",
}

dialogue_index = 1

countdown = 10

game_state = "mission_intro" 
-- Estados: mission_intro, dialogue, countdown, finished

-- Configuración de la rampa
ramp = {x = 150, y = 80} 
-- Coordenadas de la rampa

-- Objetivo 1-5
objective_status = "incomplete"
```

6
```
-- Configuración inicial

car_x, car_y = 30, 50

camera_x, camera_y = 0, 0 
-- Coordenadas iniciales de la cámara

car_speed = 3 
-- Velocidad del coche

nitro_active = false 
-- Si el nitro está activado

jumping = false 
-- Si el coche está saltando

jump_height = 0 
-- Altura del salto

jump_speed = 2 
-- Velocidad del salto (aumentado)

jump_distance = 50 
-- Distancia del salto (aumentado)

jumping_timer = 0 
-- Temporizador del salto

-- Diálogo inicial
mission_description = "Misión: El Salto de la Rampa\n" ..
                      "Jefe: Silvestre Stacchotta\n" ..
                      "Objetivo: Saltar sobre una rampa para ganar distancia."

dialogue = {
    "Silvestre Stacchotta: Mas vale que esquives esos coches porque me estoy enturreciendo mal .",
}

dialogue_index = 1

countdown = 5

game_state = "mission_intro" 
-- Estados: mission_intro, dialogue, countdown, finished

-- Configuración de la rampa
ramp = {x = 150, y = 80} 
-- Coordenadas de la rampa

-- Objetivo 1-6: Esquivar coches durante 5 segundos
objective_status = "incomplete"

cars = {}

car_spawn_timer = 0

time_avoided = 0 
-- Tiempo en segundos que el coche ha estado esquivando coches sin colisiones

```

7
```
- Configuración inicial
car_x, car_y = 30, 50

camera_x, camera_y = 0, 0 
-- Coordenadas iniciales de la cámara

car_speed = 3 
-- Velocidad del coche

nitro_active = false 
-- Si el nitro está activado

jumping = false 
-- Si el coche está saltando

jump_height = 0 
-- Altura del salto

jump_speed = 2 
-- Velocidad del salto (aumentado)

jump_distance = 50 
-- Distancia del salto (aumentado)

jumping_timer = 0 
-- Temporizador del salto

-- Diálogo inicial

mission_description = "Misión: El Persecución del Coche\n" ..
                      "Jefe: Silvestre Stacchotta\n" ..
                      "Objetivo: Perseguir al coche por 10 segundos para ganar."

dialogue = {
    "Silvestre Stacchotta: Ahí va el infeliz que me robó mi chorinesa (choripán con milanesa), ¡a por el wacho de Nunavut!",
}

dialogue_index = 1

countdown = 10 
-- Tiempo para la misión en segundos

game_state = "mission_intro" 
-- Estados: mission_intro, dialogue, countdown, finished

-- Configuración del coche a perseguir

target_car = {x = 40, y = math.random(10, 40), speed = 2, sprite_id = 50} 
-- Coche que el jugador debe perseguir

target_car_distance = 0 
-- Distancia entre el coche del jugador y el coche objetivo

chase_time = 0 
-- Tiempo de persecución

max_chase_time = 10 
-- Tiempo máximo de persecución en segundos

follow_range = 24 
-- Rango de seguimiento alrededor del coche objetivo

-- Objetivo 1-7: Perseguir al coche durante 10 segundos

objective_status = "incomplete"

```

8
```
-- Configuración inicial (igual que antes)

car_x, car_y = 30, 50

camera_x, camera_y = 0, 0

car_speed = 3

nitro_active = false

jumping = false

jump_height = 0

jump_speed = 2

jump_distance = 50

jumping_timer = 0

mission_description = "Misión: Aro en Llamas\n" ..
                      "Jefe: Silvestre Stacchotta\n" ..
                      "Objetivo: Salta por el aro sin tocar las llamas."

dialogue = {
    "Silvestre Stacchotta: Do you have enough chichón?",
    "Salta por el aro, pero no te quemes.",
}

dialogue_index = 1

countdown = 10

game_state = "mission_intro"

ramp = {x = 150, y = 80}

hoop = {x = 180, y = 40, state = "normal", timer = 0}

objective_status = "incomplete"

-- Partículas de llamas
particles = {}
```

9
```
 -- Configuración inicial

car_x, car_y = 30, 50

camera_x, camera_y = 0, 0 
-- Coordenadas iniciales de la cámara

car_speed = 3 
-- Velocidad del coche

nitro_active = false 
-- Si el nitro está activado

jumping = false 
-- Si el coche está saltando

jump_height = 0 
-- Altura del salto

jump_speed = 2 
-- Velocidad del salto (aumentado)

jump_distance = 50 
-- Distancia del salto (aumentado)

jumping_timer = 0 
-- Temporizador del salto

-- Diálogo inicial

mission_description = "Misión: Aro en Llamas\n" ..
                      "Jefe: Silvestre Stacchotta\n" ..
                      "Objetivo: Salta por el aro sin tocar las llamas y evita el tren."

dialogue = {
    "Silvestre Stacchotta: Esquiva el maldito tren así llegas al final y posteamos algo en Egogram.",
    "Salta por el aro, pero no te quemes. Y cuidado con el tren.",
}

dialogue_index = 1

countdown = 10

game_state = "mission_intro" 
-- Estados: mission_intro, dialogue, countdown, finished

-- Configuración de la rampa
ramp = {x = 150, y = 80} 
-- Coordenadas de la rampa

-- Configuración del aro
hoop = {x = 180, y = 40, state = "normal", timer = 0} 
-- Aro por donde pasar

-- Objetivo 1-9
objective_status = "incomplete"

-- Configuración del tren
train = 
{x = 120, y = -20, speed = 1, width = 2, height = 2, sprite_id = 49} 
-- Tren que se mueve de arriba a abajo

-- Configuración de los vagones

train_wagons = {
    {x = train.x, y = train.y}, 
-- Primer vagón
    {x = train.x, y = train.y - 32}, 
-- Segundo vagón (justo encima del primero)
    {x = train.x, y = train.y - 64}, 
-- Tercer vagón
    {x = train.x, y = train.y - 96}, 
-- Cuarto vagón
}


-- Configuración del círculo de victoria
victory_circle = { sx = 250, y = 40, radius = 10} 
-- Círculo para ganar

```

10
```
-- Configuración inicial
car_x, car_y = 30, 50

player_x, player_y = car_x, car_y 
-- Coordenadas iniciales del jugador

camera_x, camera_y = 0, 0 
-- Coordenadas iniciales de la cámara

car_speed, player_speed = 3, 2 
-- Velocidad del coche y del jugador

nitro_active = false 
-- Si el nitro está activado

in_car = true 
-- Estado del jugador (dentro o fuera del coche)

jumping = false 
-- Si el coche está saltando

game_state = "mission_intro" 
-- Estados: mission_intro, dialogue, countdown, explosion, final_escape, game_over

-- Diálogo inicial

mission_description = "Misión: Explosión Épica\n" ..
                      "Objetivo: Ve al círculo violeta y prepara la explosión."

dialogue = {
    "Prepárate, conduce hacia el círculo violeta.",
    "Una vez allí, presiona el botón para detonar la bomba.",
}

dialogue_index = 1

countdown = 10

-- Configuración del círculo de victoria

victory_circle = {x = 250, y = 40, radius = 10} 
-- Círculo violeta

bomb_prepared = false

explosion_timer = 0

explosion_radius = 40  
-- Radio de la explosión

explosion_complete = false 
-- Si la explosión se completó

```

## 🎭 Funciones:

#### ✨️Stuntman4 / Parte 1

##### 🔑-1  move_player()

.

##### 🔑-2  move_car()

.

##### 🔑-3  nueva_camara(x,y)

.

##### 🔑-4  update_camera()

.

##### 🔑-5  draw_text_multiline_with_bg
(Text,x,y,color,bg_color,max_width)

.

##### 🔑-6  TIC()

Bucle principal.

#### ✨️Stuntmanv2.1 / Parte 2

-1  move_player()

-2  move_car()

-3  nueva_camara(x,y)

-4  update_camera()

##### 🔑-5  generate_particles(x,y)

.

##### 🔑-6  update_and_draw_particles()

.

##### 🔑-7  check_collisions()

.

##### 🔑-8  draw_boxes()

.

-9  TIC()

#### ✨️Stuntmanv3.4 / Parte 3

-1  move_player()

-2  move_car()

-3  nueva_camara(x,y)

-4  update_camera()

-5  generate_particles(x,y)

-6  update_and_draw_particles()

-7  check_collisions()

-8  draw_boxes()

##### 🔑-9  draw_nitro_effect()

.

##### 🔑-10  draw_checkpoint()

.

##### 🔑-11  check_checkpoint_collision()

.

-12  TIC()

#### ✨️Stuntmanv4.3 / Parte 4

-1  move_car()

-2  nueva_camara(x,y)

-3  update_camera()

-4  generate_particles(x,y)

-5  update_and_draw_particles()

-6  check_bullet_collisions()

##### 🔑-7  draw_box()

.

##### 🔑-8  draw_bullets()

.

##### 🔑-9  shoot_bullet()

.

##### 🔑-10  update_bullets()

.

-11  draw_nitro_effect()

-12  check_checkpoint_collisions

-13 draw_text_multiline_with_bg
(Text,x,y,color,bg_color,max_width)

-14  TIC()

#### ✨️Stuntmanv5.1 / Parte 5

-1  move_car()

-2  nueva_camara(x,y)

-3  update_camera()

-4  draw_text_multiline_with_bg
(Text,x,y,color,bg_color,max_width)

##### 🔑-5  draw_ramp()

.

##### 🔑-6  check_ramp_collision()

.

##### 🔑-7  handle_jump()

.

-8  draw_nitro_effect()

-9  TIC()

#### ✨️Stuntmanv6.2 / Parte 6

-1  move_car()

-2  nueva_camara(x,y)

-3  update_camera()

-4  draw_text_multiline_with_bg
(Text,x,y,color,bg_color,max_width)

-5  draw_ramp()

##### 🔑-6  spawn_car()

.

##### 🔑-7  draw_cars()

.

##### 🔑-8  check_car_collision()

.

-9  handle_jump()

-10  draw_nitro_effect()

-11  TIC()

#### ✨️Stuntmanv7.3 / Parte 7

-1  move_car()

-2  nueva_camara()

-3  update_camera()

##### 🔑-4  draw_target_car()

.

##### 🔑-5  draw_target_car_lost()

.

##### 🔑-6  draw_follow_range()

.

-7  TIC()

#### ✨️Stuntmanv8.2 / Parte 8

-1  spawn_particles()

-2  update_particles()

-3  draw_particles()

-4  move_car()

##### 🔑-5  draw_hoop()

.

##### 🔑-6  update_hoop()

.

##### 🔑-7  check_hoop_collision()

.

-8  handle_jump()

-9  draw_nitro_effect()

-10  check_ramp_collision()

-11  nueva_camara(x,y)

-12  update_camera()

-13  draw_ramp()

##### 🔑-14  draw_landing_circle()

.

-15  TIC()

#### ✨️Stuntmanv9.5 / Parte 9

-1  move_car()

-2  nueva_camara(x,y)

-3  update_camera()

-4  draw_ramp()

-5  draw_hoop()

##### 🔑-6  draw_victory_circle()

.

-7  update_hoop()

-8  check_hoop_collision()

-9  check_victory_collision()

-10  check_ramp_collision()

##### 🔑-11  check_train_collision()

.

-12  handle_jump()

-13  draw_nitro_effect()

##### 🔑-14  move_train()

.

##### 🔑-15  draw_train()

.

-16  TIC()

#### ✨️Stuntmanv10.9 / Parte 10

-1  move_car()

-2  move_player()

-3  update_camera()

##### 🔑-4  draw_entities()

.

-5  draw_victory_circle()

-6  check_victory_collision()

##### 🔑-7  handle_explosion()

.

##### 🔑-8  exit_car()

.

##### 🔑-9  handle_game_over()

.

-10  TIC()
