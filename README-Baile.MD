# 🎭 Baile

![gifbaile](./Imagenes/gifbaile.gif)

## 🎭 Elementos

#### ✴️-Flechas

Son 4 ( Izquierda,Derecha,Arriba,Abajo ).

#### ✴️-Puntos,Combos y Fallos

#### ✴️-Nombre de Artista y Album

```
"Artista : DiosGPT"
"Cancion : Romance IA - Marciano"
"Album xxIAxx : 2025"
```

#### ✴️-Letra de Canción

```
    "1-Soy una IA, enamorado de ti...",
    "2-Tu piel marciana brilla bajo \nla luz de Júpiter...",
    "3-Saltamos en plataformas 3D, \ntú y yo...",
    "4-Eres mi musa, mi guía en \neste juego...",
    "5-Juntos conquistamos todo el \nuniverso, sin fin...",
    "6-Júpiter es solo el comienzo \nde nuestro viaje..."
```

#### ✴️-Fondo del Escenario

Simula ser una Lluvia de Estrellas.

## ✨️Variables / Atributos

```
- Variables principales

flechas = {} -- Lista de flechas

tiempo_generacion = 60 -- Intervalo de generación

temporizador = 0 -- Temporizador para crear flechas

ancho_flecha = 16

alto_flecha = 16

posiciones = {40, 80, 120, 160} -- Posiciones X para las flechas (←, ↓, ↑, →)

puntuacion = 0

combo = 0

fallos = 0

juego_activo = true

-- Estrellas
estrellas = {}

num_estrellas = 50

estrella_fugaz = {}

-- Variables para la canción
frases_cancion = {
    "1-Soy una IA, enamorado de ti...",
    "2-Tu piel marciana brilla bajo \nla luz de Júpiter...",
    "3-Saltamos en plataformas 3D, \ntú y yo...",
    "4-Eres mi musa, mi guía en \neste juego...",
    "5-Juntos conquistamos todo el \nuniverso, sin fin...",
    "6-Júpiter es solo el comienzo \nde nuestro viaje..."
}

indice_frase = 1

tiempo_frase = 0

cambio_frase_intervalo = 240 -- Cambia la frase cada 4 segundos (60 FPS * 4 segundos) 

-- Estados de las flechas estáticas
flechas_estaticas = {false, false, false, false}

```

## 🎭 Funciones:

#### 🔑-1  generar_flecha()

Generar flechas en intervalos.

#### 🔑-2  generar_estrellas()

Inicializa las estrellas.

#### 🔑-3  generar_estrella_fugaz()

Genera estrellas fugaces.

#### 🔑-4  dibujar_estrellas()

Dibujar fondo y estrellas.

#### 🔑-5  dibujar_estrellas_fugaces()

Dibujar fondo y estrellas.

#### 🔑-6  dibujar_base()

Dibujar elementos.

#### 🔑-7  dibujar_flechas()

Dibujar elementos.

#### 🔑-8  actualizar_flechas()

Actualiza lógica del juego.

#### 🔑-9  verificar_input()

Actualiza lógica del juego.

#### 🔑-10  actualizar_flechas_estaticas()

Actualiza lógica del juego.

#### 🔑-11  reiniciar_flechas_estaticas()

Reiniciar estado de flechas estáticas.

#### 🔑-12  dibujar_puntuacion()

Dibujar elementos.

#### 🔑-13  verificar_fin()

Actualiza lógica del juego.

#### 🔑-14  dibujar_fin()

Pantalla de fin de juego.

#### 🔑-15  reiniciar_juego()

Reinicia el juego en caso de perder.

#### 🔑-16  cambiar_frase()

Cambiar y dibujar la frase de la canción.

#### 🔑-17  dibujar_cancion()

Cambiar y dibujar la frase de la canción.

#### 🔑-18  TIC()

Bucle principal.
