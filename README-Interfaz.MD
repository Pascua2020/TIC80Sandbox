# 🎭 Interfaz

![gifinterfaz](./Imagenes/interfaz.gif)

Interfaz Minimalista ( Estilo Cartas ) ,con Modo Táctico.

![interfaz](./Imagenes/Interfaz(ModoTactica).jpg)

## 🎭 Secciones

### ✨️Vida

-Vida

Descripción:

-Estres

Descripción:

-Ansiedad

Descripción:

### ✨️Arma

-Puño

Descripción: 

-Katana

Descripción: 

-Pistola

Descripción: 

-AK47

Descripción: 

-Escopeta

Descripción: 

-Granada

Descripción: 

-Rifle Electrico

Descripción: 

-Lanzallamas

Descripción: 

-Rayo Laser

Descripción: 

-Minigun

Descripción: 

-Bazooka

Descripción: 

### ✨️Vehículo

-01

Descripción: 

-02

Descripción: 

-03

Descripción: 

-04

Descripción: 

-05

Descripción: 

-06

Descripción: 

-07

Descripción: 

-08

Descripción: 

-09

Descripción: 

-10

Descripción: 

-11

Descripción: 

-12

Descripción: 

-13

Descripción: 

-14

Descripción: 

-15

Descripción: 


### ✨️Radio

-01

Descripción: 

-02

Descripción: 

-03

Descripción: 

-04

Descripción: 

-05

Descripción: 

-06

Descripción: 

-07

Descripción: 

-08

Descripción: 

-09

Descripción: 

-10

Descripción: 

-11

Descripción: 

-12

Descripción: 

-13

Descripción: 

-14

Descripción: 

-15

Descripción: 

-16

Descripción: 

-17

Descripción: 

-18

Descripción: 

-19

Descripción: 

-20

Descripción: 

-21

Descripción: 

-22

Descripción: 

### ✨️Interactuar

-01 DiosGPT

Descripción: 

-02 RC

Descripción: 

-03 Baile

Descripción: 

-04 Carrera Arcade

Descripción: 

-05 Wiki

Descripción: 

-06 Combate Vehicular

Descripción: 

-07 Galería de Tiro

Descripción: 

-08 Pinball

Descripción: 

-09 Trompos

Descripción: 

-10 Misión de Stuntman

Descripción: 

### ✨️Tactica

.

### ✨️Parametro

.

### ✨️Mapa

.

## 🎭 Variables / Atributos

```
-- Variables globales

modo_tactica = false 
-- Si el Modo Táctica está activado

carta_seleccionada = 1 
-- Índice de la carta seleccionada

nombres_cartas = { "Vida", "Arma", "Vehículo", "Radio", "Interactuar", "Táctica", "Parametro" } 
-- Nombres de las secciones

total_cartas = #nombres_cartas 
-- Cantidad total de secciones

seccion_activa = nil 
-- Sección activa (nil significa que no hay sección activa)

carta_seleccionada_en_seccion = 1 
-- Índice de la carta seleccionada dentro de la sección activa

-- Tabla de cartas por sección
cartas_por_seccion = {
    { "Vida", "Ansiedad", "Estres"   }, -- Vida
    { "Pistola", "Escopeta", "Rifle", "Francotirador", "Lanzacohetes", "SMG", "Granada" }, -- Arma
    { "Auto", "Moto", "Camión", "Helicóptero", "Barco", "Bicicleta", "Tanque" }, -- Vehículo
    { "Poesia de la Calle", "La IA Avanza", "Solos y Solas", "Antimainstream", "Joyas de la Historia", "Pesimista", "Bajones","Lenguaje","Idioma","Jesus te Ama","Cuarta Pared","Terror","Poesia","Naturaleza","Sonidos Animalunos","Grieta","Todo Vardo","Gobierno","Desgracias Economicas","No me importa","Cine Ultra 8K","Destapando Curros" }, -- Radio
    { "Hablar", "Abrir", "Cerrar", "Leer", "Usar", "Inspeccionar", "Escuchar" }, -- Interactuar
    { "Ataque Coordinado", "Defensa" }, -- Táctica
    { "Fuerza", "Velocidad", "Resistencia", "Agilidad", "Precisión", "Sigilo", "Inteligencia" } -- Parámetro
}

-- Tabla de sprites
sprites_cartas = { 7, 8, 9, 10, 11, 12, 13 } 
-- Sprites normales

sprites_seleccionados = { 23, 24, 25, 26, 27, 28, 29 } 
-- Sprites alternativos

-- Colores para las secciones, empezando en rojo (8) y terminando en azul (6)
colores_secciones = { 2, 3, 4, 5, 10, 8, 1 }

-- Descripciones de las cartas
descripciones_cartas = {
    ["Vida"] = "Te permite mantener tu salud en el juego.",
    ["Ansiedad"] = "Reduce tu capacidad de tomar decisiones rápidamente.",
    ["Estres"] = "Te hace perder claridad mental bajo presión.",
    ["Pistola"] = "Un arma de fuego básica, útil a corta distancia.",
    ["Escopeta"] = "Arma de largo alcance que dispersa proyectiles.",
    ["Rifle"] = "Perfecto para ataques a larga distancia y precisión.",
    ["Francotirador"] = "Un rifle de alta precisión, ideal para eliminar a los enemigos desde lejos.",
    ["Lanzacohetes"] = "Un arma de alto poder, útil para destruir vehículos y obstáculos.",
    ["SMG"] = "Subfusil ligero con alta cadencia de fuego.",
    ["Granada"] = "Explosivos de mano para causar daño en áreas amplias.",
    ["Auto"] = "Vehículo rápido y ágil para moverse por el mapa.",
    ["Moto"] = "Ideal para maniobras rápidas y esquivas.",
    ["Camión"] = "Vehículo pesado, útil para transportar objetos o crear barreras.",
    ["Helicóptero"] = "Permite volar y obtener vistas aéreas del mapa.",
    ["Barco"] = "Utilizado para moverse en agua, tiene buena velocidad.",
    ["Bicicleta"] = "Vehículo económico y fácil de maniobrar.",
    ["Tanque"] = "Vehículo blindado con gran poder destructivo y resistencia.",
    ["Poesia de la Calle"] = "Poemas urbanos que reflejan la realidad de la ciudad.",
    ["La IA Avanza"] = "La inteligencia artificial está alcanzando niveles preocupantes.",
    ["Solos y Solas"] = "El sentimiento de soledad en el mundo moderno.",
    ["Antimainstream"] = "Enfréntate a lo convencional con algo nuevo.",
    ["Joyas de la Historia"] = "Un vistazo a las maravillas perdidas de la humanidad.",
    ["Pesimista"] = "Una visión sombría del futuro.",
    ["Bajones"] = "Momentos difíciles que nos afectan emocionalmente.",
    ["Lenguaje"] = "La forma en que nos comunicamos y nos entendemos.",
    ["Idioma"] = "La riqueza de los distintos idiomas del mundo.",
    ["Jesus te Ama"] = "Mensaje de esperanza y amor universal.",
    ["Cuarta Pared"] = "Romper la barrera entre la realidad y el entretenimiento.",
    ["Terror"] = "La sensación de miedo que nos envuelve.",
    ["Poesia"] = "Expresión artística a través de palabras.",
    ["Naturaleza"] = "El mundo natural y su belleza indescriptible.",
    ["Sonidos Animalunos"] = "Sonidos que emiten los animales en su hábitat.",
    ["Grieta"] = "La brecha en la sociedad moderna.",
    ["Todo Vardo"] = "Palabras sabias que nos guían en la vida.",
    ["Gobierno"] = "El sistema que gobierna nuestras naciones.",
    ["Desgracias Economicas"] = "La crisis económica que afecta a muchos.",
    ["No me importa"] = "El rechazo a la opresión y las expectativas sociales.",
    ["Cine Ultra 8K"] = "La revolución en la tecnología del cine.",
    ["Destapando Curros"] = "Exponiendo las corrupciones y malversaciones del poder."
}

local scroll_x = 0
```


## 🎭 Funciones

### 🔑 TIC()

Bucle Principal.