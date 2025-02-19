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
        x = x + 6 -- Avanzar posición horizontal
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
            color = 12  -- Azul
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
            line(x + i, y, x + w - i, y, color) -- Línea superior
        elseif i == 1 then
            line(x + i, y + h, x + w - i, y + h, color) -- Línea inferior
        elseif i == 2 then
            line(x, y + i, x, y + h - i, color) -- Línea izquierda
        else
            line(x + w, y + i, x + w, y + h - i, color) -- Línea derecha
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
            if (btnp(2) and flecha.tipo == 1) or -- ←
               (btnp(3) and flecha.tipo == 4) or -- →
               (btnp(1) and flecha.tipo == 3) or -- ↑
               (btnp(0) and flecha.tipo == 2) then -- ↓
                flecha.activa = false
                flecha.acertada = true
                flecha.tiempo_acertada = 15 -- Duración del efecto en cuadros
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
    if btnp(2) then flechas_estaticas[1] = true end -- ←
    if btnp(0) then flechas_estaticas[2] = true end -- ↓
    if btnp(1) then flechas_estaticas[3] = true end -- ↑
    if btnp(3) then flechas_estaticas[4] = true end -- →
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

```

Baile - dibujarEstrellasFugaces
```

```

Baile - dibujarFin
```

```

Baile - dibujarFlechas
```

```

Baile - dibujarPuntuacion
```

```

Climatologia - drawLeaves
```

```

Climatologia - drawLightning
```

```

Climatologia - drawLightningEffect
```

```

Climatologia - drawMenu
```

```

Climatologia - drawRaindrops
```

```

Climatologia - drawSnowflakes
```

```

Climatologia - drawWind
```

```
DiosGPT - dibujarTriangulo
```

```
Inicio - dibujarEstrellas
```

```
Jetpack - drawSparks
```

```
MenuPausa - dibujarEstrellas
```

```
MenuPausa - dibujarMenu
```

```
MenuPausa - dibujarMiniMapa
```

```
Moneda - dibujarBalanza
```

```
Moneda - dibujarCoches
```

```
Moneda - dibujarMonedas
```

```
Moneda - dibujarMonedasEspeciales
```

```
Moneda - dibujarPersonaje
```

```
Parada - dibujarParada
```

```

Parada - dibujarPersonaje
```

```

Parada - dibujarTarjetaSuba
```

```

Pinball - drawPaddle
```

```

Pinball - drawPaddleCollision
```

```

Pinball - drawSpring
```

```

Radio - dibujarTextoConContorno
```

```
Teclado - dibujarPantallaCorrecta
```

```
Teclado - dibujarTeclado
```

```
Teclado - dibujarTexto
```

```

Teclado2 - drawKeyboard
```

```

Telescopio - drawStar
```

```
Telescopio - drawTelescope
```

```
Telescopio - drawVisibleShootingStar
```

```
Telescopio - drawVisibleStars
```

```

Trompo - drawTimer
```

```

Trompo - drawWinner
```

```
