# Armas

## DibujarPersonaje

### Pistola
```
-- Función para dibujar el personaje
function dibujar_personaje()
    spr(0, x_personaje, y_personaje)  -- Dibujar el sprite del personaje
end
```
### AK47
```
-- Función para dibujar el personaje
function dibujar_personaje()
    spr(0, x_personaje, y_personaje)  -- Dibujar el sprite del personaje
end
```
### Puño
```
-- Función para dibujar el personaje
function dibujar_personaje()
    spr(0, x_personaje, y_personaje,0)  -- Dibujar el sprite del personaje
end
```
### Katana
```
-- Función para dibujar el personaje
function dibujar_personaje()
    spr(257, x_personaje, y_personaje)
end
```
### Bazooka
```
-- Función para dibujar el personaje
function dibujar_personaje()
    spr(0, x_personaje, y_personaje)  -- Dibujar el sprite del personaje
end
```
### Granada
```
-- Función para dibujar el personaje
function dibujar_personaje()
    spr(0, x_personaje, y_personaje)  -- Dibujar el sprite del personaje
end
```
### Escopeta
```
-- Función para dibujar el personaje
function dibujar_personaje()
    spr(0, x_personaje, y_personaje)  -- Dibujar el sprite del personaje
end
```
### Minigun
```
-- Función para dibujar el personaje
function dibujar_personaje()
    spr(0, x_personaje, y_personaje)
end
```
### Lanzallamas
```
-- Función para dibujar el personaje
function dibujar_personaje()
    spr(0, x_personaje, y_personaje)
end
```
### Rifle
```
-- Función para dibujar el personaje
function dibujar_personaje()
    spr(0, x_personaje, y_personaje)
end
```
### Laser
```
-- Función para dibujar el personaje
function dibujar_personaje()
    spr(257, x_personaje, y_personaje)
end
```

## Recargar

### Todas
```
-- Función para recargar las armas
function recargar()
    if btnp(4) then
        if arma_actual == 1 then
            numero_cartuchos_pistola = 5
        elseif arma_actual == 2 then
            numero_cartuchos_ak47 = 5
        elseif arma_actual == 3 then
            numero_cartuchos_bazooka = 5
        elseif arma_actual == 4 then
            numero_cartuchos_escopeta = 5
        elseif arma_actual == 5 then
            numero_granadas = 5
        end
    end
end
```
### Pistola
```
-- Función para recargar el arma
function recargar()
    if btnp(4) then
        numero_balas = 20
    end
end
```
### AK47
```
-- Función para recargar el AK-47
function recargar()
    if btnp(4) then
        numero_cartuchos = 30  -- Restablecer las balas a 30
    end
end
```
### Puño
```
-- Función para recargar los golpes (restablecer)
function recargar()
    if btnp(4) then
        numero_golpes = 30  -- Restablecer los golpes a 30
    end
end
```
### Bazooka
```
-- Función para recargar la bazooka
function recargar()
    if btnp(4) then
        numero_cartuchos = 5  -- Restablecer los cartuchos a 5
    end
end
```
### Granada
```
-- Función para recargar las granadas
function recargar()
    if btnp(4) then
        numero_granadas = 5  -- Restablecer las granadas a 5
    end
end
```
### Escopeta
```
-- Función para recargar la escopeta
function recargar()
    if btnp(4) then
        numero_cartuchos = 5  -- Restablecer los cartuchos a 5
    end
end
```

### Minigun
```
-- Función para recargar la minigun
function recargar()
    if btnp(4) then
        energia = 100
    end
end
```
### Lanzallamas
```
-- Función para recargar el lanzallamas
function recargar()
    if btnp(4) then
        numero_combustible = 100
    end
end
```
### Rifle
```
-- Función para recargar el rifle eléctrico
function recargar()
    if btnp(4) then
        energia = 100
    end
end
```
### Laser
```
-- Función para recargar el láser
function recargar()
    if btnp(4) then
        energia = 100
    end
end
```

## MoverPersonaje

### Todas
```
-- Función para mover el personaje
function mover_personaje()
    if btn(0) then y_personaje = y_personaje - velocidad end  -- Flecha arriba
    if btn(1) then y_personaje = y_personaje + velocidad end  -- Flecha abajo
    if btn(2) then x_personaje = x_personaje - velocidad end  -- Flecha izquierda
    if btn(3) then x_personaje = x_personaje + velocidad end  -- Flecha derecha
end
```
### Pistola
```
-- Función para mover el personaje
function mover_personaje()
    if btn(0) then  -- Flecha arriba
        y_personaje = y_personaje - velocidad
    end
    if btn(1) then  -- Flecha abajo
        y_personaje = y_personaje + velocidad
    end
    if btn(2) then  -- Flecha izquierda
        x_personaje = x_personaje - velocidad
    end
    if btn(3) then  -- Flecha derecha
        x_personaje = x_personaje + velocidad
    end
end
```
### AK47
```
-- Función para mover el personaje
function mover_personaje()
    if btn(0) then y_personaje = y_personaje - velocidad end  -- Flecha arriba
    if btn(1) then y_personaje = y_personaje + velocidad end  -- Flecha abajo
    if btn(2) then x_personaje = x_personaje - velocidad end  -- Flecha izquierda
    if btn(3) then x_personaje = x_personaje + velocidad end  -- Flecha derecha
end
```
### Puño
```
-- Función para mover el personaje
function mover_personaje()
    if btn(0) then y_personaje = y_personaje - velocidad end  -- Flecha arriba
    if btn(1) then y_personaje = y_personaje + velocidad end  -- Flecha abajo
    if btn(2) then x_personaje = x_personaje - velocidad end  -- Flecha izquierda
    if btn(3) then x_personaje = x_personaje + velocidad end  -- Flecha derecha
end
```
### Katana
```
-- Función para mover al personaje
function mover_personaje()
    if btn(0) then y_personaje = y_personaje - velocidad end
    if btn(1) then y_personaje = y_personaje + velocidad end
    if btn(2) then x_personaje = x_personaje - velocidad end
    if btn(3) then x_personaje = x_personaje + velocidad end
end
```
### Bazooka
```
-- Función para mover el personaje
function mover_personaje()
    if btn(0) then y_personaje = y_personaje - velocidad end  -- Flecha arriba
    if btn(1) then y_personaje = y_personaje + velocidad end  -- Flecha abajo
    if btn(2) then x_personaje = x_personaje - velocidad end  -- Flecha izquierda
    if btn(3) then x_personaje = x_personaje + velocidad end  -- Flecha derecha
end
```
### Granada
```
-- Función para mover el personaje
function mover_personaje()
    if btn(0) then y_personaje = y_personaje - velocidad end  -- Flecha arriba
    if btn(1) then y_personaje = y_personaje + velocidad end  -- Flecha abajo
    if btn(2) then x_personaje = x_personaje - velocidad end  -- Flecha izquierda
    if btn(3) then x_personaje = x_personaje + velocidad end  -- Flecha derecha
end
```
### Escopeta
```
-- Función para mover el personaje
function mover_personaje()
    if btn(0) then y_personaje = y_personaje - velocidad end  -- Flecha arriba
    if btn(1) then y_personaje = y_personaje + velocidad end  -- Flecha abajo
    if btn(2) then x_personaje = x_personaje - velocidad end  -- Flecha izquierda
    if btn(3) then x_personaje = x_personaje + velocidad end  -- Flecha derecha
end
```
### Minigun
```
-- Función para mover el personaje
function mover_personaje()
    if btn(0) then y_personaje = y_personaje - velocidad end
    if btn(1) then y_personaje = y_personaje + velocidad end
    if btn(2) then x_personaje = x_personaje - velocidad end
    if btn(3) then x_personaje = x_personaje + velocidad end
end
```
### Lanzallamas
```
-- Función para mover el personaje
function mover_personaje()
    if btn(0) then y_personaje = y_personaje - velocidad end
    if btn(1) then y_personaje = y_personaje + velocidad end
    if btn(2) then x_personaje = x_personaje - velocidad end
    if btn(3) then x_personaje = x_personaje + velocidad end
end
```
### Rifle
```
-- Función para mover el personaje
function mover_personaje()
    if btn(0) then y_personaje = y_personaje - velocidad end
    if btn(1) then y_personaje = y_personaje + velocidad end
    if btn(2) then x_personaje = x_personaje - velocidad end
    if btn(3) then x_personaje = x_personaje + velocidad end
end
```
### Laser
```
-- Función para mover el personaje
function mover_personaje()
    if btn(0) then y_personaje = y_personaje - velocidad end
    if btn(1) then y_personaje = y_personaje + velocidad end
    if btn(2) then x_personaje = x_personaje - velocidad end
    if btn(3) then x_personaje = x_personaje + velocidad end
end
```

## agregarCoches

### Todas
```
-- Función para agregar más coches aleatorios
function agregar_coches()
    if math.random(1, 100) > 95 then  -- Asegura que los coches aparezcan con mayor frecuencia
        table.insert(coches, {x = 240, y = math.random(10, 130)})  -- Generar un coche en posición aleatoria
    end
end
```

### AK47
```
-- Función para agregar coches aleatorios
function agregar_coches()
    if math.random(1, 100) > 98 then  -- Asegura que los coches aparezcan raramente
        table.insert(coches, {x = 240, y = math.random(10, 130)})  -- Generar un coche en posición aleatoria
    end
end
```

### Bazooka
```
-- Función para agregar más coches aleatorios
function agregar_coches()
    if math.random(1, 100) > 95 then  -- Asegura que los coches aparezcan con mayor frecuencia
        table.insert(coches, {x = 240, y = math.random(10, 130)})  -- Generar un coche en posición aleatoria
    end
end
```

### Granada
```
-- Función para agregar más coches aleatorios
function agregar_coches()
    if math.random(1, 100) > 95 then  -- Asegura que los coches aparezcan con mayor frecuencia
        table.insert(coches, {x = 240, y = math.random(10, 130)})  -- Generar un coche en posición aleatoria
    end
end
```

### Escopeta
```
-- Función para agregar coches aleatorios
function agregar_coches()
    if math.random(1, 100) > 98 then  -- Asegura que los coches aparezcan raramente
        table.insert(coches, {x = 240, y = math.random(10, 130)})  -- Generar un coche en posición aleatoria
    end
end
```

## dibujarCoches

### Pistola
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

### AK47
```
-- Función para dibujar los coches
function dibujar_coches()
    for _, coche in ipairs(coches) do
        spr(48, coche.x, coche.y)  -- Dibujar cada coche con sprite id 48
    end
end
```

### Bazooka
```
-- Función para dibujar los coches
function dibujar_coches()
    for _, coche in ipairs(coches) do
        spr(48, coche.x, coche.y)  -- Dibujar cada coche con sprite id 48
    end
end
```

### Granada
```
-- Función para dibujar los coches
function dibujar_coches()
    for _, coche in ipairs(coches) do
        spr(48, coche.x, coche.y)  -- Dibujar cada coche con sprite id 48
    end
end
```

### Escopeta
```
-- Función para dibujar los coches
function dibujar_coches()
    for _, coche in ipairs(coches) do
        spr(48, coche.x, coche.y)  -- Dibujar cada coche con sprite id 48
    end
end
```

### Lanzallamas
```
-- Función para dibujar los coches
function dibujar_coches()
    for _, coche in ipairs(coches) do
        if not coche.colisionado then
            spr(48, coche.x, coche.y)
        end
    end
end
```

### Rifle
```
-- Función para dibujar los coches
function dibujar_coches()
    for _, coche in ipairs(coches) do
        if not coche.colisionado then
            spr(48, coche.x, coche.y)
        end
    end
end
```

## mostrarFrase

### Pistola
```
-- Función para mostrar las frases en colores arcoíris
function mostrar_frase()
    if disparando and (t - tiempo_frase_mostrar) < 90 then
        local frase = frase_actual
        local color_offset = t % 16  -- Cambiar el color con el tiempo para obtener el efecto arcoíris

        for i = 1, #frase do
            local letra = string.sub(frase, i, i)
            local color = (color_offset + i) % 16  -- Cambiar el color de cada letra
            print(letra, 40 + (i - 1) * 8, 100, color)
        end
    elseif (t - tiempo_frase_mostrar) >= 90 then
        disparando = false
        frase_actual = ""
    end
end
```

### Minigun
```
-- Función para mostrar las frases en colores arcoíris
function mostrar_frase()
    if disparando and (t - tiempo_frase_mostrar) < 90 then
        local frase = frase_actual
        local color_offset = t % 16

        for i = 1, #frase do
            local letra = string.sub(frase, i, i)
            local color = (color_offset + i) % 16
            print(letra, 40 + (i - 1) * 8, 100, color)
        end
    elseif (t - tiempo_frase_mostrar) >= 90 then
        disparando = false
        frase_actual = ""
    end
end
```

### Lanzallamas
```
-- Función para mostrar las frases en colores arcoíris
function mostrar_frase()
    if disparando and (t - tiempo_frase_mostrar) < 90 then
        local frase = frase_actual
        local color_offset = t % 16

        for i = 1, #frase do
            local letra = string.sub(frase, i, i)
            local color = (color_offset + i) % 16
            print(letra, 40 + (i - 1) * 8, 100, color)
        end
    elseif (t - tiempo_frase_mostrar) >= 90 then
        disparando = false
        frase_actual = ""
    end
end
```

### Rifle
```
-- Función para mostrar las frases en colores arcoíris
function mostrar_frase()
    if disparando and (t - tiempo_frase_mostrar) < 90 then
        local frase = frase_actual
        local color_offset = t % 16

        for i = 1, #frase do
            local letra = string.sub(frase, i, i)
            local color = (color_offset + i) % 16
            print(letra, 40 + (i - 1) * 8, 100, color)
        end
    elseif (t - tiempo_frase_mostrar) >= 90 then
        disparando = false
        frase_actual = ""
    end
end
```

### Laser
```
-- Función para mostrar frases en colores
function mostrar_frase()
    if disparando and (t - tiempo_frase_mostrar) < 90 then
        local frase = frase_actual
        local color_offset = t % 16

        for i = 1, #frase do
            local letra = string.sub(frase, i, i)
            local color = (color_offset + i) % 16
            print(letra, 40 + (i - 1) * 8, 100, color)
        end
    elseif (t - tiempo_frase_mostrar) >= 90 then
        disparando = false
        frase_actual = ""
    end
end
```

## detectarColision

### Pistola
```
-- Función para detectar colisión entre la balanza y los coches
function detectar_colision()
    for _, coche in ipairs(coches) do
        if not coche.colisionado then  -- Si el coche no ha sido colisionado
            if pos_balanza_x + 8 >= coche.x and pos_balanza_x <= coche.x + 16 and pos_balanza_y >= coche.y and pos_balanza_y <= coche.y + 16 then
                coche.colisionado = true  -- Marcar el coche como colisionado

                -- Generar la explosión para el coche
                explosion_tiempo = t  -- Registrar el tiempo de la explosión
                poder_jugador = math.random(3, 5)
                poder_tiempo = t  -- Registrar el tiempo en que se generó
                mostrar_poder = true  -- Habilitar la visualización del poder

                -- Generar puntos para la explosión
                for i = 1, 30 do
                    local angle = math.random() * math.pi * 2
                    local speed = math.random(2, 5)
                    table.insert(explosion_puntos, {
                        x = coche.x + 8,
                        y = coche.y + 8,
                        dx = math.cos(angle) * speed,
                        dy = math.sin(angle) * speed,
                        vida = math.random(30, 50)
                    })
                end
            end
        end
    end
end
```

### Puño
```
-- Función para detectar colisión entre golpes y coches
function detectar_colisiones()
    for i, golpe in ipairs(golpes) do
        for j, coche in ipairs(coches) do
            if golpe.x < coche.x + 8 and golpe.x + 8 > coche.x and
               golpe.y < coche.y + 8 and golpe.y + 8 > coche.y then
                -- Colisión detectada, eliminar coche y golpe
                table.remove(coches, j)
                table.remove(golpes, i)
                -- Generar partículas de explosión
                generar_particulas(coche.x, coche.y)
                break
            end
        end
    end
end
```

### Lanzallamas
```
-- Función para detectar colisiones con los coches
function detectar_colision()
    for _, coche in ipairs(coches) do
        if not coche.colisionado then
            for _, llama in ipairs(llamas) do
                if llama.x >= coche.x and llama.x <= coche.x + 16 and llama.y >= coche.y and llama.y <= coche.y + 16 then
                    coche.colisionado = true
                    -- Generar puntos para explosión
                    for i = 1, 30 do
                        local angle = math.random() * math.pi * 2
                        local speed = math.random(2, 5)
                        table.insert(explosion_puntos, {
                            x = coche.x + 8,
                            y = coche.y + 8,
                            dx = math.cos(angle) * speed,
                            dy = math.sin(angle) * speed,
                            vida = math.random(30, 50)
                        })
                    end
                end
            end
        end
    end
end
```

### Rifle
```
-- Función para detectar colisiones con los coches
function detectar_colision()
    for _, coche in ipairs(coches) do
        if not coche.colisionado then
            for _, rayo in ipairs(rayos) do
                if rayo.x_fin >= coche.x and rayo.x_fin <= coche.x + 16 and rayo.y_fin >= coche.y and rayo.y_fin <= coche.y + 16 then
                    coche.colisionado = true
                    -- Generar puntos para explosión
                    for i = 1, 30 do
                        local angle = math.random() * math.pi * 2
                        local speed = math.random(2, 5)
                        table.insert(explosion_puntos, {
                            x = coche.x + 8,
                            y = coche.y + 8,
                            dx = math.cos(angle) * speed,
                            dy = math.sin(angle) * speed,
                            vida = math.random(30, 50)
                        })
                    end
                end
            end
        end
    end
end
```

## dibujarExplosion

### Pistola
```
-- Función para dibujar los puntos de la explosión
function dibujar_explosion()
    for i, punto in ipairs(explosion_puntos) do
        if punto.vida > 0 then
            pix(punto.x, punto.y, 11)
            punto.x = punto.x + punto.dx
            punto.y = punto.y + punto.dy
            punto.vida = punto.vida - 1
        end
    end
end
```

### AK47
```
-- Función para dibujar las explosiones
function dibujar_explosiones()
    for i = #explosiones, 1, -1 do
        local explosion = explosiones[i]
        -- Dibujar la explosión como círculos de colores (creciendo con el tiempo)
        circ(explosion.x, explosion.y, explosion.tiempo, 8)
        explosion.tiempo = explosion.tiempo + 1

        -- Eliminar explosiones después de un tiempo
        if explosion.tiempo > 10 then
            table.remove(explosiones, i)
        end
    end
end
```

### Bazooka
```
-- Función para dibujar las explosiones (más violenta y con más colores)
function dibujar_explosiones()
    for i = #explosiones, 1, -1 do
        local explosion = explosiones[i]
        local radio = explosion.tiempo * 2  -- Radio más grande a medida que pasa el tiempo
        local colores = {8, 12, 11, 14, 7}  -- Colores para la explosión
        circ(explosion.x, explosion.y, radio, colores[(explosion.tiempo % #colores) + 1])  -- Colores cambiando
        explosion.tiempo = explosion.tiempo + 1

        -- Eliminar explosiones después de un tiempo
        if explosion.tiempo > explosion.max_tiempo then
            table.remove(explosiones, i)
        end
    end
end
```

### Granada
```
-- Función para dibujar las explosiones (más violenta y con más colores)
function dibujar_explosiones()
    for i = #explosiones, 1, -1 do
        local explosion = explosiones[i]
        local radio = explosion.tiempo * 2  -- Radio más grande a medida que pasa el tiempo
        local colores = {8, 12, 11, 14, 7}  -- Colores para la explosión
        circ(explosion.x, explosion.y, radio, colores[(explosion.tiempo % #colores) + 1])  -- Colores cambiando
        explosion.tiempo = explosion.tiempo + 1

        -- Eliminar explosiones después de un tiempo
        if explosion.tiempo > explosion.max_tiempo then
            table.remove(explosiones, i)
        end
    end
end
```

### Escopeta
```
-- Función para dibujar las explosiones
function dibujar_explosiones()
    for i = #explosiones, 1, -1 do
        local explosion = explosiones[i]
        -- Dibujar la explosión como círculos de colores (creciendo con el tiempo)
        circ(explosion.x, explosion.y, explosion.tiempo, 8)
        explosion.tiempo = explosion.tiempo + 1

        -- Eliminar explosiones después de un tiempo
        if explosion.tiempo > 10 then
            table.remove(explosiones, i)
        end
    end
end
```

### Lanzallamas
```
-- Función para dibujar la explosión
function dibujar_explosion()
    for i, punto in ipairs(explosion_puntos) do
        if punto.vida > 0 then
            pix(punto.x, punto.y, 11)
            punto.x = punto.x + punto.dx
            punto.y = punto.y + punto.dy
            punto.vida = punto.vida - 1
        end
    end
end
```

### Rifle
```
-- Función para dibujar la explosión
function dibujar_explosion()
    for i, punto in ipairs(explosion_puntos) do
        if punto.vida > 0 then
            pix(punto.x, punto.y, 11)
            punto.x = punto.x + punto.dx
            punto.y = punto.y + punto.dy
            punto.vida = punto.vida - 1
        end
    end
end
```

##TIC

### Todas

```

```

### Pistola
```

```

### Puño
```

```

### Katana
```

```

### Escopeta
```

```

### AK47
```

```

### Bazooka
```

```

### Rifle
```

```

### Lanzallamas
```

```

### Minigun
```

```

### Granada
```

```

### Laser
```

```

## verificarImpactos

### Escopeta

```

```

### AK47

```

```

### Granada

```

```