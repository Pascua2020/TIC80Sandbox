# 🎭 Modo Carrera Arcade

![gifgt](./Imagenes/modocarrera.gif)

## 🎭 Elementos

#### ▶️-Modo Carrera / Libre

![gt01](./Imagenes/gt01.png)

Carrera: Dar vueltas en un escenario.

![gt02](./Imagenes/gt02.png)

Libre: Correr sin ningún objetivo.

#### ▶️-Pista

Berna,Suiza

![gtb01](./Imagenes/gtb01.png)

#### ▶️-Coches

--Tochota Fulero ( Japón )

![gtc01](./Imagenes/gtc01.png)

--ZhoZho EgoEgo ( China )

![gtc02](./Imagenes/gtc02.png)

--Color

2 colores por cada coche.

![gtf1](./Imagenes/gtf1.png)
![gtf2](./Imagenes/gtf2.png)

#### ▶️-Direccion

Normal o Inversa.

![gte01](./Imagenes/gte1.png)
![gte02](./Imagenes/gte2.png)

#### ▶️-Con / Sin Lluvia

![gtd01](./Imagenes/gtd1.png)
![gtd02](./Imagenes/gtd2.png)

## ✨️Variables / Atributos

```
1
-- Configuración inicial
menu_actual = 1 -- Menú principal

2
selecciones = {1, 1, 1, 1, 1} -- Índices de selección

3
juego_empezado = false

4
color_arcoiris = 0 -- Variable para cambiar el color del texto

5
scroll_x = 250 -- Posición de inicio del scroll (extremo derecho)

-- Datos de las opciones
6
modos = {"Carrera Rápida", "Modo Libre"}

7
pistas = {"Berna Suiza"}

8
coches = {
    {nombre = "Tochota Fulero", sprite = {144, 145}, colores = {"Rojo", "Azul"}, descripcion = "País: Japón Modelo: 2023 Descripción: Un coche con una potencia que desafía las leyes de la física."}, -- Sprite 144 para rojo y 145 para azul

    {nombre = "Zhozho Egoego", sprite = {160, 161}, colores = {"Verde", "Amarillo"}, descripcion = "País: China Modelo: 2024 Descripción: Este coche tiene un diseño tan avanzado que ni siquiera los científicos saben cómo funciona."} 
-- Sprite 160 para verde y 161 para amarillo
}

9
climas = {"Con lluvia", "Sin lluvia"}

10
direcciones = {"Normal", "Inversa"}

-- Índice de colores específico por coche

11
indice_colores = {1, 1} -- Cada coche tiene su propio índice de color

```

## 🎭 Funciones:

#### 🔑-1  menu()

Menú principal.

#### 🔑-2  cambiar_opcion(opcion,direccion)

Cambia las opciones según la entrada del jugador.

#### 🔑-3  carrera()

Pantalla de carrera.

#### 🔑-4  wrap( valor,max )

Función auxiliar para envolver índices.

#### 🔑-5  dibujar_rectangulo_arcoiris(x,y,w,h)

Función para dibujar rectángulos con bordes animados arcoíris.

#### 🔑-6  TIC()

Bucle principal.

