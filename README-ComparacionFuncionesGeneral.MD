## EfectosArcoiris

Teclado2
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

Wiki
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

MenuPausa
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

Inicio
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

Creditos
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

GT
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

```

Baile - ActualizarFlechasEstaticas
```

```

Climatologia - updateEarthquake
```

```

Climatologia - updateLeaves
```

```

Climatologia - updateLightning
```

```

Climatologia - updateRaindrops
```

```

Climatologia - updateSnowflakes
```

```

Climatologia - updateWind
```

```

DiosGPT - actualizarColorTriangulo
```

```
Jetpack - updateSparks
```

```
Telescopio - updateShootingStar
```

```

Telescopio - updateTelescope
```

```
Trompo - updateCircles
```

```

Trompo - updateParticles
```

```

Trompo - updateRainbowPoints
```

```

## Todos los Draw / Dibujar

Baile - dibujarBase
```

```

Baile - dibujarCancion
```

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
