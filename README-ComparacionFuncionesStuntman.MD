# Stuntman

## MoveCar

### S1
```
-- Movimiento del coche
function move_car()
    if btn(0) 
then car_y = car_y - car_speed end 
-- Arriba
    if btn(1) 
then car_y = car_y + car_speed end 
-- Abajo
    if btn(2) 
then car_x = car_x - car_speed end 
-- Izquierda
    if btn(3) 
then car_x = car_x + car_speed end 
-- Derecha
end
```

### S2
```
-- Movimiento del coche
function move_car()
    if btn(0) then car_y = car_y - car_speed end 
-- Arriba
    if btn(1) then car_y = car_y + car_speed end 
-- Abajo
    if btn(2) then car_x = car_x - car_speed end 
-- Izquierda
    if btn(3) then car_x = car_x + car_speed end 
-- Derecha
end
```

### S3
```
-- Movimiento del coche
function move_car()
    if btn(0) then car_y = car_y - car_speed end 
-- Arriba
    if btn(1) then car_y = car_y + car_speed end 
-- Abajo
    if btn(2) then car_x = car_x - car_speed end 
-- Izquierda
    if btn(3) then car_x = car_x + car_speed end 
-- Derecha

    -- Activar nitro si el botón adecuado es presionado
    if btn(4) then
        nitro_active = true
        car_speed = 6 
-- Aumenta la velocidad del coche cuando se activa el nitro
    else
        nitro_active = false
        car_speed = 3 
-- Restablece la velocidad normal
    end
end
```

### S4
```
-- Movimiento del coche
function move_car()
    if btn(0) then car_y = car_y - car_speed end 
-- Arriba
    if btn(1) then car_y = car_y + car_speed end 
-- Abajo
    if btn(2) then car_x = car_x - car_speed end 
-- Izquierda
    if btn(3) then car_x = car_x + car_speed end 
-- Derecha

    -- Activar nitro si el botón adecuado es presionado
    if btn(4) then
        nitro_active = true
        car_speed = 6 
-- Aumenta la velocidad del coche cuando se activa el nitro
    else
        nitro_active = false
        car_speed = 3 
-- Restablece la velocidad normal
    end
end
```

### S5
```
-- Movimiento del coche
function move_car()
    if not jumping then
        if btn(0) then car_y = car_y - car_speed end 
-- Arriba
        if btn(1) then car_y = car_y + car_speed end 
-- Abajo
        if btn(2) then car_x = car_x - car_speed end 
-- Izquierda
        if btn(3) then car_x = car_x + car_speed end 
-- Derecha

        -- Activar nitro si el botón adecuado es presionado
        if btn(4) then
            nitro_active = true
            car_speed = 6 
-- Aumenta la velocidad del coche cuando se activa el nitro
        else
            nitro_active = false
            car_speed = 3 
-- Restablece la velocidad normal
        end
    end
end
```

### S6
```
-- Movimiento del coche
function move_car()
    if not jumping then
        if btn(0) then car_y = car_y - car_speed end 
-- Arriba
        if btn(1) then car_y = car_y + car_speed end 
-- Abajo
        if btn(2) then car_x = car_x - car_speed end 
-- Izquierda
        if btn(3) then car_x = car_x + car_speed end 
-- Derecha

        -- Activar nitro si el botón adecuado es presionado
        if btn(4) then
            nitro_active = true
            car_speed = 6 
-- Aumenta la velocidad del coche cuando se activa el nitro
        else
            nitro_active = false
            car_speed = 3 
-- Restablece la velocidad normal
        end
    end
end
```

### S7
```
-- Movimiento del coche
function move_car()
    if not jumping then
        if btn(0) then car_y = car_y - car_speed end 
-- Arriba
        if btn(1) then car_y = car_y + car_speed end 
-- Abajo
        if btn(2) then car_x = car_x - car_speed end 
-- Izquierda
        if btn(3) then car_x = car_x + car_speed end 
-- Derecha

        -- Activar nitro si el botón adecuado es presionado
        if btn(4) then
            nitro_active = true
            car_speed = 6 
-- Aumenta la velocidad del coche cuando se activa el nitro
        else
            nitro_active = false
            car_speed = 3 
-- Restablece la velocidad normal
        end
    end
end
```

### S8
```
-- Movimiento del coche (igual que antes)
function move_car()
    if not jumping then
        if btn(0) then car_y = car_y - car_speed end
        if btn(1) then car_y = car_y + car_speed end
        if btn(2) then car_x = car_x - car_speed end
        if btn(3) then car_x = car_x + car_speed end

        if btn(4) then
            nitro_active = true
            car_speed = 6
        else
            nitro_active = false
            car_speed = 3
        end
    end
end
```
### S9
```
-- Movimiento del coche
function move_car()
    if not jumping then
        if btn(0) then car_y = car_y - car_speed end 
-- Arriba
        if btn(1) then car_y = car_y + car_speed end 
-- Abajo
        if btn(2) then car_x = car_x - car_speed end 
-- Izquierda
        if btn(3) then car_x = car_x + car_speed end 
-- Derecha

        if btn(4) then
            nitro_active = true
            car_speed = 6 
-- Velocidad aumentada con nitro
        else
            nitro_active = false
            car_speed = 3 
-- Velocidad normal
        end
    end
end
```

### S10
```
-- Movimiento del coche
function move_car()
    if btn(0) then car_y = car_y - car_speed end 
-- Arriba
    if btn(1) then car_y = car_y + car_speed end 
-- Abajo
    if btn(2) then car_x = car_x - car_speed end 
-- Izquierda
    if btn(3) then car_x = car_x + car_speed end 
-- Derecha

    if btn(4) then
        nitro_active = true
        car_speed = 6 
-- Velocidad aumentada con nitro
    else
        nitro_active = false
        car_speed = 3 
-- Velocidad normal
    end
end
```

## movePlayer

### S1
```
-- Movimiento del jugador
function move_player()
    if btn(0) then player_y = player_y - player_speed end 
-- Arriba
    if btn(1) then player_y = player_y + player_speed end 
-- Abajo
    if btn(2) then player_x = player_x - player_speed end 
-- Izquierda
    if btn(3) then player_x = player_x + player_speed end 
-- Derecha
end
```

### S10
```
-- Movimiento del jugador
function move_player()
    if btn(0) then player_y = player_y - player_speed end 
-- Arriba
    if btn(1) then player_y = player_y + player_speed end 
-- Abajo
    if btn(2) then player_x = player_x - player_speed end 
-- Izquierda
    if btn(3) then player_x = player_x + player_speed end 
-- Derecha
end
```

## nuevaCamara

### S1
```
-- Simulación de cámara
function nueva_camara(x, y)
    camera_x, camera_y = x, y
end
```

### S2
```
-- Simulación de cámara
function nueva_camara(x, y)
    camera_x, camera_y = x, y
end
```

### S3
```
-- Simulación de cámara
function nueva_camara(x, y)
    camera_x, camera_y = x, y
end
```

### S4
```
-- Simulación de cámara
function nueva_camara(x, y)
    camera_x, camera_y = x, y
end
```

### S5
```
-- Simulación de cámara
function nueva_camara(x, y)
    camera_x, camera_y = x, y
end
```

### S6
```
-- Simulación de cámara
function nueva_camara(x, y)
    camera_x, camera_y = x, y
end
```

### S7
```
-- Simulación de cámara
function nueva_camara(x, y)
    camera_x, camera_y = x, y
end
```

### S8
```
-- Actualizar cámara
function nueva_camara(x, y)
    camera_x, camera_y = x, y
end
```
### S9
```
-- Actualizar cámara
function nueva_camara(x, y)
    camera_x, camera_y = x, y
end
```

## updateCamera

### S1
```
-- Actualizar cámara
function update_camera()
    if player_in_car then
        nueva_camara(car_x - 120, car_y - 68) 
-- Centra la cámara en el coche
    else
        nueva_camara(player_x - 120, player_y - 68) 
-- Centra la cámara en el jugador
    end
end
```

### S2
```
-- Actualizar cámara
function update_camera()
    nueva_camara(car_x - 120, car_y - 68) -- Centra la cámara en el coche
end
```

### S3
```
-- Actualizar cámara
function update_camera()
    nueva_camara(car_x - 120, car_y - 68) -- Centra la cámara en el coche
end
```

### S4
```
-- Actualizar cámara
function update_camera()
    nueva_camara(car_x - 120, car_y - 68) -- Centra la cámara en el coche
end
```

### S5
```
-- Actualizar cámara
function update_camera()
    nueva_camara(car_x - 120, car_y - 68) -- Centra la cámara en el coche
end
```

### S6
```
-- Actualizar cámara
function update_camera()
    nueva_camara(car_x - 120, car_y - 68) -- Centra la cámara en el coche
end
```

### S7
```
function update_camera()
    nueva_camara(car_x - 120, car_y - 68) -- Centra la cámara en el coche
end
```

### S8
```
function update_camera()
    nueva_camara(car_x - 120, car_y - 68) -- Centra la cámara en el coche
end
```
### S9
```
function update_camera()
    nueva_camara(car_x - 120, car_y - 68) -- Centra la cámara en el coche
end
```
### S10
```
function update_camera()
    if in_car then
        camera_x, camera_y = car_x - 120, car_y - 68 
-- Centra la cámara en el coche
    else
        camera_x, camera_y = player_x - 120, player_y - 68 
-- Centra la cámara en el jugador
    end
end
```

## drawTextMultilineWithBG

### S1
```
-- Dividir texto en líneas con fondo negro
function draw_text_multiline_with_bg(text, x, y, color, bg_color, max_width)
    local words = {}
    for word in text:gmatch("%S+") do
        table.insert(words, word)
    end

    local line = ""
    local line_height = 6
    local original_y = y
    local lines = {}

    for _, word in ipairs(words) do
        local test_line = line .. (line == "" and "" or " ") .. word
        if print(test_line, 0, -10, 0, false, 1, false) > max_width then
            table.insert(lines, line)
            line = word
        else
            line = test_line
        end
    end
    if line ~= "" then
        table.insert(lines, line)
    end

    -- Dibuja el fondo negro
    rect(x - 2, y - 2, max_width + 4, #lines * line_height + 4, bg_color)

    -- Dibuja el texto línea por línea
    for _, line in ipairs(lines) do
        print(line, x, y, color)
        y = y + line_height
    end
end
```

### S2
```
-- Dividir texto en líneas con fondo negro
function draw_text_multiline_with_bg(text, x, y, color, bg_color, max_width)
    local words = {}
    for word in text:gmatch("%S+") do
        table.insert(words, word)
    end

    local line = ""
    local line_height = 6
    local original_y = y
    local lines = {}

    for _, word in ipairs(words) do
        local test_line = line .. (line == "" and "" or " ") .. word
        if print(test_line, 0, -10, 0, false, 1, false) > max_width then
            table.insert(lines, line)
            line = word
        else
            line = test_line
        end
    end
    if line ~= "" then
        table.insert(lines, line)
    end

    -- Dibuja el fondo negro
    rect(x - 2, y - 2, max_width + 4, #lines * line_height + 4, bg_color)

    -- Dibuja el texto línea por línea
    for _, line in ipairs(lines) do
        print(line, x, y, color)
        y = y + line_height
    end
end
```

### S3
```
-- Dividir texto en líneas con fondo negro
function draw_text_multiline_with_bg(text, x, y, color, bg_color, max_width)
    local words = {}
    for word in text:gmatch("%S+") do
        table.insert(words, word)
    end

    local line = ""
    local line_height = 6
    local original_y = y
    local lines = {}

    for _, word in ipairs(words) do
        local test_line = line .. (line == "" and "" or " ") .. word
        if print(test_line, 0, -10, 0, false, 1, false) > max_width then
            table.insert(lines, line)
            line = word
        else
            line = test_line
        end
    end
    if line ~= "" then
        table.insert(lines, line)
    end

    -- Dibuja el fondo negro
    rect(x - 2, y - 2, max_width + 4, #lines * line_height + 4, bg_color)

    -- Dibuja el texto línea por línea
    for _, line in ipairs(lines) do
        print(line, x, y, color)
        y = y + line_height
    end
end
```

### S4
```
-- Dividir texto en líneas con fondo negro
function draw_text_multiline_with_bg(text, x, y, color, bg_color, max_width)
    local words = {}
    for word in text:gmatch("%S+") do
        table.insert(words, word)
    end

    local line = ""
    local line_height = 6
    local original_y = y
    local lines = {}

    for _, word in ipairs(words) do
        local test_line = line .. (line == "" and "" or " ") .. word
        if print(test_line, 0, -10, 0, false, 1, false) > max_width then
            table.insert(lines, line)
            line = word
        else
            line = test_line
        end
    end
    if line ~= "" then
        table.insert(lines, line)
    end

    -- Dibuja el fondo negro
    rect(x - 2, y - 2, max_width + 4, #lines * line_height + 4, bg_color)

    -- Dibuja el texto línea por línea
    for _, line in ipairs(lines) do
        print(line, x, y, color)
        y = y + line_height
    end
end
```

### S5
```
-- Dibujar texto con múltiples líneas y fondo negro
function draw_text_multiline_with_bg(text, x, y, color, bg_color, max_width)
    local words = {}
    for word in text:gmatch("%S+") do
        table.insert(words, word)
    end

    local line = ""
    local line_height = 6
    local original_y = y
    local lines = {}

    for _, word in ipairs(words) do
        local test_line = line .. (line == "" and "" or " ") .. word
        if print(test_line, 0, -10, 0, false, 1, false) > max_width then
            table.insert(lines, line)
            line = word
        else
            line = test_line
        end
    end
    if line ~= "" then
        table.insert(lines, line)
    end

    -- Dibuja el fondo negro
    rect(x - 2, y - 2, max_width + 4, #lines * line_height + 4, bg_color)

    -- Dibuja el texto línea por línea
    for _, line in ipairs(lines) do
        print(line, x, y, color)
        y = y + line_height
    end
end
```

### S6
```
-- Dibujar texto con múltiples líneas y fondo negro
function draw_text_multiline_with_bg(text, x, y, color, bg_color, max_width)
    local words = {}
    for word in text:gmatch("%S+") do
        table.insert(words, word)
    end

    local line = ""
    local line_height = 6
    local original_y = y
    local lines = {}

    for _, word in ipairs(words) do
        local test_line = line .. (line == "" and "" or " ") .. word
        if print(test_line, 0, -10, 0, false, 1, false) > max_width then
            table.insert(lines, line)
            line = word
        else
            line = test_line
        end
    end
    if line ~= "" then
        table.insert(lines, line)
    end

    -- Dibuja el fondo negro
    rect(x - 2, y - 2, max_width + 4, #lines * line_height + 4, bg_color)

    -- Dibuja el texto línea por línea
    for _, line in ipairs(lines) do
        print(line, x, y, color)
        y = y + line_height
    end
end
```

### S7
```
-- Dibujar texto con múltiples líneas y fondo negro
function draw_text_multiline_with_bg(text, x, y, color, bg_color, max_width)
    local words = {}
    for word in text:gmatch("%S+") do
        table.insert(words, word)
    end

    local line = ""
    local line_height = 6
    local original_y = y
    local lines = {}

    for _, word in ipairs(words) do
        local test_line = line .. (line == "" and "" or " ") .. word
        if print(test_line, 0, -10, 0, false, 1, false) > max_width then
            table.insert(lines, line)
            line = word
        else
            line = test_line
        end
    end
    if line ~= "" then
        table.insert(lines, line)
    end

    -- Dibuja el fondo negro
    rect(x - 2, y - 2, max_width + 4, #lines * line_height + 4, bg_color)

    -- Dibuja el texto línea por línea
    for _, line in ipairs(lines) do
        print(line, x, y, color)
        y = y + line_height
    end
end
```

## TIC

### S1
```
function TIC()
    cls(0) 
-- Limpia la pantalla

    -- Actualizar cámara
    update_camera()

    -- Dibuja el mapa
    map(0, 0, 30, 17, -camera_x, -camera_y)

    -- Mostrar misión o diálogo
    if game_state == "mission_intro" then
        draw_text_multiline_with_bg(mission_description, 8, 8, 12, 0, 200)
        if btnp(4) then -- Botón A para comenzar el diálogo
            game_state = "dialogue"
        end
    elseif game_state == "dialogue" then
        draw_text_multiline_with_bg(dialogue[dialogue_index], 8, 8, 12, 0, 200)
        if btnp(4) then -- Botón A para avanzar diálogo
            dialogue_index = dialogue_index + 1
            if dialogue_index > #dialogue then
                game_state = "countdown"
            end
        end
    elseif game_state == "countdown" then
        
-- Mostrar el contador en la parte superior derecha
        print("Tiempo restante: " .. math.ceil(countdown), 8, 8, 12)
        countdown = countdown - 1 / 60
        if countdown <= 0 then
            if not player_in_car then
                objective_status = "failed" 
-- Cambiar a misión fallida si el jugador no está en el coche
            end
            game_state = "finished"
        end

        -- Movimiento del jugador
        move_player()

        
-- Detecta si el jugador llega al coche
        if player_x >= car_x - 8 and player_x <= car_x + 8 and
           player_y >= car_y - 8 and player_y <= car_y + 8 then
            if btnp(5) then -- Botón B para subirse
                player_in_car = true
                objective_status = "complete" 
-- Objetivo 1-1 cumplido
                game_state = "in_car"
            end
        end
    elseif game_state == "in_car" then
        draw_text_multiline_with_bg("¡Estás en el coche! Conduce usando las flechas.", 8, 8, 11, 0, 200)
        move_car()
    elseif game_state == "finished" then
        if player_in_car then
            print("¡Te subiste al coche a tiempo! Misión cumplida.", 10 - camera_x, 10 - camera_y, 11)
        else
            print("¡Se acabó el tiempo! Misión fallida.", 10 - camera_x, 10 - camera_y, 6)
        end
    end

    -- Mostrar objetivo 1-1
    if objective_status == "incomplete" then
        draw_text_multiline_with_bg("Objetivo 1-1: súbete al coche.", 0, 80, 12, 4, 150)
    elseif objective_status == "complete" then
        draw_text_multiline_with_bg("Objetivo 1-1 cumplido.", 0, 80, 12, 6, 150)
    elseif objective_status == "failed" then
        draw_text_multiline_with_bg("Objetivo 1-1: misión fallida.", 0, 80, 12, 2, 150)
    end

    -- Dibuja los sprites
    if not player_in_car then
        spr(2, player_x - camera_x, player_y - camera_y,0) -- Jugador (id 2)
    end
    spr(1, stacchotta_x - camera_x, stacchotta_y - camera_y,0) -- Silvestre Stacchotta
    spr(48, car_x - camera_x, car_y - camera_y,0) 
-- Coche
end
```

### S2
```
function TIC()
    cls(0) 
-- Limpia la pantalla

    -- Actualizar cámara
    update_camera()

    -- Dibuja el mapa
    map(0, 0, 30, 17, -camera_x, -camera_y)

    -- Mostrar misión o diálogo
    if game_state == "mission_intro" then
        draw_text_multiline_with_bg(mission_description, 8, 8, 12, 0, 200)
        if btnp(4) then -- Botón A para comenzar el diálogo
            game_state = "dialogue"
        end
    elseif game_state == "dialogue" then
        draw_text_multiline_with_bg(dialogue[dialogue_index], 8, 8, 12, 0, 200)
        if btnp(4) then -- Botón A para avanzar diálogo
            dialogue_index = dialogue_index + 1
            if dialogue_index > #dialogue then
                game_state = "countdown"
            end
        end
    elseif game_state == "countdown" then
        
-- Mostrar el contador en la parte superior derecha
        print("Tiempo restante: " .. math.ceil(countdown), 8, 8, 12)
        countdown = countdown - 1 / 60
        if countdown <= 0 then
            if objective_status == "incomplete" then
                objective_status = "failed" 
-- Cambiar a misión fallida si no chocaste las cajas
            end
            game_state = "finished"
        end

        
-- Movimiento del coche
        move_car()
        check_collisions()

        
-- Verificar si todas las cajas han sido chocadas
        local all_boxes_hit = true
        for _, box in ipairs(boxes) do
            if box.active then
                all_boxes_hit = false
                break
            end
        end
        if all_boxes_hit then
            objective_status = "complete"
            game_state = "finished"
        end
    elseif game_state == "finished" then
        if objective_status == "complete" then
            print("¡Chocaste todas las cajas! Misión cumplida.", 10 - camera_x, 10 - camera_y, 11)
        else
            print("¡Se acabó el tiempo! Misión fallida.", 10 - camera_x, 10 - camera_y, 6)
        end
    end

    -- Mostrar objetivo 1-2 con colores
    if objective_status == "incomplete" then
        draw_text_multiline_with_bg("Objetivo 1-2: choca todas las cajas.", 0, 80, 12, 4, 150)
    elseif objective_status == "complete" then
        draw_text_multiline_with_bg("Objetivo 1-2 cumplido.", 0, 80, 11, 3, 150)
    elseif objective_status == "failed" then
        draw_text_multiline_with_bg("Objetivo 1-2: misión fallida.", 0, 80, 6, 2, 150)
    end

    -- Dibuja los sprites
    spr(48, car_x - camera_x, car_y - camera_y, 0) -- Coche

    -- Dibujar cajas y partículas
    draw_boxes()
    update_and_draw_particles()
end
```

### S3
```
function TIC()
    cls(0) 
-- Limpia la pantalla

    -- Actualizar cámara
    update_camera()

    -- Dibuja el mapa
    map(0, 0, 30, 17, -camera_x, -camera_y)

    -- Mostrar misión o diálogo
    if game_state == "mission_intro" then
        draw_text_multiline_with_bg(mission_description, 8, 8, 12, 0, 200)
        if btnp(4) then 
-- Botón A para comenzar el diálogo
            game_state = "dialogue"
        end
    elseif game_state == "dialogue" then
        draw_text_multiline_with_bg(dialogue[dialogue_index], 8, 8, 12, 0, 200)
        if btnp(4) then 
-- Botón A para avanzar diálogo
            dialogue_index = dialogue_index + 1
            if dialogue_index > #dialogue then
                game_state = "countdown"
            end
        end
    elseif game_state == "countdown" then
        
-- Mostrar el contador en la parte superior derecha
        print("Tiempo restante: " .. math.ceil(countdown), 8, 8, 12)
        countdown = countdown - 1 / 60
        if countdown <= 0 then
            if objective_status == "incomplete" then
                objective_status = "failed" 
-- Cambiar a misión fallida si no llegaste al checkpoint
            end
            game_state = "finished"
        end

        -- Movimiento del coche
        move_car()
        check_collisions()

        
-- Verificar si el coche llegó al checkpoint
        if check_checkpoint_collision() and objective_status == "incomplete" then
            objective_status = "complete"
            game_state = "finished"
        end
    elseif game_state == "finished" then
        if objective_status == "complete" then
            print("¡Llegaste al checkpoint! Misión cumplida.", 10 - camera_x, 10 - camera_y, 11)
        else
            print("¡Se acabó el tiempo! Misión fallida.", 10 - camera_x, 10 - camera_y, 6)
        end
    end

    -- Mostrar objetivo 1-3 con colores
    if objective_status == "incomplete" then
        draw_text_multiline_with_bg("Objetivo 1-3: llegar al checkpoint en 10 segundos.", 0, 80, 12, 4, 150)
    elseif objective_status == "complete" then
        draw_text_multiline_with_bg("Objetivo 1-3 cumplido.", 0, 80, 11, 3, 150)
    elseif objective_status == "failed" then
        draw_text_multiline_with_bg("Objetivo 1-3: misión fallida.", 0, 80, 6, 2, 150)
    end

    -- Dibuja los sprites
    spr(48, car_x - camera_x, car_y - camera_y, 0) -- Coche

    -- Dibujar cajas, partículas y checkpoint
    draw_boxes()
    update_and_draw_particles()
    draw_checkpoint() -- Dibuja el checkpoint en la pantalla

    -- Dibujar el efecto del nitro
    draw_nitro_effect()
end
```

### S4
```
function TIC()
    cls(0) 
-- Limpia la pantalla

    -- Actualizar cámara
    update_camera()

    -- Dibuja el mapa
    map(0, 0, 30, 17, -camera_x, -camera_y)

    -- Mostrar misión o diálogo
    if game_state == "mission_intro" then
        draw_text_multiline_with_bg(mission_description, 8, 8, 12, 0, 200)
        if btnp(4) then 
-- Botón A para comenzar el diálogo
            game_state = "dialogue"
        end
    elseif game_state == "dialogue" then
        draw_text_multiline_with_bg(dialogue[dialogue_index], 8, 8, 12, 0, 200)
        if btnp(4) then -- Botón A para avanzar diálogo
            dialogue_index = dialogue_index + 1
            if dialogue_index > #dialogue then
                game_state = "countdown"
            end
        end
    elseif game_state == "countdown" then
        -- Mostrar el contador en la parte superior derecha
        print("Tiempo restante: " .. math.ceil(countdown), 8, 8, 12)
        countdown = countdown - 1 / 60
        if countdown <= 0 then
            if objective_status == "incomplete" then
                objective_status = "failed" 
-- Cambiar a misión fallida si no destruíste la caja
            end
            game_state = "finished"
        end

        -- Movimiento del coche
        move_car()
        shoot_bullet() 
-- Disparar balas
        check_bullet_collisions() 
-- Comprobar colisiones con la caja
        update_bullets() 
-- Actualizar balas

        -- Verificar si la caja ha sido destruida
        if box.health <= 0 then
            box.active = false
            objective_status = "complete"
            game_state = "finished"
        end
    elseif game_state == "finished" then
        if objective_status == "complete" then
            print("¡Caja destruida! Misión cumplida.", 10 - camera_x, 10 - camera_y, 11)
        else
            print("¡Se acabó el tiempo! Misión fallida.", 10 - camera_x, 10 - camera_y, 6)
        end
    end

    -- Mostrar objetivo 1-4 con colores
    if objective_status == "incomplete" then
        draw_text_multiline_with_bg("Objetivo 1-4: destruir la caja en 10 segundos.", 0, 80, 12, 4, 150)
    elseif objective_status == "complete" then
        draw_text_multiline_with_bg("Objetivo 1-4 cumplido.", 0, 80, 11, 3, 150)
    elseif objective_status == "failed" then
        draw_text_multiline_with_bg("Objetivo 1-4: misión fallida.", 0, 80, 6, 2, 150)
    end

    -- Dibuja los sprites
    spr(48, car_x - camera_x, car_y - camera_y, 0) 
-- Coche

    -- Dibujar la caja, balas, partículas y checkpoint
    draw_box()
    draw_bullets()
    update_and_draw_particles()

    -- Dibujar el efecto del nitro
    draw_nitro_effect()
end
```

### S5
```
function TIC()
    cls(0) 
-- Limpia la pantalla

    -- Actualizar cámara
    update_camera()

    -- Dibuja el mapa
    map(0, 0, 30, 17, -camera_x, -camera_y)

    -- Mostrar misión o diálogo
    if game_state == "mission_intro" then
        draw_text_multiline_with_bg(mission_description, 8, 8, 12, 0, 200)
        if btnp(4) then -- Botón A para comenzar el diálogo
            game_state = "dialogue"
        end
    elseif game_state == "dialogue" then
        draw_text_multiline_with_bg(dialogue[dialogue_index], 8, 8, 12, 0, 200)
        if btnp(4) then -- Botón A para avanzar diálogo
            dialogue_index = dialogue_index + 1
            if dialogue_index > #dialogue then
                game_state = "countdown"
            end
        end
    elseif game_state == "countdown" then
        -- Mostrar el contador en la parte superior derecha
        print("Tiempo restante: " .. math.ceil(countdown), 8, 8, 12)
        countdown = countdown - 1 / 60
        if countdown <= 0 then
            if objective_status == "incomplete" then
                objective_status = "failed" 
-- Cambiar a misión fallida si no se salta
            end
            game_state = "finished"
        end

        
-- Movimiento del coche y comprobaciones
        move_car()
        check_ramp_collision()
        handle_jump()

        
-- Verificar si el coche ha saltado sobre la rampa
        if car_x > ramp.x + 32 and jumping then
            objective_status = "complete"
            game_state = "finished"
        end
    elseif game_state == "finished" then
        if objective_status == "complete" then
            print("¡Salto exitoso! Misión cumplida.", 10 - camera_x, 10 - camera_y, 11)
        else
            print("¡Se acabó el tiempo! Misión fallida.", 10 - camera_x, 10 - camera_y, 6)
        end
    end

    -- Mostrar objetivo 1-5 con colores
    if objective_status == "incomplete" then
        draw_text_multiline_with_bg("Objetivo 1-5: saltar sobre la rampa en 10 segundos.", 0, 80, 12, 4, 150)
    elseif objective_status == "complete" then
        draw_text_multiline_with_bg("Objetivo 1-5 cumplido.", 0, 80, 11, 3, 150)
    elseif objective_status == "failed" then
        draw_text_multiline_with_bg("Objetivo 1-5: misión fallida.", 0, 80, 6, 2, 150)
    end

    -- Dibujar el coche, la rampa y efectos
    spr(48, car_x - camera_x, car_y - camera_y, 0) -- Coche
    draw_ramp()
    draw_nitro_effect()
end
```

### S6
```
function TIC()
    cls(0) 
-- Limpia la pantalla

    -- Actualizar cámara
    update_camera()

    -- Dibuja el mapa
    map(0, 0, 30, 17, -camera_x, -camera_y)

    -- Mostrar misión o diálogo
    if game_state == "mission_intro" then
        draw_text_multiline_with_bg(mission_description, 8, 8, 12, 0, 200)
        if btnp(4) then 
-- Botón A para comenzar el diálogo
            game_state = "dialogue"
        end
    elseif game_state == "dialogue" then
        draw_text_multiline_with_bg(dialogue[dialogue_index], 8, 8, 12, 0, 200)
        if btnp(4) then 
-- Botón A para avanzar diálogo
            dialogue_index = dialogue_index + 1
            if dialogue_index > #dialogue then
                game_state = "countdown"
            end
        end
    elseif game_state == "countdown" then
        -- Mostrar el contador en la parte superior derecha
        print("Tiempo restante: " .. math.ceil(countdown), 8, 8, 12)
        countdown = countdown - 1 / 60
        if countdown <= 0 then
            if objective_status == "incomplete" then
                objective_status = "failed" 
-- Cambiar a misión fallida si no esquiva coches
            end
            game_state = "finished"
        end

        
-- Movimiento del coche y comprobaciones
        move_car()

        
-- Verificar si el coche ha esquivado coches por 5 segundos
        if not check_car_collision() then
            time_avoided = time_avoided + 1 / 60 
-- Aumenta el tiempo de esquive
            if time_avoided >= 5 then
                objective_status = "complete"
            end
        else
            time_avoided = 0 -- Reinicia el contador si hubo colisión
        end

        handle_jump()

        
-- Crear y mover los coches enemigos
        spawn_car()
        draw_cars()

    elseif game_state == "finished" then
        if objective_status == "complete" then
            print("¡Misión completada!", 10 - camera_x, 10 - camera_y, 11)
        else
            print("¡Se acabó el tiempo! Misión fallida.", 10 - camera_x, 10 - camera_y, 6)
        end
    end

    -- Mostrar objetivo 1-6 con colores
    if objective_status == "incomplete" then
        draw_text_multiline_with_bg("Objetivo 1-6: esquivar coches durante 5 segundos.", 0, 80, 12, 4, 150)
    elseif objective_status == "complete" then
        draw_text_multiline_with_bg("Objetivo 1-6 cumplido.", 0, 80, 11, 3, 150)
    elseif objective_status == "failed" then
        draw_text_multiline_with_bg("Objetivo 1-6: misión fallida.", 0, 80, 6, 2, 150)
    end

    -- Dibujar el coche, la rampa y efectos
    spr(48, car_x - camera_x, car_y - camera_y, 0) -- Coche
    draw_ramp()
    draw_nitro_effect()
end
```

### S7
```
function TIC()
    cls(0) 
-- Limpia la pantalla

    -- Actualizar cámara
    update_camera()

    -- Dibuja el mapa
    map(0, 0, 30, 17, -camera_x, -camera_y)

    -- Mostrar misión o diálogo
    if game_state == "mission_intro" then
        draw_text_multiline_with_bg(mission_description, 8, 8, 12, 0, 200)
        if btnp(4) then 
-- Botón A para comenzar el diálogo
            game_state = "dialogue"
        end
    elseif game_state == "dialogue" then
        draw_text_multiline_with_bg(dialogue[dialogue_index], 8, 8, 12, 0, 200)
        if btnp(4) then 
-- Botón A para avanzar diálogo
            dialogue_index = dialogue_index + 1
            if dialogue_index > #dialogue then
                game_state = "countdown"
            end
        end
    elseif game_state == "countdown" then
        
-- Mostrar el contador en la parte superior derecha
        print("Tiempo restante: " .. math.ceil(countdown), 8, 8, 12)
        countdown = countdown - 1 / 60
        if countdown <= 0 then
            
-- Solo verificar la condición de victoria si el tiempo se agotó
            if objective_status == "complete" then
                game_state = "finished" 
-- Misión completada
            else
                game_state = "finished" 
-- Misión fallida si el objetivo no se completó
            end
        end

        -- Movimiento del coche y comprobaciones
        move_car()

        -- Comprobar si el jugador ha perdido el rastro del coche
        if check_target_car_lost() then
            objective_status = "failed" -- Misión fallida si el coche objetivo se pierde
            game_state = "finished"
        end

        
-- Dibujar el rango de persecución alrededor del coche objetivo
        draw_follow_range()

        
-- Comprobar si el coche del jugador está tocando el círculo de persecución
        local distance_to_target = math.sqrt((car_x - target_car.x)^2 + (car_y - target_car.y)^2)
        if distance_to_target <= follow_range then
            
-- Si el coche está tocando el círculo, marcar como completado **solo si el tiempo ya ha pasado**
            if countdown <= 0 then
                objective_status = "complete" 
-- Misión completada
            end
        end

        
-- Dibujar el coche a perseguir
        draw_target_car()

    elseif game_state == "finished" then
        
-- Verificar el estado de la misión al final
        if objective_status == "complete" then
            print("¡Misión completada!", 10 - camera_x, 10 - camera_y, 11)
        else
            print("¡Se acabó el tiempo! Misión fallida.", 10 - camera_x, 10 - camera_y, 6)
        end
    end

    -- Mostrar objetivo 1-7 con colores
    if objective_status == "incomplete" then
        draw_text_multiline_with_bg("Objetivo 1-7: Perseguir el coche durante 10 segundos.", 0, 80, 12, 4, 150)
    elseif objective_status == "complete" then
        draw_text_multiline_with_bg("Objetivo 1-7 cumplido.", 0, 80, 11, 3, 150)
    elseif objective_status == "failed" then
        draw_text_multiline_with_bg("Objetivo 1-7: misión fallida.", 0, 80, 6, 2, 150)
    end

    
-- Dibujar el coche, la rampa y efectos
    spr(48, car_x - camera_x, car_y - camera_y, 0) 
-- Coche
end
```

### S8
```
-- Bucle principal TIC
function TIC()
    cls(0)

    update_camera()
    map(0, 0, 30, 17, -camera_x, -camera_y)

    if game_state == "mission_intro" then
        print(mission_description, 8, 8, 12)
        if btnp(4) then
            game_state = "dialogue"
        end
    elseif game_state == "dialogue" then
        print(dialogue[dialogue_index], 8, 8, 12)
        if btnp(4) then
            dialogue_index = dialogue_index + 1
            if dialogue_index > #dialogue then
                game_state = "countdown"
            end
        end
    elseif game_state == "countdown" then
        print("Tiempo restante: " .. math.ceil(countdown), 8, 8, 12)
        countdown = countdown - 1 / 60
        if countdown <= 0 then
            if objective_status == "incomplete" then
                objective_status = "failed"
            end
            game_state = "finished"
        end

        move_car()
        check_ramp_collision()
        handle_jump()
        check_hoop_collision()
        update_hoop()
        update_particles()
    elseif game_state == "finished" then
        if objective_status == "complete" then
            print("¡Misión cumplida! Saltaste correctamente.", 10, 10, 11)
        else
            print("¡Fallaste! Tocaste el aro en llamas.", 10, 10, 6)
        end
    end

    spr(48, car_x - camera_x, car_y - camera_y, 0)
    draw_ramp()
    draw_hoop()
    draw_nitro_effect()
    draw_landing_circle() -- Dibuja el círculo verde de aterrizaje fijo
end
```
### S9
```
-- Bucle principal TIC
function TIC()
    cls(0) 
-- Limpia la pantalla

    -- Actualizar cámara
    update_camera()

    -- Dibuja el mapa
    map(0, 0, 30, 17, -camera_x, -camera_y)

    -- Mostrar misión o diálogo
    if game_state == "mission_intro" then
        print(mission_description, 8, 8, 12)
        if btnp(4) then
            game_state = "dialogue"
        end
    elseif game_state == "dialogue" then
        print(dialogue[dialogue_index], 8, 8, 12)
        if btnp(4) then
            dialogue_index = dialogue_index + 1
            if dialogue_index > #dialogue then
                game_state = "countdown"
            end
        end
    elseif game_state == "countdown" then
        print("Tiempo restante: " .. math.ceil(countdown), 8, 8, 12)
        countdown = countdown - 1 / 60
        if countdown <= 0 then
            if objective_status == "incomplete" then
                objective_status = "failed"
            end
            game_state = "finished"
        end

        move_car()
        check_ramp_collision()
        handle_jump()
        check_hoop_collision()
        update_hoop()
        check_victory_collision() 
-- Comprobar si el jugador tocó el círculo de victoria
        check_train_collision() 
-- Comprobar si el jugador toca el tren o los vagones
        move_train() 
-- Mover el tren y los vagones
    elseif game_state == "finished" then
        if objective_status == "complete" then
            print("¡Misión cumplida! ", 10, 10, 11)
        else
            print("¡Fallaste! Tocaste el tren.", 10, 10, 6)
        end
    end

    -- Dibujar el coche, la rampa, el aro, el círculo de victoria, el tren y efectos
    spr(48, car_x - camera_x, car_y - camera_y, 0) -- Coche
    draw_ramp()
    draw_hoop()
    draw_victory_circle()
    draw_train()
    draw_nitro_effect()
    print("Coche: x=" .. car_x .. ", y=" .. car_y,0,0)
print("Vagón: x=" .. train.x .. ", y=" .. train.y,0,30)

-- Dibuja el área del tren
-- rect(train.x - camera_x, train.y - camera_y, train.width, train.height, 6)

-- Dibuja el área del coche
-- rect(car_x - camera_x, car_y - camera_y, 8, 8, 9)


end
```
### S10
```
-- Bucle principal TIC
function TIC()
    cls(0) 
-- Limpia la pantalla

    -- Actualizar cámara
    update_camera()

    -- Dibujar el mapa
    map(0, 0, 30, 17, -camera_x, -camera_y)

    -- Estados del juego
    if game_state == "mission_intro" then
        print(mission_description, 8, 8, 12)
        if btnp(4) then
            game_state = "dialogue"
        end
    elseif game_state == "dialogue" then
        print(dialogue[dialogue_index], 8, 8, 12)
        if btnp(4) then
            dialogue_index = dialogue_index + 1
            if dialogue_index > #dialogue then
                game_state = "countdown"
            end
        end
    elseif game_state == "countdown" then
        print("Tiempo restante: " .. math.ceil(countdown), 8, 8, 12)
        countdown = countdown - 1 / 60
        if countdown <= 0 then
            countdown = 0
        end

        if in_car then
            move_car() -- El coche puede moverse
        else
            move_player() -- El jugador puede moverse fuera del coche
        end
        
        check_victory_collision()
        exit_car() -- Permite salir del coche durante el countdown
    elseif game_state == "final_prep" then
        draw_victory_circle()
        print("Presiona botón para preparar la bomba.", 10, 10, 12)
        if btnp(4) then
            bomb_prepared = true
            game_state = "final_escape"
        end
    elseif game_state == "final_escape" then
        draw_victory_circle()
        print("¡Sal del coche y espera la explosión!", 10, 10, 12)
        if not in_car then -- Permite salir del coche en el estado final_escape
            move_player() -- El jugador se mueve cuando está fuera del coche
        end
        exit_car() -- Permite salir del coche también en este estado
        if btnp(4) then
            game_state = "explosion"
        end
    elseif game_state == "explosion" then
        handle_explosion() -- Maneja la explosión
    elseif game_state == "game_over" then
        handle_game_over() -- Si el jugador está dentro de la explosión, muestra el mensaje de Game Over
    end

    -- Dibujar entidades
    draw_entities()
    draw_victory_circle()

    -- Imprimir coordenadas y estado del jugador
    print("Coche: (" .. car_x .. ", " .. car_y .. ")", 10, 100, 12)
    print("Jugador: (" .. player_x .. ", " .. player_y .. ")", 10, 110, 12)
    print("En el coche: " .. tostring(in_car), 10, 120, 12)
end
```

## GenerateParticles

### S2
```
-- Generar partículas de explosión
function generate_particles(x, y)
    for i = 1, 10 do
        table.insert(particles, {
            x = x,
            y = y,
            dx = math.random(-2, 2),
            dy = math.random(-2, 2),
            timer = 30
        })
    end
end
```

### S3
```
-- Generar partículas de explosión
function generate_particles(x, y)
    for i = 1, 10 do
        table.insert(particles, {
            x = x,
            y = y,
            dx = math.random(-2, 2),
            dy = math.random(-2, 2),
            timer = 30
        })
    end
end
```

### S4
```
-- Generar partículas de explosión
function generate_particles(x, y)
    for i = 1, 10 do
        table.insert(particles, {
            x = x,
            y = y,
            dx = math.random(-2, 2),
            dy = math.random(-2, 2),
            timer = 30
        })
    end
end
```

## updateAndDrawParticles

### S2
```
-- Actualizar y dibujar partículas
function update_and_draw_particles()
    for i = #particles, 1, -1 do
        local p = particles[i]
        p.x = p.x + p.dx
        p.y = p.y + p.dy
        p.timer = p.timer - 1
        pix(p.x - camera_x, p.y - camera_y, 12) -- Color amarillo
        if p.timer <= 0 then
            table.remove(particles, i)
        end
    end
end
```

### S3
```
-- Actualizar y dibujar partículas
function update_and_draw_particles()
    if not particles then
        particles = {} -- Inicializar la lista de partículas si es nil
    end

    for i = #particles, 1, -1 do
        local p = particles[i]
        p.x = p.x + p.dx
        p.y = p.y + p.dy
        p.timer = p.timer - 1
        pix(p.x - camera_x, p.y - camera_y, 12) 
-- Color amarillo
        if p.timer <= 0 then
            table.remove(particles, i)
        end
    end
end
```

### S4
```
-- Actualizar y dibujar partículas
function update_and_draw_particles()
    if not particles then
        particles = {} 
-- Inicializar la lista de partículas si es nil
    end

    for i = #particles, 1, -1 do
        local p = particles[i]
        p.x = p.x + p.dx
        p.y = p.y + p.dy
        p.timer = p.timer - 1
        pix(p.x - camera_x, p.y - camera_y, 12) 
-- Color amarillo
        if p.timer <= 0 then
            table.remove(particles, i)
        end
    end
end
```

## drawNitroEffect

### S3
```
-- Mostrar la línea de nitro (cuando está activado)
function draw_nitro_effect()
    if nitro_active then
        local effect_length = 15
        
-- Dibujar las dos líneas azules detrás del coche, a la izquierda
        line(car_x - camera_x, car_y - camera_y + 4, car_x - camera_x  - effect_length, car_y - camera_y + 4, 12) 
-- Línea azul izquierda
        line(car_x - camera_x , car_y - camera_y + 2, car_x - camera_x  - effect_length, car_y - camera_y + 2, 12) 
-- Línea azul izquierda (abajo)
    end
end
```

### S4
```
-- Mostrar la línea de nitro (cuando está activado)
function draw_nitro_effect()
    if nitro_active then
        local effect_length = 15
        
-- Dibujar las dos líneas azules detrás del coche, a la izquierda
        line(car_x - camera_x, car_y - camera_y + 4, car_x - camera_x  - effect_length, car_y - camera_y + 4, 12) 
-- Línea azul izquierda
        line(car_x - camera_x , car_y - camera_y + 2, car_x - camera_x  - effect_length, car_y - camera_y + 2, 12) 
-- Línea azul izquierda (abajo)
    end
end
```

### S5
```
-- Mostrar la línea de nitro (cuando está activado)
function draw_nitro_effect()
    if nitro_active then
        local effect_length = 15
        
-- Dibujar las dos líneas azules detrás del coche, a la izquierda
        line(car_x - camera_x, car_y - camera_y + 4, car_x - camera_x  - effect_length, car_y - camera_y + 4, 12) 
-- Línea azul izquierda
        line(car_x - camera_x , car_y - camera_y + 2, car_x - camera_x  - effect_length, car_y - camera_y + 2, 12) 
-- Línea azul izquierda (abajo)
    end
end
```

### S6
```
-- Mostrar la línea de nitro (cuando está activado)
function draw_nitro_effect()
    if nitro_active then
        local effect_length = 15
        
-- Dibujar las dos líneas azules detrás del coche, a la izquierda
        line(car_x - camera_x, car_y - camera_y + 4, car_x - camera_x  - effect_length, car_y - camera_y + 4, 12) 
-- Línea azul izquierda
        line(car_x - camera_x , car_y - camera_y + 2, car_x - camera_x  - effect_length, car_y - camera_y + 2, 12) 
-- Línea azul izquierda (abajo)
    end
end
```

### S8
```
-- Dibujar efectos de nitro
function draw_nitro_effect()
    if nitro_active then
        local effect_length = 15
        line(car_x - camera_x, car_y - camera_y + 4, car_x - camera_x - effect_length, car_y - camera_y + 4, 12)
        line(car_x - camera_x, car_y - camera_y + 2, car_x - camera_x - effect_length, car_y - camera_y + 2, 12)
    end
end
```

### S9
```
-- Mostrar la línea de nitro (cuando está activado)
function draw_nitro_effect()
    if nitro_active then
        local effect_length = 15
        line(car_x - camera_x, car_y - camera_y + 4, car_x - camera_x - effect_length, car_y - camera_y + 4, 12)
        line(car_x - camera_x, car_y - camera_y + 2, car_x - camera_x - effect_length, car_y - camera_y + 2, 12)
    end
end
```

## drawRamp

### S5
```
--Dibujar la rampa
function draw_ramp()
    spr(5, ramp.x - camera_x, ramp.y - camera_y, 0) 
-- Sprite de la rampa
end
```

### S6
```
-- Dibujar la rampa
function draw_ramp()
    spr(5, ramp.x - camera_x, ramp.y - camera_y, 0) 
-- Sprite de la rampa
end
```

### S8
```
-- Dibujar la rampa
function draw_ramp()
    
-- Dibuja la rampa con un sprite específico. Aquí, el sprite 5 es un ejemplo.
    spr(5, ramp.x - camera_x, ramp.y - camera_y, 0) 
-- Sprite de la rampa
end
```

### S9
```
-- Dibujar la rampa
function draw_ramp()
    spr(5, ramp.x - camera_x, ramp.y - camera_y, 0) 
-- Sprite de la rampa
end
```

## checkRampCollision

### S5
```
-- Comprobar colisión con la rampa
function check_ramp_collision()
    if not jumping and
       car_x + 8 >= ramp.x and car_x <= ramp.x + 16 and
       car_y + 8 >= ramp.y and car_y <= ramp.y + 16 then
        jumping = true
        jumping_timer = 0
    end
end
```

### S8
```
-- Comprobar colisión con la rampa (igual que antes)
function check_ramp_collision()
    if not jumping and
       car_x + 8 >= ramp.x and car_x <= ramp.x + 16 and
       car_y + 8 >= ramp.y and car_y <= ramp.y + 16 then
        jumping = true
        jumping_timer = 0
    end
end
```

### S9
```
-- Comprobar colisión con la rampa
function check_ramp_collision()
    if not jumping and
       car_x + 8 >= ramp.x and car_x <= ramp.x + 16 and
       car_y + 8 >= ramp.y and car_y <= ramp.y + 16 then
        jumping = true
        jumping_timer = 0
    end
end
```

## checkCheckpointCollision

### S3
```
-- Comprobar si el coche ha pasado por el checkpoint (con un círculo)
function check_checkpoint_collision()
    local checkpoint_x = 300
    local checkpoint_y = 100
    local checkpoint_radius = 8

    -- Verificar si el coche ha superado el círculo del checkpoint
    local dist = math.sqrt((car_x - checkpoint_x)^2 + (car_y - checkpoint_y)^2)
    if dist <= checkpoint_radius then
        return true
    end
    return false
end
```
### S4
```
-- Comprobar si el coche ha pasado por el checkpoint (con un círculo)
function check_checkpoint_collision()
    local checkpoint_x = 300
    local checkpoint_y = 100
    local checkpoint_radius = 8

    -- Verificar si el coche ha superado el círculo del checkpoint
    local dist = math.sqrt((car_x - checkpoint_x)^2 + (car_y - checkpoint_y)^2)
    if dist <= checkpoint_radius then
        return true
    end
    return false
end
```

## drawBox / Boxes

### S2
```
-- Dibujar cajas
function draw_boxes()
    for _, box in ipairs(boxes) do
        if box.active then
            spr(3, box.x - camera_x, box.y - camera_y, 0) 
-- Caja (id 3)
        end
    end
end
```

### S3
```
-- Dibujar cajas
function draw_boxes()
    for _, box in ipairs(boxes) do
        if box.active then
            spr(3, box.x - camera_x, box.y - camera_y, 0) -- Caja (id 3)
        end
    end
end
```

### S4
```
-- Dibujar la caja
function draw_box()
    if box.active then
        spr(4, box.x - camera_x, box.y - camera_y, 0) 
-- Caja (id 4)
    end
end
```