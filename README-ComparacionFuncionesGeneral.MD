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

## Todos los Check



## Todos los Update



## Todos los Draw

