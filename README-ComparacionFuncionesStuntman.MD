# Stuntman

## MoveCar

### S1
```
-- Movimiento del coche
function move_car()
    if btn(0) then car_y = car_y - car_speed end -- Arriba
    if btn(1) then car_y = car_y + car_speed end -- Abajo
    if btn(2) then car_x = car_x - car_speed end -- Izquierda
    if btn(3) then car_x = car_x + car_speed end -- Derecha
end
```

### S2
```
-- Movimiento del coche
function move_car()
    if btn(0) then car_y = car_y - car_speed end -- Arriba
    if btn(1) then car_y = car_y + car_speed end -- Abajo
    if btn(2) then car_x = car_x - car_speed end -- Izquierda
    if btn(3) then car_x = car_x + car_speed end -- Derecha
end
```

### S3
```
-- Movimiento del coche
function move_car()
    if btn(0) then car_y = car_y - car_speed end -- Arriba
    if btn(1) then car_y = car_y + car_speed end -- Abajo
    if btn(2) then car_x = car_x - car_speed end -- Izquierda
    if btn(3) then car_x = car_x + car_speed end -- Derecha

    -- Activar nitro si el botón adecuado es presionado
    if btn(4) then
        nitro_active = true
        car_speed = 6 -- Aumenta la velocidad del coche cuando se activa el nitro
    else
        nitro_active = false
        car_speed = 3 -- Restablece la velocidad normal
    end
end
```

### S4
```
-- Movimiento del coche
function move_car()
    if btn(0) then car_y = car_y - car_speed end -- Arriba
    if btn(1) then car_y = car_y + car_speed end -- Abajo
    if btn(2) then car_x = car_x - car_speed end -- Izquierda
    if btn(3) then car_x = car_x + car_speed end -- Derecha

    -- Activar nitro si el botón adecuado es presionado
    if btn(4) then
        nitro_active = true
        car_speed = 6 -- Aumenta la velocidad del coche cuando se activa el nitro
    else
        nitro_active = false
        car_speed = 3 -- Restablece la velocidad normal
    end
end
```

### S5
```
-- Movimiento del coche
function move_car()
    if not jumping then
        if btn(0) then car_y = car_y - car_speed end -- Arriba
        if btn(1) then car_y = car_y + car_speed end -- Abajo
        if btn(2) then car_x = car_x - car_speed end -- Izquierda
        if btn(3) then car_x = car_x + car_speed end -- Derecha

        -- Activar nitro si el botón adecuado es presionado
        if btn(4) then
            nitro_active = true
            car_speed = 6 -- Aumenta la velocidad del coche cuando se activa el nitro
        else
            nitro_active = false
            car_speed = 3 -- Restablece la velocidad normal
        end
    end
end
```

### S6
```
-- Movimiento del coche
function move_car()
    if not jumping then
        if btn(0) then car_y = car_y - car_speed end -- Arriba
        if btn(1) then car_y = car_y + car_speed end -- Abajo
        if btn(2) then car_x = car_x - car_speed end -- Izquierda
        if btn(3) then car_x = car_x + car_speed end -- Derecha

        -- Activar nitro si el botón adecuado es presionado
        if btn(4) then
            nitro_active = true
            car_speed = 6 -- Aumenta la velocidad del coche cuando se activa el nitro
        else
            nitro_active = false
            car_speed = 3 -- Restablece la velocidad normal
        end
    end
end
```

### S7
```
-- Movimiento del coche
function move_car()
    if not jumping then
        if btn(0) then car_y = car_y - car_speed end -- Arriba
        if btn(1) then car_y = car_y + car_speed end -- Abajo
        if btn(2) then car_x = car_x - car_speed end -- Izquierda
        if btn(3) then car_x = car_x + car_speed end -- Derecha

        -- Activar nitro si el botón adecuado es presionado
        if btn(4) then
            nitro_active = true
            car_speed = 6 -- Aumenta la velocidad del coche cuando se activa el nitro
        else
            nitro_active = false
            car_speed = 3 -- Restablece la velocidad normal
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
        if btn(0) then car_y = car_y - car_speed end -- Arriba
        if btn(1) then car_y = car_y + car_speed end -- Abajo
        if btn(2) then car_x = car_x - car_speed end -- Izquierda
        if btn(3) then car_x = car_x + car_speed end -- Derecha

        if btn(4) then
            nitro_active = true
            car_speed = 6 -- Velocidad aumentada con nitro
        else
            nitro_active = false
            car_speed = 3 -- Velocidad normal
        end
    end
end
```

### S10
```
-- Movimiento del coche
function move_car()
    if btn(0) then car_y = car_y - car_speed end -- Arriba
    if btn(1) then car_y = car_y + car_speed end -- Abajo
    if btn(2) then car_x = car_x - car_speed end -- Izquierda
    if btn(3) then car_x = car_x + car_speed end -- Derecha

    if btn(4) then
        nitro_active = true
        car_speed = 6 -- Velocidad aumentada con nitro
    else
        nitro_active = false
        car_speed = 3 -- Velocidad normal
    end
end
```

## movePlayer

### S1
```

```

### S10
```

```

## nuevaCamara

### S1
```

```

### S2
```

```

### S3
```

```

### S4
```

```

### S5
```

```

### S6
```

```

### S7
```

```

### S8
```

```
### S9
```

```

## updateCamera

### S1
```

```

### S2
```

```

### S3
```

```

### S4
```

```

### S5
```

```

### S6
```

```

### S7
```

```

### S8
```

```
### S9
```

```
### S10
```

```

## drawTextMultilineWithBG

### S1
```

```

### S2
```

```

### S3
```

```

### S4
```

```

### S5
```

```

### S6
```

```

### S7
```

```

## TIC

### S1
```

```

### S2
```

```

### S3
```

```

### S4
```

```

### S5
```

```

### S6
```

```

### S7
```

```

### S8
```

```
### S9
```

```
### S10
```

```

## GenerateParticles

### S2
```

```

### S3
```

```

### S4
```

```

## updateAndDrawParticles

### S2
```

```

### S3
```

```

### S4
```

```

## drawNitroEffect

### S3
```

```

### S4
```

```

### S5
```

```

### S6
```

```

### S8
```

```

### S9
```

```

## drawRamp

### S5
```

```

### S6
```

```

### S8
```

```

### S9
```

```

## checkRampCollision

### S5
```

```

### S8
```

```

### S9
```

```

## checkCheckpointCollision

### S3
```

```
### S4
```

```

## drawBox / Boxes

### S2
```

```

### S3
```

```

### S4
```

```