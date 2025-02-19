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

```

### AK47
```

```

### Bazooka
```

```

### Granada
```

```

### Escopeta
```

```

### Lanzallamas
```

```

### Rifle
```

```

## mostrarFrase

### Pistola
```

```

### Minigun
```

```

### Lanzallamas
```

```

### Rifle
```

```

### Laser
```

```

## detectarColision

### Pistola
```

```

### Puño
```

```

### Lanzallamas
```

```

### Rifle
```

```

## dibujarExplosion
```

```

### Pistola
```

```

### AK47
```

```

### Bazooka
```

```

### Granada
```

```

### Escopeta
```

```

### Lanzallamas
```

```

### Rifle
```

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