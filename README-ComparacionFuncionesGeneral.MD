## EfectosArcoiris

Teclado2 - 
PrintRainbow

```
-- Función para mostrar texto con colores arcoíris animados
function print_rainbow(text, x, y)
    local length = #text
    for i = 1, length do
        local color_index = (i + color_offset) % #rainbow_colors + 1
        print(text:sub(i, i), x + (i - 1) * 8, y, rainbow_colors[color_index])
    end
end
```

Wiki - 
PrintRainbow

```
-- Función para dibujar texto en arcoíris
function print_rainbow(text, x, y)
    local color_index = color_offset
    for i = 1, #text do
        local char = text:sub(i, i)
        local color = rainbow_colors[(color_index % #rainbow_colors) + 1]
        print(char, x, y, color)
        x = x + 6 
-- Avanzar posición horizontal
        color_index = color_index + 1
    end
end
```

MenuPausa - 
DibujarTextoArcoiris
```
-- Función para dibujar texto con efecto arcoíris
function dibujar_texto_arcoiris(texto, x, y, color_seleccionado)
    for i = 1, #texto do
        local letra = string.sub(texto, i, i)
        local color = (t // 5 + i) % 16  -- Efecto arcoíris
        -- Resaltar la opción seleccionada en azul
        if color_seleccionado then
            color = 12  
-- Azul
        end
        print(letra, x + (i - 1) * 6, y, color)
    end
end
```

Inicio - 
DibujarTextoArcoiris
```
-- Función para dibujar texto con efecto arcoíris
function dibujar_texto_arcoiris(texto, x, y)
    for i = 1, #texto do
        local letra = string.sub(texto, i, i)
        local color = (t // 5 + i) % 16  -- Efecto arcoíris
        print(letra, x + (i - 1) * 6, y, color)
    end
end
```

Creditos - 
DibujarTextoArcoiris
```
-- Función para dibujar texto con efecto arcoíris
function dibujar_texto_arcoiris(texto, x, y)
    for i = 1, #texto do
        local letra = string.sub(texto, i, i)
        local color = (t // 5 + i) % 16  -- Efecto arcoíris
        print(letra, x + (i - 1) * 6, y, color)
    end
end
```

GT - 
DibujarRectanguloArcoiris
```
-- Función para dibujar rectángulos con bordes arcoíris
function dibujar_rectangulo_arcoiris(x, y, w, h)
    for i = 0, 3 do
        local color = (color_arcoiris + i) % 16
        if i == 0 then
            line(x + i, y, x + w - i, y, color) 
-- Línea superior
        elseif i == 1 then
            line(x + i, y + h, x + w - i, y + h, color) 
-- Línea inferior
        elseif i == 2 then
            line(x, y + i, x, y + h - i, color) 
-- Línea izquierda
        else
            line(x + w, y + i, x + w, y + h - i, color) 
-- Línea derecha
        end
    end
end
```

## Todos los Check / Verificar

Baile - verificarFin
```
-- Verificar fin del juego
function verificar_fin()
    if fallos >= 10 then
        juego_activo = false
    end
end
```

Baile - verificarInput
```
-- Verificar input del jugador
function verificar_input()
    for _, flecha in ipairs(flechas) do
        if flecha.activa and flecha.y >= 16 and flecha.y <= 32 then
            if (btnp(2) and flecha.tipo == 1) or 
-- ←
               (btnp(3) and flecha.tipo == 4) or 
-- →
               (btnp(1) and flecha.tipo == 3) or 
-- ↑
               (btnp(0) and flecha.tipo == 2) then 
-- ↓
                flecha.activa = false
                flecha.acertada = true
                flecha.tiempo_acertada = 15 
-- Duración del efecto en cuadros
                puntuacion = puntuacion + 10 + combo * 2
                combo = combo + 1
            end
        end
    end
end
```

RC - checkEraseButton
```
function check_erase_button(mx, my)
    return mx >= 150 and mx <= 200 and my >= 10 and my <= 26
end
```

RC - checkModeButton
```
function check_mode_button(mx, my)
    return mx >= 200 and mx <= 260 and my >= 10 and my <= 26
end
```

RC - checkSpriteSelector
```
-- Función para detectar clic en el selector
function check_sprite_selector(mx, my)
    if my >= 10 and my <= 26 then
        for i = 2, 9 do
            local x = (i - 2) * 18 + 1
            if mx >= x and mx <= x + 16 then
                selected_sprite = i
                break
            end
        end
    end
end
```

RC - checkTwoPlayerButton
```
function check_two_player_button(mx, my)
    return mx >= 150 and mx <= 210 and my >= 0 and my <= 10
end
```

Trompo - checkCircleCollision
```
function check_circle_collision(player)
    for _, circle in ipairs(circles) do
        local dx = player.x - circle.x
        local dy = player.y - circle.y
        local distance = math.sqrt(dx * dx + dy * dy)
        if distance < 8 then
            if circle.color == 3 then
                player.life = player.life - 1
            elseif circle.color == 9 then
                player.life = player.life + 1
            end
        end
    end
end
```

Trompo - checkCollision
```
function check_collision()
    local dx = player1.x - player2.x
    local dy = player1.y - player2.y
    local distance = math.sqrt(dx * dx + dy * dy)
    if distance < 16 then
        player1.life = player1.life - 1
        player2.life = player2.life - 1

        for i = 1, 15 do
            add_particle((player1.x + player2.x) / 2, (player1.y + player2.y) / 2)
        end
    end
end
```

Trompo - checkGameOver
```
function check_game_over()
    if player1.life <= 0 and not game_over then
        winner = "Player 2"
        game_over = true
    elseif player2.life <= 0 and not game_over then
        winner = "Player 1"
        game_over = true
    end
end
```

## Todos los Update / Actualizar

Baile - actualizarFlechas
```
-- Actualizar flechas
function actualizar_flechas()
    for i = #flechas, 1, -1 do
        local flecha = flechas[i]
        if flecha.activa then
            flecha.y = flecha.y - 1
            if flecha.y < 0 then
                flecha.activa = false
                combo = 0
                fallos = fallos + 1
            end
        elseif flecha.acertada then
            flecha.tiempo_acertada = flecha.tiempo_acertada - 1
            if flecha.tiempo_acertada <= 0 then
                table.remove(flechas, i) -- Eliminar flecha después del efecto
            end
        end
    end
end
```

Baile - ActualizarFlechasEstaticas
```
-- Verificar botones para cambiar color de flechas estáticas
function actualizar_flechas_estaticas()
    if btnp(2) then flechas_estaticas[1] = true end 
-- ←
    if btnp(0) then flechas_estaticas[2] = true end 
-- ↓
    if btnp(1) then flechas_estaticas[3] = true end 
-- ↑
    if btnp(3) then flechas_estaticas[4] = true end 
-- →
end
```

Climatologia - updateEarthquake
```
-- Funciones de efectos de terremoto
-- Función de terremoto
function update_earthquake()
    -- Mueve la cámara o el "mapa" aleatoriamente dentro de los límites establecidos
    if earthquake_timer > 0 then
        earthquake_timer = earthquake_timer - 1
        local shake_x = math.random(-earthquake_intensity, earthquake_intensity)
        local shake_y = math.random(-earthquake_intensity, earthquake_intensity)
        -- Aquí movemos el contenido (simulando el terremoto) mediante un desplazamiento
        camera(shake_x, shake_y)
    else
        -- Resetear la cámara al estado normal cuando termine el terremoto
        camera(0, 0)
    end
end
```

Climatologia - updateLeaves
```
-- Actualiza las hojas
function update_leaves()
    for i, leaf in ipairs(leaves) do
        leaf.x = leaf.x + leaf.speed_x + math.sin(leaf.sway) * 0.5
        leaf.y = leaf.y + leaf.speed_y
        leaf.sway = leaf.sway + 0.1

        if leaf.y > 136 then
            leaf.y = math.random(-20, -1)
            leaf.x = math.random(0, 240)
        end
        if leaf.x < 0 then 
            leaf.x = math.random(0, 240)
        elseif leaf.x > 240 then
            leaf.x = math.random(0, 240)
        end
    end
end
```

Climatologia - updateLightning
```
-- Actualiza el estado del relámpago
function update_lightning()
    if lightning_active then
        lightning_timer = lightning_timer - 1
        if lightning_timer <= 0 then
            lightning_active = false
        end
    else
        if math.random(0, 20) == 0 then
            lightning_active = true
            lightning_timer = lightning_flash_duration
        end
    end
end
```

Climatologia - updateRaindrops
```
-- Actualiza las gotas de lluvia
function update_raindrops()
    for i, drop in ipairs(raindrops) do
        drop.y = drop.y + drop.speed
        if drop.y > 136 then
            drop.y = math.random(-20, -1)
            drop.x = math.random(0, 240)
        end
    end
end
```

Climatologia - updateSnowflakes
```
-- Actualiza los copos de nieve
function update_snowflakes()
    for i, flake in ipairs(snowflakes) do
        flake.x = flake.x + flake.sway
        flake.y = flake.y + flake.speed_y
        if flake.y > 136 then
            flake.y = math.random(-20, -1)
            flake.x = math.random(0, 240)
        end
        if flake.x < 0 then flake.x = 0 end
        if flake.x > 240 then flake.x = 240 end
    end
end
```

Climatologia - updateWind
```
-- Actualiza las líneas de viento
function update_wind()
    for i, line in ipairs(wind_lines) do
        line.x = line.x - wind_speed
        line.phase = line.phase + 4
        if line.x + 240 < 0 then
            line.x = 240
            line.y = math.random(0, 136)
            line.amplitude = math.random(5, 10)
            line.frequency = math.random(10, 20)
            line.phase = math.random(0, 360)
        end
    end
end
```

DiosGPT - actualizarColorTriangulo
```
-- Función para actualizar el color del triángulo a cada segundo (arcoíris)
function actualizar_color_triangulo()
    local t = time() / 40 -- Obtiene el tiempo actual en segundos
    local colores = {0,1,2,3,4,5,6,7,8,9,10,11, 12, 13, 14, 15, 8}  -- Colores para el arcoíris (puedes ajustarlos)
    color_triangulo = colores[math.floor(t) % #colores + 1]  -- Cambiar el color cada segundo
end
```
Jetpack - updateSparks
```
function update_sparks()
    for i = #p.sparks, 1, -1 do
        local s = p.sparks[i]
        s.x = s.x + s.dx
        s.y = s.y + s.dy
        s.life = s.life - 1
        if s.life <= 0 then
            table.remove(p.sparks, i)
        end
    end
end
```
Telescopio - updateShootingStar
```
function update_shooting_star()
    -- Agregar la posición actual a la cola
    table.insert(shooting_star.trail, 1, {x = shooting_star.x, y = shooting_star.y})

    -- Limitar la longitud de la cola
    if #shooting_star.trail > 10 then
        table.remove(shooting_star.trail)
    end

    -- Mueve la estrella fugaz de derecha a izquierda
    shooting_star.x = shooting_star.x - 3
    shooting_star.y = shooting_star.y + 1

    -- Si la estrella fugaz sale de la pantalla, reiníciala
    if shooting_star.x < 0 or shooting_star.y > 135 then
        shooting_star.x = 240
        shooting_star.y = math.random(0, 50)
        shooting_star.trail = {} -- Reinicia la cola
    end
end
```

Telescopio - updateTelescope
```
function update_telescope()
    -- Controlar el movimiento de la mira con las teclas de dirección
    if btn(0) then telescope.y = math.max(telescope.y - 2, telescope.radius) end -- Arriba
    if btn(1) then telescope.y = math.min(telescope.y + 2, 135 - telescope.radius) end -- Abajo
    if btn(2) then telescope.x = math.max(telescope.x - 2, telescope.radius) end -- Izquierda
    if btn(3) then telescope.x = math.min(telescope.x + 2, 239 - telescope.radius) end -- Derecha
end
```
Trompo - updateCircles
```
function update_circles()
    for _, circle in ipairs(circles) do
        circle.x = circle.x + math.random(-1, 1)
        circle.y = circle.y + math.random(-1, 1)
    end
end
```

Trompo - updateParticles
```
function update_particles()
    for i = #particles, 1, -1 do
        local p = particles[i]
        p.x = p.x + p.dx
        p.y = p.y + p.dy
        p.life = p.life - 1
        if p.life <= 0 then
            table.remove(particles, i)
        end
    end
end
```

Trompo - updateRainbowPoints
```
function update_rainbow_points()
    for _, point in ipairs(rainbow_points) do
        point.timer = point.timer + 1
        point.color = (point.color + 1) % 16  -- Cambiar de color con el tiempo
    end
end
```

## Todos los Draw / Dibujar

Baile - dibujarBase
```
-- Dibujar flechas fijas de referencia
function dibujar_base()
    for i, x in ipairs(posiciones) do
        if flechas_estaticas[i] then
            spr(48 + i - 1, x, 16, 0, 2) -- Flechas de color al presionar el botón
        else
            spr(16 + i - 1, x, 16, 0, 2) -- Flechas fijas en la parte superior
        end
    end
end
```

Baile - dibujarCancion
```
-- Dibujar la frase de la canción en la pantalla
function dibujar_cancion()
				print("Artista : DiosGPT",10,100,3)
				print("Cancion : Romance IA - Marciano \n(Album xxIAxx : 2025)",10,110,3)
    print(frases_cancion[indice_frase], 10, 125, 7) -- Dibuja la frase en la parte inferior
end
```

Baile - dibujarEstrellas
```
-- Dibujar fondo con estrellas
function dibujar_estrellas()
    for _, estrella in ipairs(estrellas) do
        -- Dibujar estrella
        pix(estrella.x, estrella.y, 7)
        -- Mover la estrella
        estrella.y = estrella.y + estrella.velocidad
        if estrella.y > 136 then
            estrella.y = 0
            estrella.x = math.random(0, 240)
        end
    end
end
```

Baile - dibujarEstrellasFugaces
```
-- Dibujar estrellas fugaces
function dibujar_estrellas_fugaces()
    for _, estrella in ipairs(estrella_fugaz) do
        -- Dibujar estrella fugaz
        for i = 0, estrella.longitud - 1 do
            pix(estrella.x - i, estrella.y + i, 7)
        end
        -- Mover la estrella fugaz
        estrella.x = estrella.x + 1
        estrella.y = estrella.y + estrella.velocidad
        if estrella.x > 240 or estrella.y > 136 then
            -- Generar nueva estrella fugaz si sale de la pantalla
            estrella.x = math.random(0, 240)
            estrella.y = 0
            estrella.longitud = math.random(4, 10)
            estrella.velocidad = math.random(4, 8)
        end
    end
end
```

Baile - dibujarFin
```
-- Pantalla de fin de juego
function dibujar_fin()
    cls(0)
    print("Juego Terminado", 80, 60, 12)
    print("Puntos finales: " .. puntuacion, 60, 80, 11)
    print("Presiona A para reiniciar", 50, 100, 7)
end
```

Baile - dibujarFlechas
```
-- Dibujar flechas que suben
function dibujar_flechas()
    for _, flecha in ipairs(flechas) do
        if flecha.activa then
            spr(16 + flecha.tipo - 1, flecha.x, flecha.y, 0, 2)
        elseif flecha.acertada then
            -- Cambia a un sprite o color diferente durante el tiempo de acierto
            spr(flecha.tipo + 31, flecha.x, flecha.y, 0, 2)
        end
    end
end
```

Baile - dibujarPuntuacion
```
-- Dibujar puntuación, combo y fallos
function dibujar_puntuacion()
    print("Puntos: " .. puntuacion, 180, 10, 7)
    print("Combo: " .. combo, 180, 20, 7)
    print("Fallos: " .. fallos, 180, 30, 7)
end
```

Climatologia - drawLeaves
```
-- Dibuja las hojas
function draw_leaves()
    for _, leaf in ipairs(leaves) do
        spr(leaf.sprite_id, leaf.x, leaf.y) -- Dibujar cada hoja
    end
end
```

Climatologia - drawLightning
```
-- Genera un rayo zigzagueante
function draw_lightning(x_start, y_start, segments, length)
    local x = x_start
    local y = y_start
    for i = 1, segments do
        local dx = math.random(-5, 5)
        local dy = math.random(5, length)
        local x_end = x + dx
        local y_end = y + dy
        line(x, y, x_end, y_end, 4)
        x = x_end
        y = y_end
        if y > 136 then break end
    end
end
```

Climatologia - drawLightningEffect
```
-- Dibuja el efecto de relámpago
function draw_lightning_effect()
    if lightning_active then
        rect(0, 0, 240, 136, 15)
        for i = 1, math.random(1, 3) do
            local x_start = math.random(20, 220)
            draw_lightning(x_start, 0, math.random(5, 10), math.random(10, 20))
        end
    end
end
```

Climatologia - drawMenu
```
-- Dibuja el menú
function draw_menu()
    print("Press 1: Toggle Rain", 5, 5, 12)
    print("Press 2: Toggle Leaves", 5, 15, 12)
    print("Press 3: Toggle Snow", 5, 25, 12)
    print("Press 4: Toggle Wind", 5, 35, 12)
    print("Press 5: Toggle Lightning", 5, 45, 12)
    print("Press 6: Toggle Earthquake", 5, 55, 12)  -- Botón 6 agregado para el terremoto
    print("Rain: " .. tostring(effects.rain), 5, 65, effects.rain and 11 or 8)
    print("Leaves: " .. tostring(effects.leaves), 5, 75, effects.leaves and 11 or 8)
    print("Snow: " .. tostring(effects.snow), 5, 85, effects.snow and 11 or 8)
    print("Wind: " .. tostring(effects.wind), 5, 95, effects.wind and 11 or 8)
    print("Lightning: " .. tostring(effects.lightning), 5, 105, effects.lightning and 11 or 8)
    print("Earthquake: " .. tostring(effects.earthquake), 5, 115, effects.earthquake and 11 or 8)
end
```

Climatologia - drawRaindrops
```
-- Dibuja las gotas de lluvia
function draw_raindrops()
    for _, drop in ipairs(raindrops) do
        rect(drop.x, drop.y, 2, 6, 9) -- Dibujar cada gota
    end
end
```

Climatologia - drawSnowflakes
```
-- Dibuja los copos de nieve
function draw_snowflakes()
    for _, flake in ipairs(snowflakes) do
          spr(32, flake.x, flake.y) -- Dibujar cada hoja
    end
end
```

Climatologia - drawWind
```
-- Dibuja el viento (líneas)
function draw_wind()
    for _, line in ipairs(wind_lines) do
        for i = 0, line.amplitude do
            local y = line.y + math.sin(line.phase + i * line.frequency / 240) * 5
            pix(line.x + i, y, 7)
        end
    end
end
```
DiosGPT - dibujarTriangulo
```
-- Función para dibujar el triángulo (icono de DiosGPT)
function dibujar_triangulo(x, y, color)
    tri(x - 5, y + 5, x + 5, y + 5, x, y - 5, color)  -- Triángulo
end
```
Inicio - dibujarEstrellas
```
-- Función para dibujar estrellas con efecto arcoíris
function dibujar_estrellas()
    for _, estrella in ipairs(estrellas) do
        local color = (t // 5 + estrella.x + estrella.y) % 16
        pix(estrella.x, estrella.y, color)
    end
end
```
Jetpack - drawSparks
```
function draw_sparks()
    for _, s in ipairs(p.sparks) do
        pix(s.x, s.y, s.col)
    end
end
```
MenuPausa - dibujarEstrellas
```
-- Función para dibujar estrellas con efecto arcoíris
function dibujar_estrellas()
    for _, estrella in ipairs(estrellas) do
        local color = (t // 5 + estrella.x + estrella.y) % 16
        pix(estrella.x, estrella.y, color)
    end
end
```
MenuPausa - dibujarMenu
```
-- Función para dibujar el menú
function dibujar_menu()
    -- Dibujar las opciones del menú
    for i, opcion in ipairs(opciones_menu) do
        local y_pos = 16 + (i - 1) * 10  -- Espaciado de 10 píxeles entre opciones
        local seleccionado = (i == seleccion)  -- Verificar si la opción está seleccionada
        dibujar_texto_arcoiris(opcion, 20, y_pos, seleccionado)
    end

    -- Dibujar la descripción de la opción seleccionada
    local descripcion_y_pos = 16 + #opciones_menu * 10 + 5  -- Posición debajo de las opciones
    dibujar_texto_arcoiris(descripciones_menu[seleccion], 20, descripcion_y_pos+20, false)
end
```
MenuPausa - dibujarMiniMapa
```
-- Función para dibujar el minimapa simulado
function dibujar_minimapa()
    -- Rectángulo simulado para el minimapa (a la derecha de la pantalla)
    rect(160, 16, 64, 64, 12)  -- Minimap area
    -- Aquí puedes agregar detalles como un punto o líneas que simulen un mapa
    rect(170, 26, 20, 20, 8)  -- Simulación de un punto en el minimapa
    print("Mapa",160,0,3)
    print("Descripcion",10,100,14)
    print("Flechas - Moverse",120,85,14)
    print("Boton A - Seleccionar",120,95,3)
				spr(0,115,10)
				print("(P)NV1",125,12,3)
				spr(16,115,20)
				print("(V)NV1",125,22,3)
				spr(32,115,30)
				print("(A)NV1",125,32,3)

end
```
Moneda - dibujarBalanza
```
-- Función para dibujar la balanza
function dibujar_balanza()
    if direccion_balanza ~= 0 then  -- Si la balanza ha sido disparada
        spr(16, pos_balanza_x, pos_balanza_y)  -- Dibujar el sprite de la balanza (id = 16)
    end
end
```
Moneda - dibujarCoches
```
-- Función para dibujar los coches
function dibujar_coches()
    for i, coche in ipairs(coches) do
        if not coche.colisionado then  -- Solo dibujar coches que no hayan colisionado
            spr(48, coche.x, coche.y)  -- Dibujar el sprite del coche (id = 48)
        end
    end
end
```
Moneda - dibujarMonedas
```
-- Función para dibujar las monedas normales
function dibujar_monedas()
    for _, moneda in ipairs(monedas_pos) do
        if not moneda.recogida then  -- Solo dibujar las monedas no recogidas
            spr(80 + (t % 3), moneda.x, moneda.y)  -- Dibujar el sprite animado de la moneda
        end
    end
end
```
Moneda - dibujarMonedasEspeciales
```
-- Función para dibujar las monedas especiales
function dibujar_monedas_especiales()
    for _, moneda in ipairs(monedas_especiales_pos) do
        if not moneda.recogida then  -- Solo dibujar monedas no recogidas
            spr(83 + (t % 3), moneda.x, moneda.y)  -- Animar usando los sprites 83, 84, 85
        end
    end
end
```
Moneda - dibujarPersonaje
```
-- Función para dibujar el personaje
function dibujar_personaje()
    spr(0, x_personaje, y_personaje)  -- Dibujar el sprite del personaje
end
```
Parada - dibujarParada
```
-- Función para dibujar la parada
function dibujar_parada()
    -- Dibujar el sprite de la parada en la posición (5, 3)
    spr(128, 5 * 8, 3 * 8, 0)  -- Asegúrate de que este sprite sea adecuado
end
```

Parada - dibujarPersonaje
```
-- Función para dibujar el personaje
function dibujar_personaje()
    spr(0, x_personaje, y_personaje)  -- Dibujar el sprite del personaje
end
```

Parada - dibujarTarjetaSuba
```
-- Función para dibujar la tarjeta SUBA
function dibujar_tarjeta_suba()
    if not tarjeta_suba.recogida then  -- Solo dibujar si no ha sido recogida
        spr(96, tarjeta_suba.x, tarjeta_suba.y)  -- Sprite animado con ID 96
    end
end
```

Pinball - drawPaddle
```
-- Dibujar una paleta como línea rotada
local function draw_paddle(paddle)
    local x1 = paddle.x
    local y1 = paddle.y
    local x2, y2
    x2 = paddle.x + paddle.length * math.cos(paddle.angle)
    y2 = paddle.y - paddle.length * math.sin(paddle.angle)
    if paddle==paddle_right then 
    line(x1, y1, x2, y2, colorpaletader)
    end
    if paddle==paddle_left then 
    line(x1, y1, x2, y2, colorpaletaizq)
    end
    if paddle==paddle_top_right then 
    line(x1, y1, x2, y2, colorpaletaarr)
    end
    if paddle==paddle_top_left then 
    line(x1, y1, x2, y2, colorpaletaaba)
    end
end
```

Pinball - drawPaddleCollision
```
function draw_paddle_collision(paddle)
    -- Coordenadas de los extremos de la paleta según su ángulo
    local x1 = paddle.x
    local y1 = paddle.y
    local x2 = paddle.x + paddle.length * math.cos(paddle.angle)
    local y2 = paddle.y - paddle.length * math.sin(paddle.angle)
    
    -- Grosor de la paleta para el área de colisión
    local thickness = paddle.thickness or 10  -- Puedes ajustar este valor

    -- Desplazamiento de los vértices por el grosor para crear un rectángulo
    local dx = thickness * math.cos(paddle.angle) / 2
    local dy = thickness * math.sin(paddle.angle) / 2

    -- Coordenadas de los 4 vértices del rectángulo de colisión
    local points = {
        {x1 + dy, y1 + dx},  -- Vértice 1
        {x2 + dy, y2 + dx},  -- Vértice 2
        {x2 - dy, y2 - dx},  -- Vértice 3
        {x1 - dy, y1 - dx},  -- Vértice 4
    }

    -- Dibuja líneas entre los vértices para visualizar el área de colisión
    for i = 1, #points do
        local next_point = points[(i % #points) + 1]
        line(points[i][1], points[i][2], next_point[1], next_point[2], 7) -- Color 7 (blanco)
    end
end
```

Pinball - drawSpring
```
-- Función para dibujar el resorte debajo de la bola
local function draw_spring()
    -- Estiramiento o compresión del resorte dependiendo de la velocidad vertical de la bola
    local spring_length = 10 + math.abs(ball.vy) -- Simula la compresión/expansión
    local start_y = ball.y + ball.radius + 10  -- Posición de inicio debajo de la bola

    -- Dibujar el resorte usando líneas pequeñas (simulación)
    for i = 0, spring_length, 2 do
        local color = (i % 4 == 0) and 11 or 8 -- Alternar colores para simular un resorte
        line(190, start_y + i-20, 205, start_y + i-20, color)
    end
end
```

Radio - dibujarTextoConContorno
```
-- Función para dibujar texto con contorno blanco y texto naranja
function dibujar_texto_con_contorno(texto, x, y, color_texto, color_contorno)
    -- Dibujar contorno blanco desplazado en 8 direcciones alrededor del texto
    for dx = -1, 1 do
        for dy = -1, 1 do
            if dx ~= 0 or dy ~= 0 then
                print(texto, x + dx, y + dy, color_contorno)
            end
        end
    end
    -- Dibujar texto principal en color naranja (12 es el código del color naranja)
    print(texto, x, y, color_texto)
end
```
Teclado - dibujarPantallaCorrecta
```
-- Pantalla de clave correcta
function dibujar_pantalla_correcta()
    cls(0)
    print("Clave correcta!", 60, 68, 11)
end
```
Teclado - dibujarTeclado
```
-- Función para dibujar el teclado virtual
function dibujar_teclado()
    for y, fila in ipairs(teclado) do
        for x, tecla in ipairs(fila) do
            local pos_x = POS_X_INICIAL + (x - 1) * (TECLA_ANCHO + ESPACIO_X)
            local pos_y = POS_Y_INICIAL + (y - 1) * (TECLA_ALTO + ESPACIO_Y)

            -- Dibujar fondo de la tecla
            rect(pos_x, pos_y, TECLA_ANCHO, TECLA_ALTO, 5)

            -- Resaltar la tecla seleccionada
            if x == cursor_x and y == cursor_y then
                rectb(pos_x - 1, pos_y - 1, TECLA_ANCHO + 2, TECLA_ALTO + 2, 7)
            end

            -- Dibujar texto de la tecla
            local offset_x = (#tecla == 1) and 5 or 3 -- Centrar texto
            print(tecla, pos_x + offset_x, pos_y + 2, 7)
        end
    end
end
```
Teclado - dibujarTexto
```
-- Dibujar texto en la parte superior
function dibujar_texto()
    print("Escribe: " .. texto_escrito, 10, 10, 7)
end
```

Teclado2 - drawKeyboard
```
-- Función para mostrar el teclado numérico
function draw_keyboard()
    local x, y = 10, 10
    for i, key in ipairs(keys) do
        -- Dibujar los botones
        rect(x, y, 30, 30, 7)
        if i == selected_key then
            rect(x - 2, y - 2, 34, 34, 8)  -- Resaltar la tecla seleccionada
        end
        print(key, x + 7, y + 7, 0)
        x = x + 35
        if i % 3 == 0 then
            x = 10
            y = y + 35
        end
    end
end
```

Telescopio - drawStar
```
function draw_star(x, y, color)
    -- Dibuja un punto grande que parece estrella
    pix(x, y, color)     -- Centro de la estrella
    pix(x - 1, y, color) -- Izquierda
    pix(x + 1, y, color) -- Derecha
    pix(x, y - 1, color) -- Arriba
    pix(x, y + 1, color) -- Abajo
end
```
Telescopio - drawTelescope
```
function draw_telescope()
    -- Oscurecer toda la pantalla
    rect(0, 0, 240, 136, 0)
    -- Mostrar el círculo de la mira
    circ(telescope.x, telescope.y, telescope.radius, 0)
    circb(telescope.x, telescope.y, telescope.radius, 15) -- Borde de la mira
end
```
Telescopio - drawVisibleShootingStar
```
function draw_visible_shooting_star()
    -- Dibuja la estrella fugaz solo si está dentro del círculo de la mira
    local dx = shooting_star.x - telescope.x
    local dy = shooting_star.y - telescope.y
    if dx * dx + dy * dy <= telescope.radius * telescope.radius then
        local color = 10 -- Amarillo
        draw_star(shooting_star.x, shooting_star.y, color)

        -- Dibuja la cola de la estrella fugaz
        for i, point in ipairs(shooting_star.trail) do
            dx = point.x - telescope.x
            dy = point.y - telescope.y
            if dx * dx + dy * dy <= telescope.radius * telescope.radius then
                local alpha_color = 10 - i -- Desvanece el color gradualmente
                if alpha_color > 0 then
                    pix(point.x, point.y, alpha_color)
                end
            end
        end
    end
end
```
Telescopio - drawVisibleStars
```
function draw_visible_stars()
    -- Dibuja las estrellas solo si están dentro del círculo de la mira
    for _, star in ipairs(stars) do
        local dx = star.x - telescope.x
        local dy = star.y - telescope.y
        if dx * dx + dy * dy <= telescope.radius * telescope.radius then
            local color = star_colors[(frame // 10 % #star_colors) + 1]
            draw_star(star.x, star.y, color)
        end
    end
end
```

Trompo - drawTimer
```
function draw_timer()
    print("Tiempo: " .. math.ceil(time_left), 10, 10, 7)
end
```

Trompo - drawWinner
```
function draw_winner()
    if game_over then
        print(winner .. " gana!", 80, 120, 7)
    end
end
```
